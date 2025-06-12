
## 🤖 Installing TensorRT

TensorRT is NVIDIA’s high-performance deep learning inference library. On Jetson Nano (with JetPack), it’s pre-packaged—here’s how to install and verify it.

---

### 1. Update Package Lists

```bash
sudo apt update
````

---

### 2. Install TensorRT Runtime & Samples

```bash
sudo apt install -y \
  libnvinfer8 \
  libnvinfer-plugin8 \
  libnvonnxparsers8 \
  libnvparsers8 \
  python3-libnvinfer
```

> * Version suffix (`8`) may vary with your JetPack release.
> * `python3-libnvinfer` installs the TensorRT Python bindings.

---

### 3. (Optional) Install Developer & Documentation Packages

If you need headers and samples for custom builds:

```bash
sudo apt install -y \
  libnvinfer-dev \
  libnvonnxparsers-dev \
  libnvparsers-dev \
  uff-converter-tf
```

---

### 4. Verify Your Installation

Run the official TensorRT samples:

```bash
cd /usr/src/tensorrt/samples
sudo make -j$(nproc)
```

Then execute one of the samples, for example:

```bash
cd bin
./sample_mnist
```

You should see output indicating successful network load and inference accuracy.

---

### 5. Use TensorRT in Python

In your Python script or REPL (virtualenv activated if using one):

```python
import tensorrt as trt
print("TensorRT version:", trt.__version__)
```

If it prints a valid version number, you’re ready to build and run optimized engines.

---

🎉 **TensorRT is now installed**—you can accelerate your neural network inference on the Jetson Nano!

```
```
