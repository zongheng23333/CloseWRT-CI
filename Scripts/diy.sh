#!/bin/bash
 sed -i '$a src-git smpackage https://github.com/kenzok8/small-package' feeds.conf.default
./scripts/feeds update -a 
rm -rf feeds/luci/applications/luci-app-openclash
cp -rf feeds/smpackage/luci-app-openclash   feeds/luci/applications/luci-app-openclash
rm -rf $(find ../feeds/luci/ -type d -iname "*frp*" -prune)
git clone --depth=1 --single-branch --branch master      "https://github.com/kuoruan/luci-app-frpc"
mv -rf    luci-app-frpc  feeds/luci/applications/
./scripts/feeds install -a  

