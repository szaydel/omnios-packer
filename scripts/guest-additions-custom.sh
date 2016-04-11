echo "Installing VirtualBox Guest Additions (illumos build)"
echo "mail=\ninstance=overwrite\npartial=quit" > /tmp/noask.admin
echo "runlevel=nocheck\nidepend=quit\nrdepend=quit" >> /tmp/noask.admin
echo "space=quit\nsetuid=nocheck\nconflict=nocheck" >> /tmp/noask.admin
echo "action=nocheck\nbasedir=default" >> /tmp/noask.admin

mkdir /tmp/vbga
echo "**** !!!! TEMPORARY REMOTE URL FOR VBGA !!!! ****"
echo "**** !!!! TEMPORARY REMOTE URL FOR VBGA !!!! ****"
echo "**** !!!! TEMPORARY REMOTE URL FOR VBGA !!!! ****"
echo "**** !!!! TEMPORARY REMOTE URL FOR VBGA !!!! ****"
curl -o /tmp/vbga/vbga-omnios.pkg.gz http://elemental.org/VBoxSolarisAdditions-omnios.pkg.gz
gunzip /tmp/vbga/vbga-omnios.pkg.gz
pkgadd -a /tmp/noask.admin -G -d /tmp/vbga/vbga-omnios.pkg all

rm -rf /tmp/vbga
rm /tmp/noask.admin

echo "guest-additions-custom.sh done"
