#!/bin/sh

BACKUPTIME=`date +%b-%d-%y`
cp /etc/samba/smb.conf /etc/samba/smb.conf.$BACKUPTIME

ADHOMES=/home/ADHomes/

mkdir $ADHOMES


read -p "Digit the number of users to be added: " USERSNUMB

for i in $(seq 1 $USERSNUMB);
	do

read -p "Digit the name of the user $i: "  NAMEUSER

adduser "$NAMEUSER"

mkdir $ADHOMES$NAMEUSER

chmod 770 $ADHOMES$NAMEUSER

chown $NAMEUSER:$NAMEUSER $ADHOMES$NAMEUSER

smbpasswd -a $NAMEUSER

echo [Home $NAMEUSER] >> /etc/samba/smb.conf
echo comment = Pasta Pessoal >> /etc/samba/smb.conf
echo path = $ADHOMES$NAMEUSER >> /etc/samba/smb.conf
echo available = yes >> /etc/samba/smb.conf
echo writable = yes >> /etc/samba/smb.conf
echo browsable = yes >> /etc/samba/smb.conf
echo valid users = @$NAMEUSER >> /etc/samba/smb.conf

# Here, beyond the user group, you also set privileges to the admins group, or IT, or etc... 
echo valid group = $NAMEUSER admin >> /etc/samba/smb.conf

echo create mask = 770 >> /etc/samba/smb.conf
echo directory mask = 770 >> /etc/samba/smb.conf
echo "" >> /etc/samba/smb.conf
echo "" >> /etc/samba/smb.conf

	done

echo "------------------------------------"
echo "Script successfully ended"
echo "------------------------------------"
