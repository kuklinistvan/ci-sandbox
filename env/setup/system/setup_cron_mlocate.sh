#!/bin/bash

# Based on the work of GitHub user ladar
# https://github.com/ladar/qemu-spice-el9/blob/main/BUILD.sh

dnf install --assumeyes mlocate
# Enable the locate database update cron job.
echo "* * * * * root command bash -c '/usr/bin/updatedb'" | tee /etc/cron.d/updatedb > /dev/null
