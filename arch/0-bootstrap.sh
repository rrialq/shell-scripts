#!/bin/bash

cd ${HOME}
rm -Rf ${HOME}/shell-scripts-master
loadkeys es
# Customize the order of mirrorlist for Spain
sed -i '1 i\Server = http://ftp.rediris.es/mirror/archlinux/$repo/os/$arch' /etc/pacman.d/mirrorlist \
&& sed -i '1 i\Server = http://osl.ugr.es/archlinux/$repo/os/$arch' /etc/pacman.d/mirrorlist \
&& sed -i '1 i\## Spain' /etc/pacman.d/mirrorlist \
&& pacman -Sy \
&& yes | pacman -S unzip \
&& wget https://github.com/rrialq/shell-scripts/archive/master.zip \
&& unzip master.zip \
&& cd ${HOME}/shell-scripts-master/arch \
&& chmod +x *sh
