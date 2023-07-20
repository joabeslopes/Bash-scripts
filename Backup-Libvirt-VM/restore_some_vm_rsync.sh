#!/bin/bash

# Restore the VMs that were sent with the backup script

ipBakupServer=0.0.0.0
portBakupServer=22
userBakupServer=user
folderBakupServer=/backup/folder
VmFolder=/var/lib/libvirt/images #Default Libvirt folder

for vm in "$@"
do
rsync -ave "ssh -p $portBakupServer" --mkpath --sparse $userBakupServer@$ipBakupServer:$folderBakupServer/$vm $vmFolder/restore/

mv $vmFolder/restore/$vm/$vm.qcow2 $vmFolder

virsh define $vmFolder/restore/$vm/$vm.xml
done
rm -r $vmFolder/restore