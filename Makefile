include $(TOPDIR)/rules.mk

PKG_NAME:=perftest
PKG_VERSION:=1.0
PKG_RELEASE:=1

PKG_BUILD_DIR := $(COMPILE_DIR)/$(PKG_NAME)


include $(BUILD_DIR)/package.mk


define Package/perftest
  SECTION:=utils
  CATEGORY:=Allwinner
  TITLE:=camerateset test camera sensor

endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) -r ./src/* $(PKG_BUILD_DIR)/
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR)/ \
		ARCH="$(TARGET_ARCH)" \
		AR="$(TARGET_AR)" \
		CC="$(TARGET_CC)" \
		CXX="$(TARGET_CXX)" \
		CFLAGS="$(TARGET_CFLAGS)" \
		LDFLAGS="$(TARGET_LDFLAGS)" \
		CONFIG_PREFIX="$(PKG_INSTALL_DIR)" \
		all
endef

define Package/perftest/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/perftest.init $(1)/etc/init.d/perftest
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/perftest $(1)/usr/bin/perftest
endef

$(eval $(call BuildPackage,perftest))
