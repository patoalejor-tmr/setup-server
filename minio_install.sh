#!/bin/bash

# Exit on error
set -e

# Variables
MINIO_USER="minio"
MINIO_DIR="/opt/minio"
MINIO_DATA_DIR="/mnt/minio-data"
MINIO_PORT="9000"
MINIO_CONSOLE_PORT="9090"

# Create minio user
useradd -r -s /sbin/nologin $MINIO_USER

# Create directories
mkdir -p $MINIO_DIR $MINIO_DATA_DIR
chown -R $MINIO_USER:$MINIO_USER $MINIO_DIR $MINIO_DATA_DIR

# Download MinIO
curl -O https://dl.min.io/server/minio/release/linux-amd64/minio
install minio $MINIO_DIR/minio
chown $MINIO_USER:$MINIO_USER $MINIO_DIR/minio

# Create systemd service
cat <<EOF >/etc/systemd/system/minio.service
[Unit]
Description=MinIO
Documentation=https://docs.min.io
Wants=network-online.target
After=network-online.target

[Service]
User=$MINIO_USER
Group=$MINIO_USER
ExecStart=$MINIO_DIR/minio server $MINIO_DATA_DIR \
  --console-address ":$MINIO_CONSOLE_PORT" \
  --address ":$MINIO_PORT"
Restart=always
LimitNOFILE=65536

[Install]
WantedBy=multi-user.target
EOF

# Reload systemd and enable service
systemctl daemon-reexec
systemctl daemon-reload
systemctl enable --now minio

echo "✅ MinIO installed."
echo "🟢 Access Console: http://<your-server-ip>:$MINIO_CONSOLE_PORT"
echo "🔐 Default credentials: Set MINIO_ROOT_USER and MINIO_ROOT_PASSWORD as env vars in the service for production."
