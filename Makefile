# 
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: Makefile 6565 2007-03-14 13:42:21Z nbd $
include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk
PKG_NAME:=kmod-plog-port
PKG_RELEASE:=1
PKG_BUILD_DIR:=$(KERNEL_BUILD_DIR)/$(PKG_NAME)
include $(INCLUDE_DIR)/package.mk
define KernelPackage/kmod-plog-port
  SUBMENU:=Other modules
  TITLE:=kernel kmod-plog-port
  VERSION:=$(LINUX_VERSION)-$(BOARD)-$(PKG_RELEASE)
  FILES:= $(PKG_BUILD_DIR)/kmod-plog-port.$(LINUX_KMOD_SUFFIX)
  AUTOLOAD:=$(call AutoLoad,46,kmod-plog-port)
endef
define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) ./src/* $(PKG_BUILD_DIR)
endef
define Build/Compile
	$(MAKE) -C "$(LINUX_DIR)" \
		CROSS_COMPILE="$(TARGET_CROSS)" \
		ARCH="$(LINUX_KARCH)" \
		SUBDIRS="$(PKG_BUILD_DIR)" \
		EXTRA_CFLAGS="$(BUILDFLAGS)" \
		modules
endef
define KernelPackage/kmod-plog-port/install
	$(INSTALL_DIR) $(1)/lib/network/
endef
$(eval $(call KernelPackage,kmod-plog-port))
