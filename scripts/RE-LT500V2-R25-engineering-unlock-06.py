#!/usr/bin/env python3
from pathlib import Path
import argparse, hashlib, lzma, struct, zlib

UIMAGE_MAGIC=b'\x27\x05\x19\x56'
SQUASH_MAGIC=b'hsqs'
FWTOOL_MAGIC=b'\xde\xad\xc0\xde'
STOCK_FW_OFFSET=0x50000
ROOT_OLD=b'$1$fXMCMnxb$6CrSBrlB9vPMJzXbXMa/q1'
ROOT_NEW=b'$1$R25eng06$ycPyEn56neazK0YckFy280'

PLAT_START=b"#\n# Copyright (C) 2010 OpenWrt.org\n#\n\n. /lib/ramips.sh\n"
PLAT_END=b"append sysupgrade_pre_upgrade blink_led\n"
UNLOCK_PLATFORM=b'''\
. /lib/ramips.sh
PART_NAME=firmware
RAMFS_COPY_DATA=/lib/ramips.sh
platform_check_image(){
 [ "$#" -gt 1 ]&&return 1
 [ "$(get_magic_long "$1")" = 27051956 ]&&return 0
 oem-check -b "$(ramips_board_name)" -o 0x30000 -f "$1"
}
platform_do_upgrade(){
 local s=
 [ "$SAVE_CONFIG" -eq 1 ]&&s="-j $CONF_TAR"
 [ "$(get_magic_long "$1")" = 27051956 ]&&OEM_UPGRADE_BOOT=0
 if [ "$OEM_UPGRADE_BOOT" -eq 1 ];then
  if [[ "$(get_oem_boot_version "$1")" -gt "$(oem_boot_version)" ]];then
   get_image "$1"|dd bs=2k count=96 conv=sync 2>/dev/null|mtd write - "${BOOT_NAME:-u-boot}" >>$SYSUPGRADE_LOG_FILE 2>&1
  fi
  get_image "$1"|dd bs=2k skip=160 conv=sync 2>/dev/null|mtd $s write - "${PART_NAME:-firmware}" >>$SYSUPGRADE_LOG_FILE 2>&1
 else
  get_image "$1"|mtd $s write - "${PART_NAME:-firmware}" >>$SYSUPGRADE_LOG_FILE 2>&1
 fi
}
blink_led(){ . /etc/diag.sh;set_state upgrade;}
append sysupgrade_pre_upgrade blink_led
'''

EXPECTED_COUNTS={
    'dropbear_debug_gate':1,
    'telnet_debug_gate':1,
    'root_shadow_hash':1,
    'device_derived_root_password':1,
    'serial_console_gate':1,
    'sysupgrade_oem_rsa_gate':1,
    'automatic_ota_cron':1,
    'automatic_ota_online_report':1,
    'cwmp_vendor_autoenable':1,
    'hcsh_default_disabled':1,
    'showuser_default':1,
    'sysauth_showuser_override':3,
}

def sha256(x): return hashlib.sha256(x).hexdigest()

def xz_streams(data):
    magic=b'\xfd7zXZ\x00'; pos=0
    while True:
        off=data.find(magic,pos)
        if off<0: return
        pos=off+1
        try:
            d=lzma.LZMADecompressor(format=lzma.FORMAT_XZ)
            plain=d.decompress(data[off:])
            if not d.eof: continue
            consumed=len(data[off:])-len(d.unused_data)
            yield off,consumed,plain
        except lzma.LZMAError:
            pass

def same_len_stmt(old: bytes, stmt: bytes):
    assert old.endswith(b'\n') and len(stmt)+1 <= len(old)
    return stmt + b' '*(len(old)-1-len(stmt)) + b'\n'

def replace_once(buf: bytes, old: bytes, new: bytes, label: str, hits: dict):
    n=buf.count(old)
    if n != 1:
        raise ValueError(f'{label}: expected exactly 1 occurrence in selected stream, got {n}')
    if len(old)!=len(new):
        raise ValueError(f'{label}: length mismatch {len(old)} != {len(new)}')
    hits[label]=hits.get(label,0)+1
    return buf.replace(old,new,1)

def patch_plain(plain: bytes):
    hits={}

    drop_line=b'\t[ "$(bdinfo dbg)" == OK ] || return\n'
    if b'/etc/dropbear/dropbear_rsa_host_key' in plain and drop_line in plain:
        plain=replace_once(plain,drop_line,same_len_stmt(drop_line,b'\ttrue'),'dropbear_debug_gate',hits)

    cron_line=b'\t[ -x /sbin/autoupgrade ] && {\n'
    if b'PROG=/usr/sbin/crond' in plain and cron_line in plain:
        plain=replace_once(plain,cron_line,same_len_stmt(cron_line,b'\tfalse && {'),'automatic_ota_cron',hits)

    report_line=b'/sbin/autoupgrade report &\n'
    if report_line in plain:
        plain=replace_once(plain,report_line,same_len_stmt(report_line,b'true'),'automatic_ota_online_report',hits)

    if b'PROG=/usr/sbin/telnetd' in plain and drop_line in plain:
        plain=replace_once(plain,drop_line,same_len_stmt(drop_line,b'\ttrue'),'telnet_debug_gate',hits)

    if ROOT_OLD in plain:
        if plain.count(ROOT_OLD)!=1: raise ValueError('root_shadow_hash: multiple hits')
        plain=plain.replace(ROOT_OLD,ROOT_NEW,1)
        hits['root_shadow_hash']=hits.get('root_shadow_hash',0)+1

    passwd_cond=b'[ "$(bdinfo dbg)" == OK -o "$(uci -q get system.@system[0].ttylogin)" == 1 ] || {\n'
    if passwd_cond in plain:
        suffix=b'|| {\n'
        repl=b'true '+b' '*(len(passwd_cond)-len(b'true ')-len(suffix))+suffix
        plain=replace_once(plain,passwd_cond,repl,'device_derived_root_password',hits)

    console_cond=b'\tif [ "$(bdinfo dbg)" == OK ]; then\n'
    if b'console_login_fixup' in plain and console_cond in plain:
        suffix=b'; then\n'
        repl=b'\tif true'+b' '*(len(console_cond)-len(b'\tif true')-len(suffix))+suffix
        plain=replace_once(plain,console_cond,repl,'serial_console_gate',hits)

    if b'platform_check_image()' in plain and b'oem-check' in plain and PLAT_START in plain:
        s=plain.find(PLAT_START); e=plain.find(PLAT_END,s)
        if e<0: raise ValueError('platform.sh end anchor not found')
        e += len(PLAT_END); old=plain[s:e]
        if len(UNLOCK_PLATFORM)>len(old): raise ValueError('unlock platform script too large')
        pad=len(old)-len(UNLOCK_PLATFORM)
        new=UNLOCK_PLATFORM + (b'#'+b'U'*(pad-2)+b'\n' if pad>=2 else b'\n'*pad)
        if len(new)!=len(old): raise ValueError('platform same-size construction failed')
        plain=plain[:s]+new+plain[e:]
        hits['sysupgrade_oem_rsa_gate']=hits.get('sysupgrade_oem_rsa_gate',0)+1

    show0=b"uci set luci.main.showuser='0'"
    show1=b"uci set luci.main.showuser='1'"
    if show0 in plain:
        if plain.count(show0)!=1: raise ValueError('showuser_default: multiple hits in stream')
        plain=plain.replace(show0,show1,1)
        hits['showuser_default']=hits.get('showuser_default',0)+1

    cond=b"if (conf.main.showuser == '1') then"
    if cond in plain and b'luci_username' in plain:
        repl=b'if true then'+b' '*(len(cond)-len(b'if true then'))
        n=plain.count(cond)
        plain=plain.replace(cond,repl)
        hits['sysauth_showuser_override']=hits.get('sysauth_showuser_override',0)+n

    cwmp_auto=b'        uci set cwmp.info.enable="on"\n'
    if b'/tmp/vendor_spc' in plain and cwmp_auto in plain:
        plain=replace_once(plain,cwmp_auto,same_len_stmt(cwmp_auto,b'        true'),'cwmp_vendor_autoenable',hits)

    hcsh_anchor=b'PROG=/usr/sbin/hcshd\n'
    hcsh_open=b'\tprocd_open_instance\n'
    if hcsh_anchor in plain:
        a=plain.find(hcsh_anchor)
        p=plain.find(hcsh_open,a,a+512)
        if p < 0: raise ValueError('hcsh_default_disabled: start line not found near hcshd anchor')
        repl=same_len_stmt(hcsh_open,b'\treturn 0')
        plain=plain[:p]+repl+plain[p+len(hcsh_open):]
        hits['hcsh_default_disabled']=hits.get('hcsh_default_disabled',0)+1

    return plain,hits

def compress_like_squashfs(plain: bytes):
    filters=[{
        'id':lzma.FILTER_LZMA2,'dict_size':262144,'lc':3,'lp':0,'pb':2,
        'mode':lzma.MODE_NORMAL,'nice_len':64,'mf':lzma.MF_BT3,'depth':0,
    }]
    return lzma.compress(plain,format=lzma.FORMAT_XZ,check=lzma.CHECK_CRC32,filters=filters)

def fwtool_crc_raw(data: bytes):
    table=[]
    for n in range(256):
        c=n
        for _ in range(8): c=(c>>1)^0xedb88320 if c&1 else c>>1
        table.append(c)
    val=0xffffffff
    for x in data: val=table[(val & 0xff)^x] ^ (val >> 8)
    return val & 0xffffffff

def repair_fwtool_info_crc(sysup: bytes):
    out=bytearray(sysup)
    i=out.rfind(b'FWx0')
    if i < 0 or len(out)-i != 16: raise ValueError('final fwtool trailer not found')
    if out[i+8] != 1: raise ValueError(f'unexpected final fwtool record type {out[i+8]}')
    crc=fwtool_crc_raw(bytes(out[:i]))
    out[i+4:i+8]=struct.pack('>I',crc)
    return bytes(out), i, crc

def verify_fwtool_info_crc(sysup: bytes):
    i=sysup.rfind(b'FWx0')
    if i < 0: return False,None,None
    stored=struct.unpack('>I',sysup[i+4:i+8])[0]
    calc=fwtool_crc_raw(sysup[:i])
    return stored==calc,stored,calc

def verify_uimage(sysup: bytes):
    if sysup[:4]!=UIMAGE_MAGIC: raise ValueError('not legacy uImage')
    hdr=bytearray(sysup[:64]); stored_h=struct.unpack('>I',hdr[4:8])[0]
    stored_d=struct.unpack('>I',hdr[24:28])[0]; size=struct.unpack('>I',hdr[12:16])[0]
    hdr[4:8]=b'\0'*4
    calc_h=zlib.crc32(hdr)&0xffffffff
    calc_d=zlib.crc32(sysup[64:64+size])&0xffffffff
    return stored_h,calc_h,stored_d,calc_d,size

def main():
    ap=argparse.ArgumentParser()
    ap.add_argument('flash')
    ap.add_argument('-o','--output',default='RE-LT500V2-R25-ENG06-sysupgrade.bin')
    args=ap.parse_args()
    original=Path(args.flash).read_bytes(); img=bytearray(original)
    if img[STOCK_FW_OFFSET:STOCK_FW_OFFSET+4]!=UIMAGE_MAGIC:
        raise SystemExit('unexpected layout: no R25 uImage at 0x50000')
    ksize=struct.unpack('>I',img[STOCK_FW_OFFSET+12:STOCK_FW_OFFSET+16])[0]
    roff=STOCK_FW_OFFSET+64+ksize
    if img[roff:roff+4]!=SQUASH_MAGIC: raise SystemExit(f'no SquashFS at 0x{roff:x}')
    used=struct.unpack('<Q',img[roff+40:roff+48])[0]
    root=bytes(img[roff:roff+used]); out=bytearray(root)
    changed=[]; totals={}
    for off,consumed,plain in list(xz_streams(root)):
        plain2,hits=patch_plain(plain)
        if not hits: continue
        comp=compress_like_squashfs(plain2)
        if len(comp)>consumed:
            raise SystemExit(f'stream 0x{off:x} grew {len(comp)} > {consumed} for {hits}')
        padding=consumed-len(comp)
        if padding%4: raise SystemExit(f'stream 0x{off:x}: XZ padding not multiple of 4 ({padding})')
        out[off:off+consumed]=comp+b'\0'*padding
        d=lzma.LZMADecompressor(format=lzma.FORMAT_XZ)
        vp=d.decompress(bytes(out[off:off+consumed]))
        if vp!=plain2: raise SystemExit(f'stream 0x{off:x}: verify mismatch')
        changed.append((off,consumed,len(comp),padding,hits))
        for k,v in hits.items(): totals[k]=totals.get(k,0)+v

    if totals != EXPECTED_COUNTS:
        missing={k:v for k,v in EXPECTED_COUNTS.items() if totals.get(k)!=v}
        extra={k:v for k,v in totals.items() if k not in EXPECTED_COUNTS}
        raise SystemExit(f'patch coverage mismatch totals={totals} expected_mismatch={missing} extra={extra}')

    img[roff:roff+used]=out
    sysup=bytes(img[STOCK_FW_OFFSET:])
    if FWTOOL_MAGIC not in sysup[-4096:]: raise SystemExit('fwtool metadata missing')
    sysup,fwpos,fwcrc=repair_fwtool_info_crc(sysup)
    fwok,fwstored,fwcalc=verify_fwtool_info_crc(sysup)
    if not fwok: raise SystemExit('fwtool CRC verification failed')
    sh,ch,sd,cd,sz=verify_uimage(sysup)
    if sh!=ch or sd!=cd: raise SystemExit('uImage CRC verification failed')
    Path(args.output).write_bytes(sysup)

    print('input_sha256='+sha256(original))
    print(f'rootfs_offset=0x{roff:x}')
    print(f'rootfs_bytes_used=0x{used:x}')
    for off,oldc,newc,pad,hits in changed:
        labels=','.join(f'{k}:{v}' for k,v in sorted(hits.items()))
        print(f'patch_stream=0x{off:x} old_comp={oldc} new_comp={newc} padding={pad} labels={labels}')
    print('patch_totals='+','.join(f'{k}:{totals[k]}' for k in sorted(totals)))
    print(f'fwtool_trailer_offset=0x{fwpos:x}')
    print(f'fwtool_crc=0x{fwcrc:08x} verified=yes')
    print(f'uimage_payload_size={sz}')
    print(f'uimage_header_crc=0x{sh:08x} verified=yes')
    print(f'uimage_data_crc=0x{sd:08x} verified=yes')
    print(f'output_size={len(sysup)}')
    print('output_sha256='+sha256(sysup))

if __name__=='__main__':
    main()
