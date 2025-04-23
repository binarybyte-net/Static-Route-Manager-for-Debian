# 🛣️ Static Route Manager for Debian

This is a lightweight tool to **add, remove, and persist static routes** on Debian-based systems.  
It includes an interactive script for route management and a boot-time script to reapply saved routes.

---

## 📦 What's Included?

- `manage_static_routes.sh` — Interactive script to add/remove routes
- `apply_static_routes.sh` — Script to reapply routes on reboot
- `/etc/my_static_routes.conf` — Route storage file
- Crontab line to reapply routes on every boot

---

## 🚀 Quick Setup Guide

### ✅ 1. Download or Clone This Repo

```bash
git clone https://github.com/yourusername/static-route-manager.git
cd static-route-manager
```
### ✅ 2. Install the Scripts

```bash
sudo cp manage_static_routes.sh /usr/local/bin/
sudo cp apply_static_routes.sh /usr/local/bin/
sudo chmod +x /usr/local/bin/manage_static_routes.sh
sudo chmod +x /usr/local/bin/apply_static_routes.sh
```
### ✅ 3. Create the Persistent Route Storage File

```bash
sudo touch /etc/my_static_routes.conf
sudo chmod 644 /etc/my_static_routes.conf
```

### ✅ 4. Add Crontab Entry to Auto-Reapply on Boot

```
@reboot /usr/local/bin/apply_static_routes.sh
```

### ✏️ Notes

    - You may need to edit the scripts if your:
    -  Network interface is not ens192
    - Gateway is different from 192.168.190.250
    - The file paths assume a user named debian. Adjust as needed.

✅ Test It Works

    - Add a route using 
```bash 
sudo manage_static_routes.sh
```
    - Confirm it exists: ip route
    - Reboot your system
    - Check again — the route should still be there ✔️

🛡️ License

MIT License — use it, fork it, break it, improve it.
