
## 🔄 Reflashing Jetson Nano using NVIDIA SDK Manager

If you need to restore or update your Jetson Nano image, NVIDIA SDK Manager makes reflashing easy. You’ll need an Ubuntu host (18.04 or 20.04) with SDK Manager installed.

---

### 1. Install & Launch SDK Manager on Host

1. **Download** the latest SDK Manager `.deb`:  
   https://developer.nvidia.com/nvidia-sdk-manager  
2. **Install** it on your Ubuntu machine:  
   ```bash
   sudo apt update
   sudo apt install ./sdkmanager_<version>_amd64.deb
````

3. **Start** SDK Manager:

   ```bash
   sdkmanager
   ```

---

### 2. Prepare Jetson Nano in Recovery Mode

1. **Power off** your Jetson Nano.
2. **Hold down** the **RECOVERY** button (the small button near the GPIO header).
3. **While holding**, connect the Nano to your host via the micro-USB cable.
4. **Release** the RECOVERY button.
5. On the host, verify with:

   ```bash
   lsusb | grep NVIDIA
   ```

   You should see an entry like `NVIDIA Corp.` indicating recovery mode.

---

### 3. Configure Flash Settings

1. In SDK Manager, **log in** with your NVIDIA Developer account.
2. Under **“Jetson”**, select:

   * **Hardware Platform:** Jetson Nano
   * **Target OS:** Linux
3. Click **“Continue”**, then in the next screen:

   * For **“Jetson OS”**, choose the desired **JetPack** version.
   * Check the box **“Flash OS Image to Target”**.
   * Optionally select additional SDK components (CUDA, cuDNN, TensorRT, etc.).

---

### 4. Flash the Device

1. Click **“Flash”**.
2. SDK Manager will:

   * Download the necessary components.
   * Flash the SD card image onto your Nano’s eMMC (or onboard storage).
   * Install selected SDK packages over the network.
3. **Wait** until the process completes (this can take 15–30 minutes).

---

### 5. Finalize & First Boot

1. When flashing finishes, **power-cycle** your Jetson Nano (disconnect and reconnect power).
2. Let it boot from the newly flashed image—go through the **First-Boot Wizard** if prompted.
3. **Verify** the installation:

   ```bash
   uname -a            # shows updated kernel
   jetson_release      # shows new JetPack version
   ```

---

🎉 Your Jetson Nano is now reflashed with the latest JetPack and ready for development!

```
```
