#
## Copyright (C) 2016-2020 CZ.NIC z.s.p.o. (http://www.nic.cz/)
#
## This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
# #
#
include $(TOPDIR)/rules.mk

PKG_NAME:=updater-ng
PKG_VERSION:=67.0.2
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://gitlab.nic.cz/turris/updater/updater.git
PKG_SOURCE_VERSION:=v$(PKG_VERSION)

PKG_MAINTAINER:=CZ.NIC <packaging@turris.cz>
PKG_LICENSE:=GPL-3.0-or-later
PKG_LICENSE_FILES:=COPYING

PKG_BUILD_DEPENDS:=busybox uthash argp-standalone

PKG_INSTALL:=1
PKG_FIXUP:=autoreconf

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/autotools.mk

define Package/updater-ng
  SECTION:=updater
  CATEGORY:=Turris Updater
  TITLE:=Updater
  DEPENDS:=\
    +liblua \
    +libuci-lua \
    +libevent2 \
    +libcurl \
    +liburiparser \
    +libarchive \
    +ca-certificates
endef

CONFIGURE_ARGS += \
		--disable-tests \
		--disable-linters \
		--disable-docs \
		--with-embed-busybox="$(STAGING_DIR)/bin/busybox-static"

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/lib/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libupdater.so* $(1)/usr/lib/

	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/* $(1)/usr/bin/
	$(INSTALL_BIN) ./files/update_alternatives.sh $(1)/usr/bin/

	$(INSTALL_DIR) $(1)/etc/updater
	$(INSTALL_CONF) $(PKG_BUILD_DIR)/src/pkgupdate/configs/conf.lua $(1)/etc/updater
	$(INSTALL_DIR) $(1)/etc/updater/conf.d
	$(INSTALL_CONF) ./files/turris.lua $(1)/etc/updater/conf.d/turris.lua
	$(INSTALL_CONF) $(PKG_BUILD_DIR)/src/pkgupdate/configs/example.lua $(1)/etc/updater/conf.d/example.lua

	$(INSTALL_DIR) $(1)/etc/updater/hook_preupdate
	touch $(1)/etc/updater/hook_preupdate/.keep
	$(INSTALL_DIR) $(1)/etc/updater/hook_postupdate
	touch $(1)/etc/updater/hook_postupdate/.keep
	$(INSTALL_DIR) $(1)/etc/updater/hook_reboot_required
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/pkgupdate/hook_reboot_required/50-create-notification.sh $(1)/etc/updater/hook_reboot_required/50-create-notification.sh

	# Note: this file is not ever used as appropriate one is generated to medkit
	# it is here only for reference and to make sure that it exists.
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_CONF) ./files/updater.config $(1)/etc/config/updater
endef

define Package/updater-ng/conffiles
/etc/updater/conf.d/example.lua
/etc/config/updater
endef

$(eval $(call BuildPackage,updater-ng))
