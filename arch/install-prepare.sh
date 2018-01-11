#!/bin/bash

loadkeys es
echo "label: gpt" | sfdisk /dev/sda
echo ',2M,21686148-6449-6E6F-744E-656564454649,*\n,1512M\n,,' | sfdisk /dev/sda
mkfs.ext4 /dev/sda1
mkfs.ext4 /dev/sda2
mount /dev/sda2 /mnt
mkdir /mnt/boot
mount /dev/sda1 /mnt/boot
# Customize the order of mirrorlist for Spain
sed -i '1 i\Server = http://ftp.rediris.es/mirror/archlinux/$repo/os/$arch' /etc/pacman.d/mirrorlist
sed -i '1 i\Server = http://osl.ugr.es/archlinux/$repo/os/$arch' /etc/pacman.d/mirrorlist
sed -i '1 i\## Spain' /etc/pacman.d/mirrorlist

# Install the base packages
pacstrap /mnt base
# Generate an fstab file by UUID
genfstab -U /mnt >> /mnt/etc/fstab
# Change root into the new system
echo '* Please, do chroot /mnt'
