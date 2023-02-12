#!/bin/bash

# Based on the work of GitHub user ladar
# https://github.com/ladar/qemu-spice-el9/blob/main/BUILD.sh

set -ex

mkdir -p ~/rpmbuild/{BUILD,BUILDROOT,RPMS,SOURCES,SPECS,SRPMS}
