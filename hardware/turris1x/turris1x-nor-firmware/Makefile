#
## Copyright (C) 2013-2020 CZ.NIC z.s.p.o. (http://www.nic.cz/)
#
## This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
# #
#
include $(TOPDIR)/rules.mk

PKG_NAME:=turris1x-nor-firmware
PKG_VERSION:=0.1
PKG_RELEASE:=1

PKG_MAINTAINER:=CZ.NIC <packaging@turris.cz>

include $(INCLUDE_DIR)/package.mk

define Package/turris1x-nor-firmware
  TITLE:=Stable NOR firmware for Turris 1.x
  DEPENDS:=@TARGET_mpc85xx_p2020_DEVICE_turris1x
  PROVIDES:=turris-nor-firmware
  ALTERNATIVES:= \
    100:/usr/share/nor-firmare-unstable/mtd0:/usr/share/nor-firmware/mtd0 \
    100:/usr/share/nor-firmare-unstable/mtd1:/usr/share/nor-firmware/mtd1 \
    100:/usr/share/nor-firmare-unstable/mtd2:/usr/share/nor-firmware/mtd2 \
    100:/usr/share/nor-firmare-unstable/mtd3:/usr/share/nor-firmware/mtd3 \
    100:/usr/share/nor-firmare-unstable/mtd5:/usr/share/nor-firmware/mtd5 \
    100:/usr/share/nor-firmare-unstable/mtd6:/usr/share/nor-firmware/mtd6
endef

Build/Compile:=:

define Package/turris1x-nor-firmware/install
	$(INSTALL_DIR) $(1)/usr/share/nor-firmware/
	$(INSTALL_DATA) ./files/* $(1)/usr/share/nor-firmware/
endef

$(eval $(call BuildPackage,turris1x-nor-firmware))
