#!/bin/bash

cd ${HOME}
. ./configuration
title '3.2 Change root into the new system'
title '3.3 Time zone'
ln -sf /usr/share/zoneinfo/Europe/Madrid /etc/localtime \
&& hwclock --systohc \
&& title '3.4 Locale' \
&& title '    * Setting es_ES.UTF-8' \
&& sed -i 's/#es_ES.UTF-8 UTF-8/es_ES.UTF-8 UTF-8/' /etc/locale.gen \
&& title '    * Setting en_US.UTF-8' \
&& sed -i 's/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen \
&& title '    * Running locale-gen' \
&& locale-gen \
&& title '    * Setting LANG' \
&& echo "LANG=es_ES.UTF-8" > /etc/locale.conf \
&& title '    * Setting KEYMAP' \
&& echo "KEYMAP=es" > /etc/vconsole.conf \
&& title '3.5 Hostname' \
&& echo "127.0.0.1\tlocalhost.localdomain\tlocalhost\n::1\tlocalhost.localdomain\tlocalhost\n127.0.1.1\tEuropa.vialactea.local\tEuropa" >> /etc/hosts \
&& title '3.6 Network configuration' \
&& title '3.7 Initramfs' \
&& title '3.8 Root password' \
&& title '3.9 Bootloader' \
&& title '    * Installing grub' \
&& grub-install --target=i386-pc /dev/sda \
&& title '    * Creating grub configuration' \
&& grub-mkconfig -o /boot/grub/grub.cfg \
&& cp /etc/netctl/examples/ethernet-dhcp /etc/netctl/enp0s3 \
&& sudo netctl enable enp0s3
&& title "\n${0} OK\n"
