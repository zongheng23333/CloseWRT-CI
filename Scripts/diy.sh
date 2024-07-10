#!/bin/bash
 sed -i '$a src-git smpackage https://github.com/kenzok8/small-package' feeds.conf.default
./scripts/feeds update -a 
rm -rf feeds/luci/applications/luci-app-openclash
cp -rf feeds/smpackage/luci-app-openclash   feeds/luci/applications/luci-app-openclash




rm -rf  feeds/packages/net/frp
git clone --depth=1 --single-branch --branch   v0.42.0-1  "https://github.com/kuoruan/openwrt-frp" feeds/packages/net/frp

rm -rf feeds/luci/applications/luci-app-frpc
git clone https://github.com/kuoruan/luci-app-frpc feeds/luci/applications/luci-app-frpc
sed -i -e 's/\tlocal frp_version=.*/\tlocal frp_version='''$FRP_VERSION'''/' feeds/luci/applications/luci-app-frpc/root/etc/init.d/frp

./scripts/feeds install -a  

