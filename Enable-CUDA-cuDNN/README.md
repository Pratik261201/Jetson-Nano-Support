# NVIDIA JetPack SDK Installation Guide for Jetson Nano

This guide provides step-by-step instructions to enable CUDA and cuDNN on your Jetson Nano.

---

## Step 1: Update and Upgrade System Packages

Before proceeding with the installation, ensure your system packages are up to date.

```bash
sudo apt update
sudo apt upgrade
```

---

## Step 2: Verify CUDA Version

Check if CUDA is installed and verify its version.

```bash
nvcc --version
```

---

## Step 3: Install NVIDIA JetPack SDK

The NVIDIA JetPack SDK includes CUDA, cuDNN, and TensorRT. It is recommended to install it using the NVIDIA SDK Manager.

### Option 1: Install via NVIDIA SDK Manager (Recommended)
1. **Download NVIDIA SDK Manager**  
   - [Download SDK Manager](https://developer.nvidia.com/sdk-manager)  
   - **Note:** Use **Ubuntu 18** since newer versions do not support Jetson Nano JetPack (4.1 - 4.6). Later versions are optimized for Jetson Orin and newer computers.

2. **Install JetPack Using SDK Manager**  
   - Follow the graphical interface (GUI) instructions in SDK Manager.  
   - Flash the SD card and complete the JetPack installation.  

For further details, refer to the [JetPack Documentation](https://developer.nvidia.com/embedded/jetpack).

### Option 2: Alternatively, if you prefer a manual installation:

```bash
sudo apt install nvidia-jetpack
```

---

## Step 4: Install CUDA Toolkit (if needed)

If the CUDA Toolkit is missing or requires updating:

```bash
sudo apt install cuda-toolkit-10-2
```

*Note:* Jetson Nano supports CUDA 10.2 as part of JetPack 4.x.

---

## Step 5: Add CUDA to Path

Update your environment variables to include CUDA paths.

```bash
export PATH=/usr/local/cuda/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH
```

Then run:

```bash
source ~/.bashrc
```

---

## Step 6: Reboot

Reboot your system to ensure all changes take effect.

```bash
sudo reboot
```

---

## Step 7: Verify CUDA Installation

To confirm everything is set up correctly, run:

```bash
nvcc --version
```

To test GPU capabilities, compile and run the CUDA device query sample:

```bash
cd /usr/local/cuda/samples/1_Utilities/deviceQuery
sudo make
./deviceQuery
```

You should see output confirming your GPU details.

---

## Step 8: Install cuDNN (if needed)

Jetson Nano often ships with cuDNN. If it is missing, install it via:

```bash
sudo apt install libcudnn8
```

---

## Step 9: Verify Final Setup

After rebooting, check the following versions:

- **CUDA version:**
  ```bash
  nvcc --version
  ```

- **cuDNN version:**
  ```bash
  cat /usr/include/cudnn_version.h | grep CUDNN_MAJOR -A 2
  ```

- **TensorRT version:**
  ```bash
  dpkg -l | grep nvinfer
  ```

---

Happy coding and enjoy your enhanced Jetson Nano experience!
