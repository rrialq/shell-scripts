#!/bin/bash
CONF_FILENAME='/etc/modules/load.d/virtualbox.conf'
title 'Virtualbox Guest Additions installing...' \
&& sudo pacman -S linux-lts linux-lts-headers virtualbox-guest-modules-arch virtualbox-guest-utils \
&& title '* Modprobe' \
&& sudo modprobe -a vboxguest vboxsf vboxvideo \
&& title '* Creating virtualbox.conf' \
&& sudo echo 'vboxguest\nvboxsf\nvboxvideo' > ${CONF_FILENAME} \
&& title '* Enabling modules' \
&& VBoxClient-all \
&& printf '\r[OK   ]\n' || printf '\r[ERROR]\n'
