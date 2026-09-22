#!/usr/bin/env python3
from pathlib import Path
import argparse

ROOT_NEW='$1$R25eng06$ycPyEn56neazK0YckFy280'
ROOT_OLD='$1$fXMCMnxb$6CrSBrlB9vPMJzXbXMa/q1'
UNLOCK_PLATFORM='''. /lib/ramips.sh
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

def load(root, rel):
    p=root/rel
    if not p.is_file():
        raise SystemExit(f'missing /{rel}')
    return p, p.read_text(errors='surrogateescape')

def one(root, rel, old, new, label):
    p,s=load(root,rel)
    n=s.count(old)
    if n != 1:
        raise SystemExit(f'{label}: /{rel}: expected 1 hit, got {n}')
    p.write_text(s.replace(old,new,1), errors='surrogateescape')
    print(f'PATCH {label} /{rel}')

def main():
    ap=argparse.ArgumentParser()
    ap.add_argument('rootfs')
    a=ap.parse_args()
    root=Path(a.rootfs)

    one(root,'etc/init.d/dropbear','\t[ "$(bdinfo dbg)" == OK ] || return\n','\ttrue\n','dropbear_debug_gate')
    one(root,'etc/init.d/telnet','\t[ "$(bdinfo dbg)" == OK ] || return\n','\ttrue\n','telnet_debug_gate')
    one(root,'etc/shadow',ROOT_OLD,ROOT_NEW,'root_shadow_hash')
    one(root,'etc/uci-defaults/11_fix_passwd','[ "$(bdinfo dbg)" == OK -o "$(uci -q get system.@system[0].ttylogin)" == 1 ] || {\n','true || {\n','device_derived_root_password')
    one(root,'lib/preinit/99_00_console','\tif [ "$(bdinfo dbg)" == OK ]; then\n','\tif true; then\n','serial_console_gate')

    p,_=load(root,'lib/upgrade/platform.sh')
    p.write_text(UNLOCK_PLATFORM)
    print('PATCH sysupgrade_oem_rsa_gate /lib/upgrade/platform.sh')

    one(root,'etc/init.d/cron','\t[ -x /sbin/autoupgrade ] && {\n','\tfalse && {\n','automatic_ota_cron')
    one(root,'etc/pingcheck/online.d/99-autoupgrade','/sbin/autoupgrade report &\n','true\n','automatic_ota_online_report')
    one(root,'etc/uci-defaults/10_user',"uci set luci.main.showuser='0'","uci set luci.main.showuser='1'",'showuser_default')

    p,s=load(root,'usr/lib/lua/luci/view/themes/dark/sysauth.htm')
    old="if (conf.main.showuser == '1') then"
    n=s.count(old)
    if n != 3:
        raise SystemExit(f'sysauth_showuser: expected 3 hits in shared template, got {n}')
    p.write_text(s.replace(old,'if true then'))
    print(f'PATCH sysauth_showuser shared-theme-template hits={n}')
    for theme in ('dark','bootstrap','light'):
        _,v=load(root,f'usr/lib/lua/luci/view/themes/{theme}/sysauth.htm')
        if old in v or v.count('if true then') < 3:
            raise SystemExit(f'sysauth_showuser verify failed for {theme}')

    one(root,'etc/init.d/cwmp','        uci set cwmp.info.enable="on"\n','        true\n','cwmp_vendor_autoenable')

    p,s=load(root,'etc/init.d/hcsh')
    old='start_service() {\n\tprocd_open_instance\n'
    new='start_service() {\n\treturn 0\n'
    if s.count(old) != 1:
        raise SystemExit(f'hcsh_default_disabled: expected 1 hit, got {s.count(old)}')
    p.write_text(s.replace(old,new,1))
    print('PATCH hcsh_default_disabled /etc/init.d/hcsh')

    print('ENG06_ROOTFS_PATCH=PASS')

if __name__=='__main__':
    main()
