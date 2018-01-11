	Configure the system
3.1	Fstab
3.2	Chroot
3.3	Time zone
3.4	Locale
3.5	Hostname
3.6	Network configuration
3.7	Initramfs
3.8	Root password
3.9	Boot loader

. ./configure

fstab() {
    title '3.1 Generate an fstab file by UUID'
    genfstab -U /mnt >> /mnt/etc/fstab
}

doChroot() {
    title '3.2 Change root into the new system'
    title '    * Copying configure to /mnt/root' \
    && cp ./configure /mnt/root \
    && title '    * Copying 3.1-into-chroot.sh to /mnt/root' \
    && arch-chroot /mnt /root/3.1-into-chroot.sh
}

title '3 Configure the system'

fstab \
&& doChroot \
