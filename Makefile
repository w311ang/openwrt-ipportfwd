include $(TOPDIR)/rules.mk

PKG_NAME:=ipportfwd
PKG_SOURCE_DATE:=2022-10-05
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/w311ang/ipportfwd.git
PKG_SOURCE_VERSION:=06489fd898ab46dc2e89f61e0b5dad059a1d5580
PKG_MIRROR_HASH:=skip

PKG_MAINTAINER:=w311ang <rz@runz.tk>

PKG_BUILD_DEPENDS:=golang/host
PKG_BUILD_PARALLEL:=1
PKG_USE_MIPS16:=0

GO_PKG:=github.com/w311ang/ipportfwd
GO_PKG_LDFLAGS:=-s -w

include $(INCLUDE_DIR)/package.mk
include ../../feeds/packages/lang/golang/golang-package.mk

define Package/ipportfwd
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Forward to IPv4 IP and port with TProxy
  URL:=https://github.com/w311ang/ipportfwd
  DEPENDS:=$(GO_ARCH_DEPENDS)
endef

define Package/ipportfwd/description
  Forward to IPv4 IP and port with TProxy
endef

GO_PKG_BUILD_VARS += GO111MODULE=auto

define Package/ipportfwd/install
	$(call GoPackage/Package/Install/Bin,$(PKG_INSTALL_DIR))

	$(INSTALL_DIR) $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/ipportfwd $(1)/usr/bin/
endef

$(eval $(call GoBinPackage,ipportfwd))
$(eval $(call BuildPackage,ipportfwd))
