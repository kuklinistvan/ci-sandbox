#!/bin/bash

# Based on the work of GitHub user ladar
# https://github.com/ladar/qemu-spice-el9/blob/main/BUILD.sh

dnf --quiet --assumeyes --with-optional --enablerepo=baseos --enablerepo=appstream --enablerepo=epel --enablerepo=extras --enablerepo=plus --enablerepo=crb --enablerepo=remi --enablerepo=remi-safe --enablerepo=remi-modular --enablerepo=elrepo --enablerepo=rpmfusion-free-updates --enablerepo=rpmfusion-nonfree-updates group install "Development Tools" "Additional Development" "Platform Development" "RPM Development Tools" "Debugging Tools" "Desktop Debugging and Performance Tools" 

dnf --quiet --assumeyes --allowerasing \
	--enablerepo=baseos --enablerepo=appstream --enablerepo=epel --enablerepo=extras --enablerepo=plus \
	--enablerepo=crb --enablerepo=remi --enablerepo=remi-safe --enablerepo=remi-modular --enablerepo=elrepo \
	--enablerepo=rpmfusion-free-updates --enablerepo=rpmfusion-nonfree-updates install \
	 acpica-tools alsa-lib-devel asciidoc audit-libs-devel autoconf automake bash bc binutils binutils-devel \
	 bison brlapi-devel byacc bzip2-devel cmake ctags cyrus-sasl-devel daxctl-devel dbus-daemon \
	 dbus-devel dbus-glib-devel dbus-libs dbus-x11 dbusmenu-qt5-devel device-mapper-multipath-devel diffstat \
	 diffutils dosfstools dwarves epel-rpm-macros elfutils elfutils-devel elfutils-libelf-devel expect \
	 findutils flex fuse-devel fuse-encfs fuse-overlayfs fuse-sshfs fuse3 fuse3-devel gawk gcc \
	 gcc-aarch64-linux-gnu gcc-arm-linux-gnu gcc-c++ gcc-powerpc64-linux-gnu gcc-sparc64-linux-gnu \
	 gcc-x86_64-linux-gnu gdb gettext git git-core glib2-devel glib2-static glibc-devel glibc-static gnupg2 \
	 gnutls-devel gnutls-utils gstreamer1-devel gstreamer1-plugins-bad-free-devel \
	 gstreamer1-plugins-base-devel gstreamer1-plugins-ugly gtk3-devel gzip help2man hmaccalc hostname iasl \
	 intltool ipxe-roms-qemu java-devel jna kabi-dw libaio-devel libattr-devel libbpf-devel libcap-devel \
	 libcap-ng-devel libcurl-devel libdbusmenu-devel libdbusmenu-gtk2-devel libdbusmenu-gtk3-devel \
	 libdbusmenu-jsonloader-devel libdrm-devel libepoxy-devel libfdt-devel libiscsi-devel libjpeg-devel \
	 libpmem-devel libpng-devel librbd-devel libseccomp-devel libselinux-devel libslirp-devel libssh-devel \
	 libtasn1-devel libtool libudev-devel liburing-devel libusbx-devel libuuid-devel libxkbcommon-devel \
	 libzstd-devel llvm-toolset ltrace lz4-devel lzo-devel m4 make mesa-libgbm-devel meson module-init-tools \
	 mtools nasm ncurses-devel net-tools newt-devel numactl-devel opensc openssl openssl-devel opus-devel \
	 orc-devel pam-devel patch patchutils pciutils-devel pcre-devel pcre-static pcre2-devel pcsc-lite-devel \
	 perl perl-devel perl-ExtUtils-Embed perl-Fedora-VSP perl-generators perl-Test-Harness pesign \
	 pipewire-jack-audio-connection-kit-devel pixman-devel pkgconf pkgconf-m4 pkgconf-pkg-config pkgconfig \
	 pulseaudio-libs-devel python3-cryptography python3-devel python3-docutils python3-future python3-pytest \
	 python3-sphinx python3-sphinx_rtd_theme python3-tomli rdma-core rdma-core-devel redhat-rpm-config rpm-build rpm-sign \
	 rpmconf rpmdevtools rpmlint rpmrebuild rsync SDL2-devel SDL2_image-devel seabios seabios-bin seavgabios-bin \
	 sgabios-bin snappy-devel softhsm source-highlight sparse sssd-dbus strace systemd-devel systemtap \
	 systemtap-sdt-devel tar tcsh texinfo usbguard-dbus usbredir-devel valgrind valgrind-devel vte291-devel \
	 x264-devel x265-devel xauth xdg-dbus-proxy xmlto xorg-x11-util-macros xorriso xz zlib-devel zlib-static \
	 gobject-introspection-devel gtk-doc usbutils vala wayland-protocols-devel samba-winbind-clients \
	 libnghttp2-devel latexmk python3-sphinx-latex redhat-display-fonts redhat-text-fonts fonts-rpm-macros \
	 pyproject-rpm-macros python3-wheel virt-manager libvirt-devel libvirt-client
