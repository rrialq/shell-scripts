#!/bin/bash

printf '         * Virtualbox Guest Additions installing...'
sudo pacman -Sy linux-lts linux-lts-headers virtualbox-guest-modules-arch virtualbox-guest-utils && printf '\r[OK   ]\n' || printf '\r[ERROR]\n'
