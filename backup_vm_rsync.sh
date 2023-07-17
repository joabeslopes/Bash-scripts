#!/bin/bash

# If you use qemu/kvm virtual machines, with programs like virt-manager, this script will help you to backup all of your vms to a file server using rsync.
# It creates a folder for each vm, and place there the disk file and the xml of the vm.

# Note that this is a simple script, so it works well if your vm have only one disk.
# If you need more than one disk, i recommend to put then into a separate folder.

ipBakupServer=0.0.0.0
portBakupServer=22
userBakupServer=user
folderBakupServer=/backup/folder
VmFolder=/var/lib/libvirt/images #Default Libvirt folder

cd $VmFolder

for vm in ./* # Open the vm folder and take each file
do
	vm=${vm%*.qcow2}	# Ignore the file extension
 	vm=${vm##*/}	# Ignore all path to the file

	virsh dumpxml $vm > $vm.xml
	rsync -ave "ssh -p $portBakupServer" --mkpath --sparse $vm.* $userBakupServer@$ipBakupServer:$folderBakupServer/$vm/
rm $vm.xml
done
