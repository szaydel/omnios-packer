ISOFILE="VBoxGuestAdditions.iso"

if [ -d "${ISOFILE}" ]; then
  echo "Installing VirtualBox Guest Additions"
  echo "mail=\ninstance=overwrite\npartial=quit" > /tmp/noask.admin
  echo "runlevel=nocheck\nidepend=quit\nrdepend=quit" >> /tmp/noask.admin
  echo "space=quit\nsetuid=nocheck\nconflict=nocheck" >> /tmp/noask.admin
  echo "action=nocheck\nbasedir=default" >> /tmp/noask.admin

  mkdir /mnt/vbga
  VBGADEV=`lofiadm -a $ISOFILE`
  mount -o ro -F hsfs $VBGADEV /mnt/vbga
  pkgadd -a /tmp/noask.admin -G -d /mnt/vbga/VBoxSolarisAdditions.pkg all
  umount /mnt/vbga
  lofiadm -d $VBGADEV
  rm -f VBoxGuestAdditions.iso

  echo "guest-additions.sh done"
else
  echo "skipping guest-additions.sh"
fi
