#!/bin/bash

. ./configuration

setTheKeyboardLayout() {
    echo '1.1 Set the keyboard layout'
    loadkeys es > ${LOG_FILENAME} 2>&1
}

connectToTheInternet() {
    echo '1.3 Connect to the Internet'
    ping -c1 archlinux.org > ${LOG_FILENAME} 2>&1
}

updateTheSystemClock() {
    echo '1.4 Update the system clock'
    timedatectl set-ntp true > ${LOG_FILENAME} 2>&1
}

partitionTheDisks() {
    echo '1.5 Partition the disks'
    echo '    * Creating GPT Partition table'
    echo "label: gpt" | sfdisk /dev/sda
    echo '    * Creating /Bios boot partition: 2M'
    echo ',2M,21686148-6449-6E6F-744E-656564454649,*' | sfdisk /dev/sda > ${LOG_FILENAME} 2>&1
    echo '    * Creating /boot partition: 1512M'
    echo ',1512M' | sfdisk -a /dev/sda > ${LOG_FILENAME} 2>&1
    echo '    * Creating / partition: The rest of the disk'
    echo ',,' | sfdisk -a /dev/sda > ${LOG_FILENAME} 2>&1
}

formatThePartitions() {
    echo '1.6 Format the partitions'
    echo '    * Formatting /dev/sda2'
    mkfs.xfs /dev/sda2 > ${LOG_FILENAME} 2>&1
    echo '    * Formatting /dev/sda3'
    mkfs.xfs /dev/sda3 > ${LOG_FILENAME} 2>&1
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
