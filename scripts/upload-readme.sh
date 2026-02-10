#!/bin/bash

# Upload README.md to SMB share
# Usage: sudo ./scripts/upload-readme.sh

SMB_HOST="192.168.0.10"
SMB_SHARE="usb_storage"
USERNAME="admin"
PASSWORD='''"""dicx4Sc0tt^^"""'''

echo "Uploading README.md to SMB share..."

# Create mount point
mkdir -p /mnt/smb

# Mount SMB share
mount -t cifs //$SMB_HOST/$SMB_SHARE /mnt/smb \
    -o username=$USERNAME,password=$PASSWORD,uid=$(id -u),gid=$(id -g)

# Copy README.md
cp README.md /mnt/smb/

# Unmount
umount /mnt/smb

echo "✓ README.md uploaded to smb://$SMB_HOST/$SMB_SHARE"