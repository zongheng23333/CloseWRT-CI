#!/bin/bash
 sed -i '$a src-git smpackage https://github.com/kenzok8/small-package' feeds.conf.default
./scripts/feeds update -a 
rm -rf feeds/luci/applications/luci-app-openclash
cp -rf feeds/smpackage/luci-app-openclash   feeds/luci/applications/luci-app-openclash

./scripts/feeds install -a  

