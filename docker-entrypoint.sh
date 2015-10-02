#!/bin/bash
set -e

if [ ! -e '/var/www/html/version.php' ]; then
	tar cf - --one-file-system -C /usr/src/owncloud . | tar xf -
	chown -R www-data /var/www/html
fi

# ocdownloader requirement
aria2c --enable-rpc --rpc-allow-origin-all -c -D --log=/dev/stdout --check-certificate=false

exec "$@"
