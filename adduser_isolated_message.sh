#!/bin/bash

USERNAME="$1"
PUBKEY="$2"

if [ -z "$USERNAME" ]; then
  echo "Usage: $0 <username> [ssh-public-key]"
  exit 1
fi

# Create user without sudo
useradd -m -s /bin/bash -G sharedusers "$USERNAME"
passwd "$USERNAME"

# Secure home directory
chmod 700 /home/"$USERNAME"

# Configure SSH
mkdir -p /home/"$USERNAME"/.ssh
chmod 700 /home/"$USERNAME"/.ssh
touch /home/"$USERNAME"/.ssh/authorized_keys
chmod 600 /home/"$USERNAME"/.ssh/authorized_keys
chown -R "$USERNAME:$USERNAME" /home/"$USERNAME"/.ssh

# Add public key if provided
if [ -n "$PUBKEY" ]; then
  echo "$PUBKEY" >> /home/"$USERNAME"/.ssh/authorized_keys
fi

# Add shared folder access
setfacl -m u:$USERNAME:rwx /mnt/shared

# Set welcome message
cat <<EOF > /etc/update-motd.d/99-welcome-$USERNAME
#!/bin/bash
echo "Welcome, $USERNAME! Your files are safe and isolated."
echo "Shared files can be found in /mnt/shared."
EOF

chmod +x /etc/update-motd.d/99-welcome-$USERNAME

echo "User $USERNAME created with SSH and welcome message."
