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
    title '3.3 Time zone'
    arch-chroot /mnt ln -sf /usr/share/zoneinfo/Europe/Madrid /etc/localtime \
    && arch-chroot /mnt hwclock --systohc \ 
    && title '3.4 Locale \
    && arch-chroot /mnt ( sed -i 's/#es_ES.UTF-8 UTF-8/es_ES.UTF-8 UTF-8/' /etc/locale.gen ) \
    && arch-chroot /mnt ( sed -i 's/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen ) \
    && arch-chroot /mnt locale-gen &&
    && arch-chroot /mnt ( echo "LANG=es_ES.UTF-8" > /etc/locale.conf ) \
    && arch-chroot /mnt echo "KEYMAP=es" > /etc/vconsole.conf
}

title '3 Configure the system'

fstab \
&& doChroot \
