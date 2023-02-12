#!/bin/bash

# Based on the work of GitHub user ladar
# https://github.com/ladar/qemu-spice-el9/blob/main/BUILD.sh


dnf update --quiet --assumeyes 
dnf --enablerepo=extras --quiet --assumeyes install epel-release 
rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-9 
dnf --enablerepo=extras --quiet --assumeyes install elrepo-release 
rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-elrepo.org 
dnf install --quiet --assumeyes https://download1.rpmfusion.org/free/el/rpmfusion-free-release-$(rpm -E "%{?fedora}%{?rhel}").noarch.rpm 
rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-free-el-9 
dnf install --quiet --assumeyes https://download1.rpmfusion.org/nonfree/el/rpmfusion-nonfree-release-$(rpm -E "%{?fedora}%{?rhel}").noarch.rpm 
rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-nonfree-el-9 
dnf install --quiet --assumeyes https://rpms.remirepo.net/enterprise/remi-release-$(rpm -E "%{?rhel}").rpm 
rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-remi.el$(rpm -E '%{?rhel}')
		
sed -i -e "s/^[# ]*baseurl/baseurl/g" /etc/yum.repos.d/almalinux-*.repo
sed -i -e "s/^[# ]*mirrorlist/# mirrorlist/g" /etc/yum.repos.d/almalinux-*.repo

sed -i 's/&protocol\=https//g' /etc/yum.repos.d/epel.repo
sed -i 's/\(metalink\=.*\)$/\1\&protocol\=https/g' /etc/yum.repos.d/epel.repo
sed -i 's/&protocol\=https//g' /etc/yum.repos.d/epel-testing.repo
sed -i 's/\(metalink\=.*\)$/\1\&protocol\=https/g' /etc/yum.repos.d/epel-testing.repo

sed -i 's/http:\/\//https:\/\//g' /etc/yum.repos.d/elrepo.repo 
sed -i -e "s/^[# ]*mirrorlist/# mirrorlist/g" /etc/yum.repos.d/elrepo.repo 
sed -i '/mirrors.coreix.net/d' /etc/yum.repos.d/elrepo.repo

sed -i 's/baseurl\=http:/baseurl\=https:/g' /etc/yum.repos.d/rpmfusion-free-updates.repo
sed -i 's/metalink\=http:/metalink\=https:/g' /etc/yum.repos.d/rpmfusion-free-updates.repo
sed -i 's/&protocol\=https//g' /etc/yum.repos.d/rpmfusion-free-updates.repo
sed -i 's/\(metalink\=.*\)$/\1\&protocol\=https/g' /etc/yum.repos.d/rpmfusion-free-updates.repo
sed -i 's/baseurl\=http:/baseurl\=https:/g' /etc/yum.repos.d/rpmfusion-free-updates-testing.repo
sed -i 's/metalink\=http:/metalink\=https:/g' /etc/yum.repos.d/rpmfusion-free-updates-testing.repo
sed -i 's/&protocol\=https//g' /etc/yum.repos.d/rpmfusion-free-updates-testing.repo
sed -i 's/\(metalink\=.*\)$/\1\&protocol\=https/g' /etc/yum.repos.d/rpmfusion-free-updates-testing.repo
sed -i 's/baseurl\=http:/baseurl\=https:/g' /etc/yum.repos.d/rpmfusion-nonfree-updates.repo
sed -i 's/metalink\=http:/metalink\=https:/g' /etc/yum.repos.d/rpmfusion-nonfree-updates.repo
sed -i 's/&protocol\=https//g' /etc/yum.repos.d/rpmfusion-nonfree-updates.repo
sed -i 's/\(metalink\=.*\)$/\1\&protocol\=https/g' /etc/yum.repos.d/rpmfusion-nonfree-updates.repo
sed -i 's/baseurl\=http:/baseurl\=https:/g' /etc/yum.repos.d/rpmfusion-nonfree-updates-testing.repo
sed -i 's/metalink\=http:/metalink\=https:/g' /etc/yum.repos.d/rpmfusion-nonfree-updates-testing.repo
sed -i 's/&protocol\=https//g' /etc/yum.repos.d/rpmfusion-nonfree-updates-testing.repo
sed -i 's/\(metalink\=.*\)$/\1\&protocol\=https/g' /etc/yum.repos.d/rpmfusion-nonfree-updates-testing.repo

sed -i 's/cdn.remirepo.net/rpms.remirepo.net/g' /etc/yum.repos.d/remi.repo
sed -i 's/http:\/\//https:\/\//g' /etc/yum.repos.d/remi.repo 
sed -i 's/http:\/\//https:\/\//g' /etc/yum.repos.d/remi-safe.repo 
sed -i 's/cdn.remirepo.net/rpms.remirepo.net/g' /etc/yum.repos.d/remi-safe.repo
sed -i 's/cdn.remirepo.net/rpms.remirepo.net/g' /etc/yum.repos.d/remi-modular.repo
sed -i 's/http:\/\//https:\/\//g' /etc/yum.repos.d/remi-modular.repo 

# As a final step we clean the cache, and reload it so the new GPG keys get approved.
dnf --enablerepo=* clean all
dnf --enablerepo=* --quiet --assumeyes makecache
dnf --quiet --assumeyes update
