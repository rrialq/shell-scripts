#!/bin/bash

. ./configuration

cd ${HOME}
[ -d "${HOME}/shell-scripts-master" ] && title '0.2 Removing previous shell-scripts version' && rm -Rf ${HOME}/shell-scripts-master
loadkeys es
# Customize the order of mirrorlist for Spain
title '0.3 Adding Spanish servers to mirrorlist' \
&& sed -i '1 i\Server = http://osl.ugr.es/archlinux/$repo/os/$arch' /etc/pacman.d/mirrorlist \
&& sed -i '1 i\Server = http://ftp.rediris.es/mirror/archlinux/$repo/os/$arch' /etc/pacman.d/mirrorlist \
&& sed -i '1 i\## Spain' /etc/pacman.d/mirrorlist \
&& title '0.4 Updating software database' \
&& pacman -Sy \
&& title '0.5 Installing unzip' \
&& yes | pacman -S unzip \
&& title '0.6 Downloading shell-scripts' \
&& wget https://github.com/rrialq/shell-scripts/archive/master.zip \
&& title '0.7 Unzipping shell-scripts' \
&& unzip master.zip \
&& title '0.8 Setting executable on sh files' \
&& chmod +x ${HOME}/shell-scripts-master/arch/*sh
