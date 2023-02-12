#!/bin/bash

# Based on the work of GitHub user ladar
# https://github.com/ladar/qemu-spice-el9/blob/main/BUILD.sh

set -ex

groupadd mock
useradd mockbuild 
usermod -aG mock mockbuild
