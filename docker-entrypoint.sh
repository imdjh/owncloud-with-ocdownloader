#!/bin/bash
set -e

# ocdownloader requirements
su - aria2 -c '/usr/bin/aria2c --enable-rpc --rpc-allow-origin-all -c -D --log=/dev/stdout --check-certificate=false &'

# makes aria2 and www-data works together
umask 0007
apache2-foreground
