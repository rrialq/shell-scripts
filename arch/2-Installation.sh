#!/bin/sh

. ./configuration

# Not necessary, since contained in 0-scripts-download.sh
selectTheMirrors() {
    printf '2.1 Select the mirrors '
    # Customize the order of mirrorlist for Spain
    sed -i '1 i\Server = http://ftp.rediris.es/mirror/archlinux/$repo/os/$arch' /etc/pacman.d/mirrorlist \
    && sed -i '1 i\Server = http://osl.ugr.es/archlinux/$repo/os/$arch' /etc/pacman.d/mirrorlist \
    && sed -i '1 i\## Spain' /etc/pacman.d/mirrorlist \
    && pacman -Sy
}

installTheBasePackages() {
    title '2.2 Install the base packages '
    pacstrap /mnt base grub intel-ucode sudo
}

installTheBasePackages \
&& title "\n${0} OK\n"
