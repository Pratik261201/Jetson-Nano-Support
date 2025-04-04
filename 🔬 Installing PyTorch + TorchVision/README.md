# Steps for installing PyTorch & TorchVision with CUDA Support.md

## Step 01: Check The JetPack version on your NVIDIA Jetson Nano, you can use any of the following methods:

### Option 1 Using jetson_release script 
If it's already installed, run:
```bash
jetson_release
```
If not installed, install it with:
```bash
wget https://raw.githubusercontent.com/JetsonHacks/jetsonUtilities/master/jetson_release
chmod +x jetson_release
./jetson_release
```
This will show something like:
```bash
 - Jetson Nano (Developer Kit Version)
 - Jetpack 4.6.1 [L4T 32.7.1]
 - Ubuntu 18.04.5 LTS
```
### Option 02: Use dpkg to check JetPack components
Run:
```bash
dpkg -l | grep nvidia-l4t-core
```
Example output:
```bash
nvidia-l4t-core 32.7.1-20211123092915
```
So JetPack = 4.6.1.
## Step 02: Download the PyTorch Wheel File
Jetpack 4 supports PyTorch wheel  
 PyTorch v1.10.0
 PyTorch v1.9.0
 PyTorch v1.8.0
 PyTorch v1.7.0
 PyTorch v1.6.0
 PyTorch v1.5.0
 PyTorch v1.4.0
 PyTorch v1.3.0
 PyTorch v1.2.0
 PyTorch v1.1.0
 PyTorch v1.0.0
Better to Use PyTorch v1.8.0 which is more stable and compatable with other Libraries 
Command For Installing 
```bash
wget https://nvidia.box.com/shared/static/p57jwntv436lfrd78inwl7iml6p13fzh.whl -O torch-1.8.0-cp36-cp36m-linux_aarch64.whl
```
## 🧩 Step 2: Install Required Dependencies
Install Python 3 pip and other necessary libraries.
```bash
sudo apt-get install python3-pip libopenblas-base libopenmpi-dev libomp-dev
```
## 📦 Step 3: Install Python Packages
Install Cython (version < 3), Numpy & PyTorch wheel
```bash
pip3 install numpy torch-1.8.0-cp36-cp36m-linux_aarch64.whl
```
✅ You now have PyTorch installed on your Jetson device for Python 3.

### Installing TorchVision from Source on Jetson
Follow these steps to install TorchVision from source on your Jetson device. Be sure to select the correct version of TorchVision compatible with your installed PyTorch version.

## Step 01: Select the version of torchvision to download depending on the version of PyTorch that you have installed:
PyTorch v1.0 - torchvision v0.2.2
PyTorch v1.1 - torchvision v0.3.0
PyTorch v1.2 - torchvision v0.4.0
PyTorch v1.3 - torchvision v0.4.2
PyTorch v1.4 - torchvision v0.5.0
PyTorch v1.5 - torchvision v0.6.0
PyTorch v1.6 - torchvision v0.7.0
PyTorch v1.7 - torchvision v0.8.1
PyTorch v1.8 - torchvision v0.9.0
PyTorch v1.9 - torchvision v0.10.0
PyTorch v1.10 - torchvision v0.11.1

## 🛠 Step 1: Install Required System Dependencies
Install the required libraries and development packages.
```bash
sudo apt-get install libjpeg-dev zlib1g-dev libpython3-dev libopenblas-dev libavcodec-dev libavformat-dev libswscale-dev
```
## 📥 Step 2: Clone the TorchVision Repository
Replace <version> with the appropriate branch that matches your PyTorch version (e.g., v0.8.0, v0.9.0).
```bash
git clone --branch <version> https://github.com/pytorch/vision torchvision
```
## 📂 Step 3: Build and Install TorchVision
1. Navigate into the cloned repository:
   ```bash
   cd torchvision
   ```
2. Set the build version (replace 0.x.0 with the correct version):
   ```bash
   export BUILD_VERSION=0.x.0
   ```
3. Build and install TorchVision:
   ```bash
   python3 setup.py install --user
   ```
4. Navigate out of the build directory (loading from it may cause import errors):
   ```bash
   cd ../
   ```
## 🖼 Step 4: Install Pillow (if required):
Install an appropriate version of Pillow. This is typically required for older Python versions or specific TorchVision versions:
```bash
pip install 'pillow<7'
```
📝 Note: Pillow is always required for Python 2.7, but not needed for TorchVision v0.5.0+ if you're using Python 3.6+.

### Steps for Verification for Pytorch & Torch Vision

## Step 01: Open Terminal
## Step 02: Run Python3
```bash
Python3
```
## Step 03: Run Python3 Code one by one
```bash
>>> import torch
>>> print(torch.__version__)
>>> print('CUDA available: ' + str(torch.cuda.is_available()))
>>> print('cuDNN version: ' + str(torch.backends.cudnn.version()))
>>> a = torch.cuda.FloatTensor(2).zero_()
>>> print('Tensor a = ' + str(a))
>>> b = torch.randn(2).cuda()
>>> print('Tensor b = ' + str(b))
>>> c = a + b
>>> print('Tensor c = ' + str(c))
```
```bash
>>> import torchvision
>>> print(torchvision.__version__)
```
