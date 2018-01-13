#!/bin/bash
. ./configuration

fstab() {
    title '3.1 Generate an fstab file by UUID'
    genfstab -U /mnt >> /mnt/etc/fstab
}

doChroot() {
    title '3.2 Change root into the new system' \
    && title '    * Copying shell-scripts to /mnt/root' \
    && cp -R ./*.sh /mnt/root \
    && arch-chroot /mnt /root/3.1-into-chroot.sh
}

title '3 Configure the system'

fstab \
&& doChroot \
