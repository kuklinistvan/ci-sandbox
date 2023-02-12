#!/bin/bash

# Based on the work of GitHub user ladar
# https://github.com/ladar/qemu-spice-el9/blob/main/BUILD.sh

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

SPEC_PATCHES_DIR="$SCRIPT_DIR"/spec_patches

set -ex

function get_spec_files {
	cd "`mktemp -d`"

	dnf download --quiet --disablerepo=* --repofrompath="fc36,https://mirrors.kernel.org/fedora/releases/36/Everything/source/tree/" --source spice-gtk

	dnf download --quiet --disablerepo=* --repofrompath="rawhide,https://mirrors.kernel.org/fedora/development/rawhide/Everything/source/tree/" --source edk2 fcode-utils gi-docgen libcacard lzfse openbios python-pefile python-smartypants python-virt-firmware qemu SLOF spice spice-protocol virglrenderer virt-manager
	
	rpm -i *src.rpm
}

function patch_spec_files {
	cd ~/rpmbuild/SPECS/

	git init
	git add *.spec
	git commit -m "Default spec files."

	patch -p1 << "$SPEC_PATCHES_DIR"/SLOF.spec
	patch -p1 << "$SPEC_PATCHES_DIR"/qemu.spec
	patch -p1 << "$SPEC_PATCHES_DIR"/spice-gtk.spec

	sed -i 's/defined rhel/defined nullified/g' edk2.spec
	sed -i 's/defined fedora/defined rhel/g' 	edk2.spec
}

function build_spec_file_nocheck {

	pkgname="$1"

	rpmbuild \
		--nocheck \
		-ba \
		--rebuild \
		--undefine="dist" \
		-D "dist .btrh9" \
		--target=$(uname -m) \
		$pkgname.spec

	rpm -i --replacepkgs --replacefiles $(rpmspec -q --undefine="dist" -D "dist .btrh9" --queryformat="$HOME/rpmbuild/RPMS/%{ARCH}/%{PROVIDES}-%{VERSION}-%{RELEASE}.%{ARCH}.rpm " $pkgname.spec) || \
	{ printf "\n\e[1;91m# The $pkgname rpmbuild failed.\e[0;0m\n\n" ; exit 1 ; }
	printf "\e[1;92m# The $pkgname rpmbuild finished.\e[0;0m\n"
}

get_spec_files
patch_spec_files

build_spec_file_nocheck lzfse
build_spec_file_nocheck virglrenderer
build_spec_file_nocheck libcacard
build_spec_file_nocheck fcode-utils
build_spec_file_nocheck openbios
build_spec_file_nocheck python-pefile
build_spec_file_nocheck python-virt-firmware
build_spec_file_nocheck edk2
build_spec_file_nocheck spice-protocol
build_spec_file_nocheck spice
build_spec_file_nocheck qemu
build_spec_file_nocheck python-smartypants
build_spec_file_nocheck gi-docgen
build_spec_file_nocheck spice-gtk
build_spec_file_nocheck virt-manager
