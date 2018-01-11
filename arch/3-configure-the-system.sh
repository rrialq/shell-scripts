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
    title 'Change root into the new system'
    arch-chroot /mnt
}

title '3 Configure the system'

fstab \
&& doChroot \
