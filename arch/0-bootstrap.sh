#!/bin/bash

loadkeys es
# Customize the order of mirrorlist for Spain
sed -i '1 i\Server = http://ftp.rediris.es/mirror/archlinux/$repo/os/$arch' /etc/pacman.d/mirrorlist \
&& sed -i '1 i\Server = http://osl.ugr.es/archlinux/$repo/os/$arch' /etc/pacman.d/mirrorlist \
&& sed -i '1 i\## Spain' /etc/pacman.d/mirrorlist \
&& pacman -Sy \
&& pacman -Sy unzip \
&& wget https://github.com/rrialq/shell-scripts/archive/master.zip \
&& unzip master.zip \
&& cd shell-scripts/arch \
&& chmod +x *sh
