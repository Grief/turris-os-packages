#
## Copyright (C) 2013-2020 CZ.NIC z.s.p.o. (http://www.nic.cz/)
#
## This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
# #
#
include $(TOPDIR)/rules.mk

PKG_NAME:=nor-update
PKG_RELEASE:=1
PKG_VERSION:=2.0

PKG_MAINTAINER:=CZ.NIC <packaging@turris.cz>

include $(INCLUDE_DIR)/package.mk

define Package/turris-nor-update
  TITLE:=NOR update for Turris routers
  DEPENDS:=+mtd +turris-nor-firmware
endef

Build/Compile:=:

define Package/turris-nor-update/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) ./files/nor-update $(1)/usr/sbin/nor-update
endef

$(eval $(call BuildPackage,turris-nor-update))
