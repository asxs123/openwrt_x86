#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

# Modify default theme
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Modify hostname
#sed -i 's/OpenWrt/P3TERX-Router/g' package/base-files/files/bin/config_generate

#!/bin/bash
#
# Copyright (c) 2019-2023 SmallProgram <https://github.com/smallprogram>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/smallprogram/OpenWrtAction
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

is_wsl2op=$1

# Modify default IP
sed -i 's/192.168.1.1/192.168.1.3/g' package/base-files/files/bin/config_generate

rm -rf ./feeds/kiddin9/luci-theme-argon
rm -rf ./feeds/kiddin9/luci-app-argon-config
rm -rf ./feeds/kiddin9/luci-app-autotimeset
rm -rf ./feeds/kiddin9/luci-app-baidupcs-web
rm -rf ./feeds/kiddin9/luci-app-cifs-mount
rm -rf ./feeds/kiddin9/luci-app-filetransfer
rm -rf ./feeds/kiddin9/luci-app-nfs
rm -rf ./feeds/kiddin9/luci-app-vlmcsd
rm -rf ./feeds/kiddin9/luci-lib-fs
rm -rf ./feeds/kiddin9/vlmcsd
rm -rf ./feeds/kiddin9/aliyundrive-webdav
rm -rf ./feeds/kiddin9/baidupcs-web
rm -rf ./feeds/kiddin9/gowebdav
rm -rf ./feeds/kiddin9/homeredirect
rm -rf ./feeds/kiddin9/luci-app-LingTiGameAcc
rm -rf ./feeds/kiddin9/luci-app-airplay2
rm -rf ./feeds/kiddin9/luci-app-aliyundrive-webdav
rm -rf ./feeds/kiddin9/luci-app-arpbind
rm -rf ./feeds/kiddin9/luci-app-cpulimit
rm -rf ./feeds/kiddin9/luci-app-fileassistant
rm -rf ./feeds/kiddin9/luci-app-gowebdav
rm -rf ./feeds/kiddin9/luci-app-homeredirect
rm -rf ./feeds/kiddin9/luci-app-pushbot
rm -rf ./feeds/kiddin9/luci-app-qbittorrent
rm -rf ./feeds/kiddin9/luci-app-rclone
rm -rf ./feeds/kiddin9/luci-app-smartdns
rm -rf ./feeds/kiddin9/luci-app-socat
rm -rf ./feeds/kiddin9/luci-app-syncdial
rm -rf ./feeds/kiddin9/luci-app-uugamebooster
rm -rf ./feeds/kiddin9/luci-app-vsftpd
rm -rf ./feeds/kiddin9/luci-app-zerotier
rm -rf ./feeds/kiddin9/qBittorrent-static
rm -rf ./feeds/kiddin9/qBittorrent
rm -rf ./feeds/kiddin9/smartdns
rm -rf ./feeds/kiddin9/uugamebooster
rm -rf ./feeds/kiddin9/vsftpd-alt
rm -rf ./feeds/kiddin9/luci-app-diskman
rm -rf ./feeds/kiddin9/homebox
rm -rf ./feeds/kiddin9/luci-app-cpufreq
rm -rf ./feeds/kiddin9/luci-app-fan
rm -rf ./feeds/kiddin9/luci-app-homebox
rm -rf ./feeds/kiddin9/luci-app-tasks
rm -rf ./feeds/kiddin9/luci-lib-mac-vendor

rm -rf ./package/lean/luci-app-adguardhome
git clone https://github.com/rufengsuixing/luci-app-adguardhome.git ./package/lean/luci-app-adguardhome

# mosdns

# find ./ | grep Makefile | grep v2ray-geodata | xargs rm -f
# find ./ | grep Makefile | grep mosdns | xargs rm -f
rm -rf ./feeds/luci/applications/luci-app-mosdns/
rm -rf ./feeds/packages/net/mosdns/
rm -rf ./package/custom_packages/mosdns
# rm -rf feeds/packages/net/v2ray-geodata/
git clone https://github.com/sbwml/luci-app-mosdns -b v5 ./package/custom_packages/mosdns
# git clone https://github.com/sbwml/v2ray-geodata ./package/custom_packages/v2ray-geodata


# if [ ! -d "./package/lean/luci-app-argon-config" ]; then git clone -b 18.06 https://github.com/jerrykuku/luci-app-argon-config.git ./package/lean/luci-app-argon-config;   else cd ./package/lean/luci-app-argon-config; git stash; git stash drop; git pull; cd ..; cd ..; cd ..; fi;
# if [ ! -d "./package/lean/luci-app-adguardhome" ]; then git clone https://github.com/rufengsuixing/luci-app-adguardhome.git ./package/lean/luci-app-adguardhome;   else cd ./package/lean/luci-app-adguardhome; git stash; git stash drop; git pull; cd ..; cd ..; cd ..; fi;
# git clone https://github.com/jerrykuku/lua-maxminddb.git
# git clone https://github.com/jerrykuku/luci-app-vssr.git
# git clone https://github.com/lisaac/luci-app-dockerman.git


# Reset drive type
# sed -i 's/(dmesg | grep .*/{a}${b}${c}${d}${e}${f}/g' package/lean/autocore/files/x86/autocore
# sed -i '/h=${g}.*/d' package/lean/autocore/files/x86/autocore
# sed -i 's/echo $h/echo $g/g' package/lean/autocore/files/x86/autocore

# Close running yards
# sed -i 's/console=tty0//g'  target/linux/x86/image/Makefile


rm -rf ./feeds/luci/third/luci-theme-argon/htdocs/luci-static/argon/background/
mkdir -p ./feeds/luci/third/luci-theme-argon/htdocs/luci-static/argon/background/

if [ ! -n "$is_wsl2op" ]; then
    # Add default login background
    cp -r $GITHUB_WORKSPACE/source/video/* ./feeds/luci/third/luci-theme-argon/htdocs/luci-static/argon/background/
    cp -r $GITHUB_WORKSPACE/source/img/* ./feeds/luci/third/luci-theme-argon/htdocs/luci-static/argon/background/

    # Inject download package
    mkdir -p $GITHUB_WORKSPACE/openwrt/dl
    cp -r $GITHUB_WORKSPACE/library/* $GITHUB_WORKSPACE/openwrt/dl/

    # Fixed qmi_wwan_f complie error
    # cp -r $GITHUB_WORKSPACE/patches/qmi_wwan_f.c $GITHUB_WORKSPACE/openwrt/package/wwan/driver/fibocom_QMI_WWAN/src/qmi_wwan_f.c

else
    # Add default login background
    cp -r /home/$USER/OpenWrtAction/source/video/* ./feeds/third/luci-theme-argon/htdocs/luci-static/argon/background/
    cp -r /home/$USER/OpenWrtAction/source/img/* ./feeds/third/luci-theme-argon/htdocs/luci-static/argon/background/

    # Inject download package
    mkdir -p dl
    cp -r /home/$USER/OpenWrtAction/library/* dl/

    # Fixed qmi_wwan_f complie error
    # cp -r ../OpenWrtAction/patches/qmi_wwan_f.c ./package/wwan/driver/fibocom_QMI_WWAN/src/qmi_wwan_f.c
fi
