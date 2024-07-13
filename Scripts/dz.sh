#!/bin/bash

./scripts/feeds update -a 
rm -rf  feeds/packages/net/frp
rm -rf feeds/luci/applications/luci-app-frpc

git clone --depth=1 --single-branch --branch   v0.42.0-1  "https://github.com/kuoruan/openwrt-frp"      package/zongheng/frp

git clone --depth=1 --single-branch --branch   v1.2.1-1  "https://github.com/kuoruan/luci-app-frpc"       package/zongheng/luci-app-frpc
#git clone --depth=1 --single-branch --branch   main     "https://github.com/simplebean/luci-app-frpc"    package/zongheng/luci-app-frpc
#git clone --depth=1 --single-branch --branch   main     "https://github.com/justice2001/luci-app-multi-frpc"    package/zongheng/luci-app-multi-frpc


./scripts/feeds install -a  
