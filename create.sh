systemctl enable --now libvirtd;
virt-install --name=debian \
--vcpus=1 \
--memory=2048 \
--cdrom=/home/agara/Downloads/debian-12.4.0-amd64-netinst.iso \
--disk size=30.8 \
--os-variant=debian12