#!/bin/bash
 sed -i '$a src-git smpackage https://github.com/kenzok8/small-package' feeds.conf.default
 echo "src-git mihomo https://github.com/morytyann/OpenWrt-mihomo.git;main" >> "feeds.conf.default"
 
 git clone https://github.com/sirpdboy/luci-app-eqosplus package/luci-app-eqosplus
 git clone https://github.com/lucikap/luci-app-ua2f package/luci-app-ua2f
 git clone https://github.com/Zxilly/UA2F package/UA2F 

 
./scripts/feeds update -a 
rm -rf feeds/smpackage/{base-files,dnsmasq,firewall*,fullconenat,libnftnl,nftables,ppp,opkg,ucl,upx,vsftpd*,miniupnpd-iptables,wireless-regdb}



rm -rf feeds/luci/applications/luci-app-openclash
cp -rf feeds/smpackage/luci-app-openclash   feeds/luci/applications/luci-app-openclash



./scripts/feeds install -a  
