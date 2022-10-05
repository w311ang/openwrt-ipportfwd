# openwrt-ipportfwd
## Build
```bash
cd openwrt-sdk

# 获取源码
git clone https://github.com/w311ang/openwrt-ipportfwd.git package/ipportfwd

# 选中 Network -> ipportfwd
make menuconfig

# 编译 ipportfwd
make package/ipportfwd/{clean,compile} V=s
```

## Thanks
https://github.com/LiamHaworth/go-tproxy
