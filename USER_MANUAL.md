# 👤 User Guide: Accessing the Robotics Server

## Option 1: CLI (Recommended)
Use this for coding, running simulations, using ROS2 tools.

### ✅ Steps
1. Ask admin to create your account
2. Use SSH to connect:
```bash
ssh yourname@server_ip
```

## Option 2: GUI via X2Go
Use this for graphical apps like VS Code GUI, RViz, Gedit, etc.

### ✅ Steps
1. Install [X2Go Client](https://wiki.x2go.org/doku.php)
2. Create a new session:
   - Host: server IP
   - Session type: XFCE
3. Connect using your username and password

## Shared Folder
You can access `/mnt/shared` for team files.

## Your Home Folder
You are the only one with access to your `/home/yourname` folder.

## Important
- You do not have sudo access
- Disconnect from X2Go when done to save resources

---

## 🔐 How to Set Up Your SSH Key (Required)

This is required to securely access the server.

### Step-by-Step (on your local machine):

1. **Open your terminal**

2. Run the following command:
```bash
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
```

3. When prompted:
   - **Save to default location**: just press `Enter`
   - **Passphrase**: optional, but recommended

4. Your key will be created at:
   - Public key: `~/.ssh/id_rsa.pub`
   - Private key: `~/.ssh/id_rsa` (do **not** share this!)

5. Send the contents of your **public key** to the network admin:
```bash
cat ~/.ssh/id_rsa.pub
```

Copy the full output and send it via a secure channel (e.g., email or chat).

Once added by the admin, you'll be able to connect like this:
```bash
ssh yourname@server_ip
```

If this is your first time using SSH keys and need help, ask the admin for guidance.