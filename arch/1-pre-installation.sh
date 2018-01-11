#!/bin/bash

setTheKeyboardLayout() {
    echo '1.1 Set the keyboard layout'
    loadkeys es
}

connectToTheInternet() {
    echo '1.3 Connect to the Internet'
    ping archlinux.org
}

updateTheSystemClock() {
    echo '1.4 Update the system clock'
    timedatectl set-ntp true
}

partitionTheDisks() {
    echo '1.5 Partition the disks'
    echo '    /Bios boot: 2M'
    echo '    /boot: 1512M'
    echo '    /: The rest of the disk'
    echo "label: gpt" | sfdisk /dev/sda
    echo ',2M,21686148-6449-6E6F-744E-656564454649,*\n,1512M\n,,' | sfdisk /dev/sda
}

formatThePartitions() {
    echo '1.6 Format the partitions'
    mkfs.ext4 /dev/sda1
    mkfs.ext4 /dev/sda2
}

mountThePartitions() {
    echo '1.7 Mount the partitions'
    mount /dev/sda2 /mnt
    mkdir /mnt/boot
    mount /dev/sda1 /mnt/boot
}

echo '1. Pre-installation'
setTheKeyboardLayout \
&& connectToTheInternet \
&& updateTheSystemClock \
&& partitionTheDisks \
&& formatThePartitions \
&& mountTheFileSystems
