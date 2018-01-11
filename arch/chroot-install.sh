#!/bin/sh
# Set the time zone
ln -sf /usr/share/zoneinfo/Europe/Madrid /etc/localtime
# Run hwclock(8) to generate /etc/adjtime:
hwclock --systohc
# Locale
sed -i 's/#es_ES.UTF-8 UTF-8/es_ES.UTF-8 UTF-8/' /etc/locale.gen
sed -i 's/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
locale-gen
echo "LANG=es_ES.UTF-8" > /etc/locale.conf
echo "KEYMAP=es" > /etc/vconsole.conf
echo "Europa" > /etc/hostname
echo "127.0.0.1 localhost.localdomain localhost
::1 localhost.localdomain  localhost
127.0.1.1 Europa.vialactea.local  Europa" >> /etc/hosts
# Boot loader
pacman -S grub sudo
grub-install --target=i386-pc --root-directory /mnt /dev/sda
# Generate the main configuration file
pacman -S intel-ucode
grub-mkconfig -o /boot/grub/grub.cfg
echo 'Section "InputClass"
    Identifier "system-keyboard"
	  MatchIsKeyboard "on"
	  Option "XkbLayout"  "es,us"
    Option "XkbModel"   "pc104"
    Option "XkbVariant" "deadtilde,dvorak"
    Option "XkbOptions" "grp:alt_shift_toggle"
EndSection' >> /etc/X11/xorg.conf.d/10-keyboard.conf
