#!/bin/bash

# Exit on error
set -e

# Constants
SHARED_GROUP="sharedusers"
SHARED_DIR="/mnt/shared"
DEFAULT_SHELL="/bin/bash"

# Install necessary packages
apt update && apt install -y sudo ufw openssh-server acl

# Create shared group and directory
groupadd -f $SHARED_GROUP
mkdir -p $SHARED_DIR
chgrp $SHARED_GROUP $SHARED_DIR
chmod 2770 $SHARED_DIR
setfacl -d -m g::$SHARED_GROUP $SHARED_DIR

# SSH config hardening
sed -i 's/^#\?PasswordAuthentication.*/PasswordAuthentication no/' /etc/ssh/sshd_config
sed -i 's/^#\?PermitRootLogin.*/PermitRootLogin no/' /etc/ssh/sshd_config
systemctl restart ssh

# UFW firewall setup
ufw default deny incoming
ufw default allow outgoing
ufw allow ssh
ufw enable

echo "Setup complete. Use 'adduser_isolated USERNAME' to add new users."
