#!/bin/bash
 sed -i '$a src-git smpackage https://github.com/kenzok8/small-package' feeds.conf.default
 echo >> feeds.conf.default

echo 'src-git kuoruan  https://github.com/kuoruan/luci-app-frpc' >> feeds.conf.default
./scripts/feeds update kuoruan 
./scripts/feeds install -d y -p kuoruan  luci-app-frpc

./scripts/feeds update -a 
rm -rf feeds/luci/applications/luci-app-openclash
cp -rf feeds/smpackage/luci-app-openclash   feeds/luci/applications/luci-app-openclash




rm -rf  feeds/packages/net/frp
git clone --depth=1 --single-branch --branch   v0.42.0-1  "https://github.com/kuoruan/openwrt-frp" feeds/packages/net/frp
git clone --depth=1 --single-branch --branch   v0.42.0-1  "https://github.com/kuoruan/openwrt-frp" feeds/smpackage/frp

rm -rf feeds/luci/applications/luci-app-frpc

./scripts/feeds install -a  
