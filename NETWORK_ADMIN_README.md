# 🧰 Setup Instructions for Network Administrator

## 1. Initial Server Setup
- Use Ubuntu 22.04 with GUI installed
- Ensure static IP or DHCP reservation from your router
- Install required system packages

```bash
sudo bash /mnt/data/server_setup/server_init.sh
```

## 2. Install X2Go Server and XFCE Desktop
```bash
sudo bash /mnt/data/server_setup/x2go_xfce_install.sh
```

## 3. Add New Users (no sudo, isolated)
```bash
sudo bash /mnt/data/server_setup/adduser_isolated.sh username "ssh-rsa AAAAB3..."
```

## 4. Optional: Install MinIO (S3-like file sharing)
```bash
sudo bash /mnt/data/server_setup/minio_install.sh
```

## 5. Configure SSH Server (already included)
- Headless CLI access by default
- GUI on demand via X2Go

## 6. Test Connectivity
- Test SSH access from client
- Test X2Go client from Windows/macOS/Linux

---

# 🛡 Security Summary
- Users isolated from each other
- No sudo permissions
- Shared data goes in `/mnt/shared`
- Firewall enabled (UFW), SSH only
- SSH key-based login only