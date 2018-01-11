#!/bin/bash

. ./configuration

exec 2> ${LOG_FILENAME}

setTheKeyboardLayout() {
    echo '1.1 Set the keyboard layout'
    loadkeys es
}

connectToTheInternet() {
    echo '1.3 Connect to the Internet'
    ping -c1 archlinux.org
}

updateTheSystemClock() {
    echo '1.4 Update the system clock'
    timedatectl set-ntp true
}

partitionTheDisks() {
    echo '1.5 Partition the disks'
    echo '    * Creating GPT Partition table'
    echo "label: gpt" | sfdisk /dev/sda 
    echo '    * Creating /Bios boot partition: 2M'
    echo ',2M,21686148-6449-6E6F-744E-656564454649,*' | sfdisk /dev/sda
    echo '    * Creating /boot partition: 1512M'
    echo ',1512M' | sfdisk -a /dev/sda
    echo '    * Creating / partition: The rest of the disk'
    echo ',,' | sfdisk -a /dev/sda
}

formatThePartitions() {
    echo '1.6 Format the partitions'
    echo '    * Formatting /dev/sda2'
    mkfs.xfs -f /dev/sda2
    echo '    * Formatting /dev/sda3'
    mkfs.xfs -f /dev/sda3
}

mountThePartitions() {
    echo '1.7 Mount the partitions'
    mount /dev/sda3 /mnt 
    mkdir /mnt/boot
    mount /dev/sda2 /mnt/boot
}

echo '1. Pre-installation'
setTheKeyboardLayout \
&& connectToTheInternet \
&& updateTheSystemClock \
&& partitionTheDisks \
&& formatThePartitions \
&& mountTheFileSystems
