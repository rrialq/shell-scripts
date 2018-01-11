#!/bin/bash

cd ${HOME}
. ./configure
title '3.2 Change root into the new system'
title '3.3 Time zone'
ln -sf /usr/share/zoneinfo/Europe/Madrid /etc/localtime \
&& hwclock --systohc \
&& title '3.4 Locale \
&& sed -i 's/#es_ES.UTF-8 UTF-8/es_ES.UTF-8 UTF-8/' /etc/locale.gen \
&& sed -i 's/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen \
&& locale-gen \
&& echo "LANG=es_ES.UTF-8" > /etc/locale.conf \
&& echo "KEYMAP=es" > /etc/vconsole.conf
