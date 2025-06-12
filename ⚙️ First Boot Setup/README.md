
# NVIDIA Jetson Nano — First Boot Setup

This document walks you through the **very first power‐on and initial setup** of your NVIDIA Jetson Nano Developer Kit.

---

## 1. Download & Flash the SD Card

1. **Download** the latest Jetson Nano SD Card image from NVIDIA:  
   https://developer.nvidia.com/embedded/downloads
2. **Flash** the `.img` to a **UHS-1** (or better) microSD card (16 GB minimum, 32 GB+ recommended) using:  
   - **Etcher** (Windows / macOS / Linux)  
   - or **`dd`** (Linux / macOS):  
     ```bash
     sudo dd if=jetson-nano-sd-card-image.img of=/dev/<your-sd-card> bs=4M status=progress && sync
     ```

---

## 2. Insert the microSD Card

1. Power **off** the Jetson Nano (if on).
2. Push the flashed microSD card into the slot on the underside of the board until it clicks.

---

## 3. Connect Peripherals

- **Display**: HDMI (or DisplayPort via adapter) → monitor/TV  
- **Input**: USB keyboard + USB mouse  
- **Network**: Ethernet cable → router (or USB-Wi-Fi adapter)  
- **Power**:  
  - **Barrel jack**: 5 V ⎓ 4 A DC supply (recommended)  
  - **Micro-USB**: ≥ 2 A adapter (barely sufficient; performance may be limited)

---

## 4. Power On

- Flip the barrel-jack power switch (if used) or plug in the micro-USB cable.  
- The green LED lights up and the Jetson begins booting from the SD card.

---

## 5. Complete the First-Boot Wizard

When the Ubuntu desktop installer appears:

1. **Language & Keyboard**  
2. **Wi-Fi Setup** (if using USB adapter)  
3. **User Account**  
   - Choose a **username**  
   - Set a **strong password**  
4. **Timezone** (e.g., Asia/Kolkata)  
5. **Accept** NVIDIA license terms  

Wait for the initial user‐configuration to finish and the desktop to load.

---

## 6. Update the System

Open a terminal and run:

```bash
sudo apt update && sudo apt upgrade -y
````

> **Optional:**
> For the full JetPack software stack (CUDA, cuDNN, TensorRT, etc.), use **NVIDIA SDK Manager** on an Ubuntu host to install over the network.

---

## 7. Reboot & Verify

1. Reboot:

   ```bash
   sudo reboot
   ```
2. After reboot, confirm:

   ```bash
   uname -a            # Shows the Jetson kernel
   df -h /             # Rootfs on microSD
   jetson_release      # Displays JetPack/OS version
   ```

---

🎉 **Your Jetson Nano is now ready for AI, robotics, and edge-compute development!**

```
```
