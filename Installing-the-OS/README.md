
## 💽 Installing the OS (Manual & with SDK Manager)

You can install the Jetson Nano operating system either by manually flashing the SD card, or by using NVIDIA’s SDK Manager from an Ubuntu host machine.

---

### A) Manual SD Card Flashing

1. **Download** the Jetson Nano SD Card image  
   https://developer.nvidia.com/embedded/downloads  
2. **Flash** the `.img` to a **microSD** (16 GB min, 32 GB+ recommended) using [balenaEtcher](https://www.balena.io/etcher/) or `dd`.  
   ```bash
   # Example with dd (Linux/macOS):
   sudo dd if=jetson-nano-sd-card-image.img \
            of=/dev/<your-sd-device> bs=4M status=progress && sync
````

3. **Insert** the flashed microSD into the slot on the underside of the Jetson Nano.
4. **Connect** your HDMI display, USB keyboard & mouse, and Ethernet (or plan for Wi-Fi later).
5. **Power On** the board (barrel jack or Micro-USB).
6. **Complete** the on-screen First-Boot Wizard (language, user account, timezone, Wi-Fi, accept NVIDIA EULA).

---

### B) Installing via NVIDIA SDK Manager

> **Requires:**
>
> * A separate Ubuntu 18.04 or 20.04 PC (host)
> * USB A ↔ Micro-USB cable

1. **Install SDK Manager** on your Ubuntu host:

   ```bash
   # Download the .deb from NVIDIA:
   https://developer.nvidia.com/nvidia-sdk-manager  
   sudo apt install ./sdkmanager_<version>_amd64.deb
   ```
2. **Launch** SDK Manager:

   ```bash
   sdkmanager
   ```
3. **Log in** with your NVIDIA Developer account.
4. **Select**:

   * **Product Category:** Jetson
   * **Hardware Platform:** Jetson Nano
   * **Target Operating System:** Linux
5. Click **“Continue”**, then under **“Installation Options”** choose:

   * **Jetson OS (SD Card Image)**
   * **Jetson SDK Components** (CUDA, cuDNN, TensorRT, etc.)
6. **Follow** the on-screen prompts:

   * Connect Nano to host via Micro-USB (it will appear in **Recovery Mode**).
   * Let SDK Manager **flash** the SD card image and **install** additional packages over the network.
7. When complete, **power-cycle** the Jetson Nano and proceed with the First-Boot Wizard on the board itself.

---

🎉 Your Jetson Nano is now running the latest JetPack software, ready for development!

```
```
