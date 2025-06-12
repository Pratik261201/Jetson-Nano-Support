
## 🌐 Setup Jetson Nano for Remote Access (SSH, VNC)

Remotely manage your Jetson Nano over the network using secure shell (SSH) or a graphical desktop via VNC. Follow the steps below.

---

### 1. Enable & Configure SSH

1. **Install/OpenSSH server**  
   ```bash
   sudo apt update
   sudo apt install -y openssh-server
````

2. **Verify SSH service**

   ```bash
   sudo systemctl enable ssh
   sudo systemctl start ssh
   sudo systemctl status ssh
   ```
3. **(Optional) Harden SSH**
   Edit `/etc/ssh/sshd_config`:

   ```diff
   - PermitRootLogin yes
   + PermitRootLogin no
   - PasswordAuthentication yes
   + PasswordAuthentication no
   ```

   Then restart SSH:

   ```bash
   sudo systemctl restart ssh
   ```
4. **Connect from your host**

   ```bash
   ssh <username>@<jetson-ip-address>
   ```

   Replace `<username>` (e.g. `nvidia`) and `<jetson-ip-address>` (found via `ifconfig` or `ip a`).

---

### 2. Install & Configure VNC Server

You can use **TigerVNC** for a responsive remote desktop.

1. **Install TigerVNC**

   ```bash
   sudo apt update
   sudo apt install -y tigervnc-standalone-server tigervnc-common
   ```
2. **Set VNC password**

   ```bash
   vncpasswd
   ```

   You’ll be prompted to enter and verify a password (up to 8 chars).
3. **Create a VNC startup script**

   ```bash
   mkdir -p ~/.vnc
   cat << 'EOF' > ~/.vnc/xstartup
   #!/bin/sh
   unset SESSION_MANAGER
   unset DBUS_SESSION_BUS_ADDRESS
   exec /usr/bin/gnome-session & 
   EOF
   chmod +x ~/.vnc/xstartup
   ```
4. **Create a systemd service** (`~/vncserver@.service`)

   ```bash
   sudo tee /etc/systemd/system/vncserver@.service << 'EOF'
   [Unit]
   Description=TigerVNC remote desktop server (display %i)
   After=network.target

   [Service]
   Type=forking
   User=%i
   PAMName=login
   PIDFile=/home/%i/.vnc/%H:%i.pid
   ExecStartPre=-/usr/bin/vncserver -kill :%i
   ExecStart=/usr/bin/vncserver :%i -geometry 1280x720 -localhost
   ExecStop=/usr/bin/vncserver -kill :%i

   [Install]
   WantedBy=multi-user.target
   EOF
   ```
5. **Enable & start the VNC service**

   ```bash
   # Replace 'nvidia' with your username and choose display number (e.g. 1)
   sudo systemctl daemon-reload
   sudo systemctl enable vncserver@nvidia.service
   sudo systemctl start vncserver@nvidia.service
   ```
6. **Connect from your host**

   * Use a VNC client (TigerVNC Viewer, RealVNC, etc.).
   * Connect to `<jetson-ip-address>:1` (for display `:1`).
   * Enter the VNC password you set.

---

### 3. (Optional) Tunnel VNC over SSH

For added security, tunnel your VNC connection through SSH:

```bash
ssh -L 5901:localhost:5901 <username>@<jetson-ip-address>
```

Then point your VNC client to `localhost:1` on your local machine.

---

✅ **You’re all set!**
You can now log into your Jetson Nano remotely via SSH for command-line tasks, or via VNC for a full graphical desktop.
