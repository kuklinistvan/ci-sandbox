#!/bin/bash

# Based on the work of GitHub user ladar
# https://github.com/ladar/qemu-spice-el9/blob/main/BUILD.sh

set -ex

sed -i '/alias/d' $HOME/.cshrc  || true
sed -i '/alias/d' $HOME/.tcshrc || true
sed -i '/alias/d' $HOME/.bashrc || true
