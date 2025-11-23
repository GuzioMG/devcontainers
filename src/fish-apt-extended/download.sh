#!/bin/sh
set -e

FASTFETCH=${FASTFETCH:-"2.55.1"} #arbitrary default version
UPDATE_DATE="$(cat ./update_date.txt)"

curl -sS https://starship.rs/install.sh >> "./install_starship-$UPDATE_DATE.sh"
wget "https://github.com/fastfetch-cli/fastfetch/releases/download/$FASTFETCH/fastfetch-linux-amd64-polyfilled.zip"
wget "https://github.com/fastfetch-cli/fastfetch/releases/download/$FASTFETCH/fastfetch-linux-aarch64-polyfilled.zip"

unzip "fastfetch-linux-amd64-polyfilled.zip"
unzip "fastfetch-linux-aarch64-polyfilled.zip"
rm *.zip

mv "fastfetch-linux-amd64-polyfilled/" "fastfetch_x64-$UPDATE_DATE"
mv "fastfetch-linux-aarch64-polyfilled/" "fastfetch_arm-$UPDATE_DATE"