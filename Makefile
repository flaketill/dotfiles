# Makefile

# Copyright (C) 1994-2014 Free Software Foundation, Inc.

# This Makefile.in is free software; the Free Software Foundation
# gives unlimited permission to copy and/or distribute it,
# with or without modifications, as long as this notice is preserved.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY, to the extent permitted by law; without
# even the implied warranty of MERCHANTABILITY or FITNESS FOR A
# PARTICULAR PURPOSE.


PACKAGE = flaketill-dotfiles
PACKAGE_BUGREPORT = https://github.com/flaketill/flaketill-dotfiles/issues
PACKAGE_NAME = flaketill-dotfiles
PACKAGE_STRING = flaketill-dotfiles 0.0.1
PACKAGE_TARNAME = flaketill-dotfiles
PACKAGE_URL = https://github.com/flaketill/flaketill-dotfiles
PACKAGE_VERSION = 0.0.1

INSTALL = /usr/bin/install -c
INSTALL_DATA = ${INSTALL} -m 644
INSTALL_PROGRAM = ${INSTALL}
INSTALL_SCRIPT = ${INSTALL}
INSTALL_STRIP_PROGRAM = $(install_sh) -c -s

install_sh_DATA = $(install_sh) -c -m 644
install_sh_PROGRAM = $(install_sh) -c
install_sh_SCRIPT = $(install_sh) -c

DEPS=git stow
SHELL = /bin/sh
VERSION = 0.0.1
MKDIR_P = /usr/bin/mkdir -p
SUBDIRS = src

srcdir = .
prefix = /usr
datarootdir = ${prefix}/share
datadir = ${datarootdir}
pkgdatadir = $(datadir)/flaketill-dotfiles
includedir = ${prefix}/include
pkgincludedir = $(includedir)/flaketill-dotfiles
libdir = ${exec_prefix}/lib
pkglibdir = $(libdir)/flaketill-dotfiles
libexecdir = ${exec_prefix}/libexec
pkglibexecdir = $(libexecdir)/flaketill-dotfiles

prepare:
	cd "$(PACKAGE_NAME )-$(PACKAGE_VERSION )"
	#patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
	sudo pacman -S --needed $(DEPS)

build:
	cd "$(PACKAGE_NAME )-$(PACKAGE_VERSION )"
	#./configure --prefix=/usr
	#make
check:
	cd "$(PACKAGE_NAME )-$(PACKAGE_VERSION )"
	#make -k check
install:
	#cd "$(PACKAGE_NAME )-$(PACKAGE_VERSION )"
	#make DESTDIR="$pkgdir/" install

	git clone https://github.com/flaketill/dotfiles.git && cd dotfiles && source bootstrap.sh
test: 
	printenv

all: prepare build check install test

.PHONY: all

# README on https://gist.github.com/prwhite/8168133
# Add the following 'help' target to your Makefile
# And add help text after each target name starting with '\#\#'
 
help:           ## Show this help.
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'
 
# Everything below is an example
 
target00:       ## This message will show up when typing 'make help'
	@echo does nothing
 
target01:       ## This message will also show up when typing 'make help'
	@echo does something
 
# Remember that targets can have multiple entries (if your target specifications are very long, etc.)
target02:       ## This message will show up too!!!

.DEFAULT_GOAL := help	