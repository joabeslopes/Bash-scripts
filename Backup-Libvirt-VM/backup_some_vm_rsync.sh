#!/bin/bash

# Same as the normal script, but insted of backup all VMs, you choose the VM names that you want to backup

#ex: ./script_name.sh vmWindows vmLinuxMint

# You need to have access permission with a ssh key, and read/write permissions.

# Note that this is a simple script, so it works well if your vm have only one disk, and the disk name is the same as the VM name.
# If you need more than one disk, i recommend to put then into a separate folder.

ipBakupServer=0.0.0.0
portBakupServer=22
userBakupServer=user
folderBakupServer=/backup/folder
VmFolder=/var/lib/libvirt/images #Default Libvirt folder

cd $VmFolder

for vm in "$@"  # pick all passed arguments
do

	virsh dumpxml $vm > $vm.xml
	rsync -ave "ssh -p $portBakupServer" --mkpath --sparse $vm.* $userBakupServer@$ipBakupServer:$folderBakupServer/$vm/
rm $vm.xml
done
