# 🚀 Jetson Nano Setup and Development Guide

A complete resource for getting started and working with NVIDIA Jetson Nano — covering everything from OS installation to CUDA setup and deep learning framework integration.

---

## 📚 Table of Contents

1. [Install Operating System on Jetson Nano](./docs/Install_OS.md)
2. [Reflash Jetson Nano OS using NVIDIA SDK Manager](./docs/Reflash_OS_SDKManager.md)
3. [Change Boot Order in Jetson Nano](./docs/Change_Boot_Order.md)
4. [Enable CUDA and cuDNN on Jetson Nano](./docs/Enable_CUDA_cuDNN.md)
5. [Install PyTorch & TorchVision with CUDA Support](./docs/PyTorch_TorchVision_CUDA.md)
6. [Jetson Nano Useful Commands & Scripts](./docs/JetsonNano_Commands.md)
7. [Jetson Nano Troubleshooting Guide](./docs/Troubleshooting.md)
8. [Jetson Nano Performance Optimization](./docs/Performance_Optimization.md)
9. [Jetson Nano Projects and Examples](./docs/Projects_and_Examples.md)


# Jetson Nano Complete Setup Guide

Welcome to the ultimate guide for setting up and optimizing your NVIDIA Jetson Nano. This guide will walk you through everything from installing the OS to enabling CUDA, changing the boot order, and installing essential AI libraries like PyTorch, OpenCV, and TensorRT.

---

## 📋 Table of Contents

1. [System Requirements](#system-requirements)
2. [Installing the OS](#installing-the-os)
3. [Reflashing with NVIDIA SDK Manager](#reflashing-with-nvidia-sdk-manager)
4. [First Boot Setup](#first-boot-setup)
5. [Enable CUDA & cuDNN](#enable-cuda--cudnn)
6. [Installing OpenCV](#installing-opencv)
7. [Installing PyTorch & TorchVision](#installing-pytorch--torchvision)
8. [Installing TensorRT](#installing-tensorrt)
9. [Changing Boot Order](#changing-boot-order)
10. [Python & Pip Setup](#python--pip-setup)
11. [Remote Access Setup](#remote-access-setup)
12. [Expand SWAP Memory](#expand-swap-memory)
13. [Enable GPIO Features](#enable-gpio-features)
14. [Useful Resources](#useful-resources)

---

## 💽 Installing the OS

1. Download Jetson Nano SD card image from: [https://developer.nvidia.com/embedded/downloads](https://developer.nvidia.com/embedded/downloads)
2. Flash it to a microSD using [balenaEtcher](https://www.balena.io/etcher/)
3. Insert the SD card into Jetson Nano and power it on

---

## 🔁 Reflashing with NVIDIA SDK Manager

1. Download [NVIDIA SDK Manager](https://developer.nvidia.com/nvidia-sdk-manager)
2. Connect Jetson Nano via micro-USB (recovery mode)
3. Select your Jetson device and JetPack version
4. Follow the on-screen instructions to reflash the OS and install SDK components

---

## ⚙️ First Boot Setup

1. Accept EULA and create a user account
2. Connect to WiFi or Ethernet
3. Update packages:
```bash
sudo apt update && sudo apt upgrade -y
```

---

## 🧠 Enable CUDA & cuDNN

CUDA and cuDNN are installed with JetPack. Verify installation:
```bash
nvcc --version
```
```bash
cat /usr/include/cudnn_version.h | grep CUDNN_MAJOR -A 2
```

---

## 📦 Installing OpenCV

OpenCV comes pre-installed with JetPack. If needed, install manually:
```bash
sudo apt install libopencv-dev python3-opencv
```

---

## 🔬 Installing PyTorch & TorchVision

Visit: [Jetson Zoo PyTorch Wheels](https://forums.developer.nvidia.com/t/pytorch-for-jetson/72048)

Example for PyTorch 1.8.0:
```bash
wget https://nvidia.box.com/shared/static/p57jwntv436lfrd78inwl7iml6p13fzh.whl -O torch-1.8.0-cp36-cp36m-linux_aarch64.whl
sudo apt-get install python3-pip libopenblas-base libopenmpi-dev libomp-dev
pip3 install 'Cython<3'
pip3 install numpy torch-1.8.0-cp36-cp36m-linux_aarch64.whl
```

Install TorchVision:
```bash
sudo apt-get install libjpeg-dev zlib1g-dev libpython3-dev libopenblas-dev libavcodec-dev libavformat-dev libswscale-dev
git clone --branch v0.9.0 https://github.com/pytorch/vision torchvision
cd torchvision
export BUILD_VERSION=0.9.0
python3 setup.py install --user
```

---

## 🧰 Installing TensorRT

TensorRT is installed by default with JetPack.

Verify installation:
```bash
dpkg -l | grep tensorrt
```

---

## 🔧 Changing Boot Order (e.g. boot from SSD/USB)

1. Create a bootable SSD or USB
2. Update `extlinux.conf` file:
```bash
sudo nano /boot/extlinux/extlinux.conf
```
3. Change root device path to `/dev/sda1` or your USB/SSD partition
4. Save and reboot

---

## 🐍 Python & Pip Setup

```bash
sudo apt install python3-pip
pip3 install --upgrade pip
```

---

## 📤 Remote Access Setup

### SSH:
```bash
sudo systemctl enable ssh
sudo systemctl start ssh
```

### VNC:
```bash
sudo apt install vino
```
Use GUI to enable desktop sharing under Settings > Sharing

---

## 🔄 Expand SWAP Memory

```bash
sudo fallocate -l 4G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
```
Add to `/etc/fstab` for persistence:
```
/swapfile none swap sw 0 0
```

---

## 📁 Enable GPIO Features

Enable I2C/SPI/UART using Jetson-IO:
```bash
sudo /opt/nvidia/jetson-io/jetson-io.py
```
Select the interfaces you want and reboot

---

## 📚 Useful Resources

- [Jetson Nano Developer Guide](https://developer.nvidia.com/embedded/learn/get-started-jetson-nano-devkit)
- [Jetson Hacks GitHub](https://github.com/JetsonHacks)
- [PyTorch for Jetson](https://forums.developer.nvidia.com/t/pytorch-for-jetson/72048)
- [Jetson Zoo](https://elinux.org/Jetson_Zoo)

---

## 👨‍💻 Maintainer

**Your Name**  
GitHub: [your-username](https://github.com/your-username)

---

> ⚠️ This guide is continuously updated. Pull requests are welcome!



## 🧠 About

This repository is a curated guide for anyone working with Jetson Nano for AI, robotics, and embedded system development. Each section contains easy-to-follow instructions to help you set up, configure, and develop AI-powered applications efficiently.

---
