#!/bin/bash

selectTheMirrors() {
    printf '2.1 Select the mirrors '
    # Customize the order of mirrorlist for Spain
    sed -i '1 i\Server = http://ftp.rediris.es/mirror/archlinux/$repo/os/$arch' /etc/pacman.d/mirrorlist \
    && sed -i '1 i\Server = http://osl.ugr.es/archlinux/$repo/os/$arch' /etc/pacman.d/mirrorlist \
    && sed -i '1 i\## Spain' /etc/pacman.d/mirrorlist \
    && pacman -Sy
}

cd ${HOME}
rm -Rf ${HOME}/shell-scripts-master
export LC_ALL=es_ES.UTF-8
loadkeys es \
&& selectTheMirrors \
&& pacman -Sy \
&& yes | pacman -S unzip \
&& wget https://github.com/rrialq/shell-scripts/archive/master.zip \
&& unzip master.zip \
&& chmod +x ${HOME}/shell-scripts-master/arch/*sh \
&& title '\n${0} OK\n' 
