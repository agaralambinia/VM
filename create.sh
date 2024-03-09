#!/bin/bash

# Download debian.iso
if [ ! -f ./debian.iso ]; then
    wget https://www.debian.org/download#:~:text=debian%2D12.4.0%2Damd64%2Dnetinst.iso -O debian.iso
fi

#Create VM
#basefolder - папка для конфигурации ВМ, в школе это goinfree
VBoxManage createvm --name debian42 --ostype "Debian_64" --register --basefolder /Users/agaralambinia/vms/ #--password-id password-id
#Set memory and network
VBoxManage modifyvm debian42 --memory 1024 --vram 128 --cpus 1
#Create Disk and connect Debian Iso
VBoxManage createmedium --filename /Users/agaralambinia/debian42/disk.vdi --size 315392 --format VDI

#Start the VM
VBoxHeadless --startvm debian42