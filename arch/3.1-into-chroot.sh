#!/bin/bash

cd ${HOME}
. ./configure
title '3.2 Change root into the new system'
title '3.3 Time zone'
ln -sf /usr/share/zoneinfo/Europe/Madrid /etc/localtime \
&& hwclock --systohc \
&& title '3.4 Locale' \
&& sed -i 's/#es_ES.UTF-8 UTF-8/es_ES.UTF-8 UTF-8/' /etc/locale.gen \
&& sed -i 's/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen \
&& locale-gen \
&& echo "LANG=es_ES.UTF-8" > /etc/locale.conf \
&& echo "KEYMAP=es" > /etc/vconsole.conf \
&& echo 'Section "InputClass"
    Identifier "system-keyboard"
	  MatchIsKeyboard "on"
	  Option "XkbLayout"  "es,us"
    Option "XkbModel"   "pc104"
    Option "XkbVariant" "deadtilde,dvorak"
    Option "XkbOptions" "grp:alt_shift_toggle"
EndSection' >> /etc/X11/xorg.conf.d/10-keyboard.conf \\
&& title '3.5 Hostname' \
&& echo "127.0.0.1\tlocalhost.localdomain\tlocalhost\n::1\tlocalhost.localdomain\tlocalhost\n127.0.1.1\tEuropa.vialactea.local\tEuropa" >> /etc/hosts \
&& title '3.6 Network configuration' \
&& title '3.9 Bootloader' \
&& title '    * Installing grub' \
&& grub-install --target=i386-pc --root-directory /mnt /dev/sda \
&& title '    * Creando configuración' \
&& grub-mkconfig -o /boot/grub/grub.cfg
