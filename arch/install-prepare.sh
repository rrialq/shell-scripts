#!/bin/bash

loadkeys es
# Customize the order of mirrorlist for Spain
sed -i '1 i\Server = http://ftp.rediris.es/mirror/archlinux/$repo/os/$arch' /etc/pacman.d/mirrorlist
sed -i '1 i\Server = http://osl.ugr.es/archlinux/$repo/os/$arch' /etc/pacman.d/mirrorlist
sed -i '1 i\## Spain' /etc/pacman.d/mirrorlist

pacman -Syu && pacman -Sy git && git clone https://github.com/rrialq/shell-scripts.git && cd shell-scripts && echo 'Ok' || printf 'ERROR'
