#!/bin/bash
# Exit immediately if any command fails
set -e

echo "🔧 Installing XFCE and X2Go Server..."

# Update and install XFCE (lightweight desktop)
apt update
DEBIAN_FRONTEND=noninteractive apt install -y xfce4 xfce4-goodies

# Install X2Go Server
apt install -y x2goserver x2goserver-xsession

echo "✅ XFCE and X2Go Server installed."

# Set default shell environment to allow CLI-first workflows
echo "Users will connect via SSH by default. GUI via X2Go is available on demand."
