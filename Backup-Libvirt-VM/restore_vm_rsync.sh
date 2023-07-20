#!/bin/bash

# Restore the VMs that were sent with the backup script

ipBakupServer=0.0.0.0
portBakupServer=22
userBakupServer=user
folderBakupServer=/backup/folder
vmFolder=/var/lib/libvirt/images #Default Libvirt folder

rsync -ave "ssh -p $portBakupServer" --mkpath --sparse $userBakupServer@$ipBakupServer:$folderBakupServer/* $vmFolder/restore

for vm in $vmFolder/restore/* # Temporary folder to restore all the VMs
do
        vm=${vm##*/} #Ignore all the path of the folders
	mv $vmFolder/restore/$vm/$vm.qcow2 $vmFolder
        virsh define $vmFolder/restore/$vm/$vm.xml
done
rm -r $vmFolder/restore
