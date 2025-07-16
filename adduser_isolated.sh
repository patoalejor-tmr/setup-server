#!/bin/bash

USERNAME="$1"
if [ -z "$USERNAME" ]; then
  echo "Usage: $0 <username>"
  exit 1
fi

# Create user with no sudo
useradd -m -s /bin/bash -G sharedusers "$USERNAME"
passwd "$USERNAME"

# Set user folder permissions
chmod 700 /home/"$USERNAME"

# Add shared folder access
setfacl -m u:$USERNAME:rwx /mnt/shared

echo "User $USERNAME created with isolated home and shared folder access."
