#
## Copyright (C) 2013-2020 CZ.NIC z.s.p.o. (http://www.nic.cz/)
#
## This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
# #
#
include $(TOPDIR)/rules.mk

PKG_NAME:=omnia-nor-firmware
PKG_VERSION:=1.0
PKG_RELEASE:=1

PKG_MAINTAINER:=CZ.NIC <packaging@turris.cz>

include $(INCLUDE_DIR)/package.mk

define Package/omnia-nor-firmware
  TITLE:=Stable NOR firmware for Turris Omnia
  DEPENDS:=@TARGET_mvebu_cortexa9_DEVICE_cznic_turris-omnia
  PROVIDES:=turris-nor-firmware
  ALTERNATIVES:= \
    100:/usr/share/nor-firmare-unstable/mtd0:/usr/share/nor-firmware/mtd0 \
    100:/usr/share/nor-firmare-unstable/mtd1:/usr/share/nor-firmware/mtd1
endef

Build/Compile:=:

define Package/omnia-nor-firmware/install
	$(INSTALL_DIR) $(1)/usr/share/nor-firmware/
	$(INSTALL_DATA) ./files/* $(1)/usr/share/nor-firmware/
endef

$(eval $(call BuildPackage,omnia-nor-firmware))
