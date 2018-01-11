#!/bin/bash

. ./configuration


setTheKeyboardLayout() {
    title '1.1 Set the keyboard layout'
    loadkeys es
}

connectToTheInternet() {
    title '1.3 Connect to the Internet'
    ping -c1 archlinux.org
}

updateTheSystemClock() {
    title '1.4 Update the system clock'
    timedatectl set-ntp true
}

partitionTheDisks() {
    title '1.5 Partition the disks'
    title '    * Creating GPT Partition table'
    echo "label: gpt" | sfdisk /dev/sda 
    title '    * Creating /Bios boot partition: 2M'
    echo ',2M,21686148-6449-6E6F-744E-656564454649,*' | sfdisk /dev/sda
    title '    * Creating /boot partition: 1512M'
    echo ',1512M' | sfdisk -a /dev/sda
    title '    * Creating / partition: The rest of the disk'
    echo ',,' | sfdisk -a /dev/sda
}

formatThePartitions() {
    title '1.6 Format the partitions'
    title '    * Formatting /dev/sda2'
    mkfs.xfs -f /dev/sda2
    title '    * Formatting /dev/sda3'
    mkfs.xfs -f /dev/sda3
}

mountTheFileSystems() {
    title '1.7 Mount the partitions'
    mount /dev/sda3 /mnt 
    mkdir /mnt/boot
    mount /dev/sda2 /mnt/boot
}

title '1. Pre-installation'
setTheKeyboardLayout \
&& connectToTheInternet \
&& updateTheSystemClock \
&& partitionTheDisks \
&& formatThePartitions \
&& mountTheFileSystems
