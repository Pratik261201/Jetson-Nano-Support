
## Python Libraries & Pip Setup

To develop and run your Python applications on the Jetson Nano, follow these steps to get your pip environment and libraries in order.

---

### 1. Install or Upgrade `pip`

Make sure you have Python 3 and pip installed:

```bash
sudo apt update
sudo apt install -y python3-pip python3-venv
````

Then upgrade pip, setuptools, and wheel to the latest versions:

```bash
sudo pip3 install --upgrade pip setuptools wheel
```

---

### 2. (Optional) Create a Virtual Environment

Using a virtual environment keeps your project dependencies isolated:

```bash
# Create a venv named "venv"
python3 -m venv venv

# Activate it
source venv/bin/activate
```

After activation, your prompt will be prefixed with `(venv)`. All `pip install` commands will now install into this venv.

---

### 3. Prepare a `requirements.txt`

List all your Python dependencies in a `requirements.txt` at your repo root. For example:

```text
numpy
scipy
opencv-python
jetson-stats
torch      # if you plan to use PyTorch on Jetson
torchvision
Pillow
requests
```

---

### 4. Install from `requirements.txt`

With your virtual environment activated (or system pip if you skipped the venv):

```bash
pip install -r requirements.txt
```

This will install each library listed in the file.

---

### 5. Installing Jetson-Optimized Packages

For GPU-accelerated packages (e.g. PyTorch), use NVIDIA’s Jetson wheels:

```bash
# Example: install PyTorch & torchvision for Jetson
pip install --extra-index-url https://download.pytorch.org/whl/torch_stable.html torch torchvision
```

Check NVIDIA’s official docs for the correct wheel URLs matching your JetPack version.

---

### 6. Verify Installations

After installation, verify that your key libraries are importable:

```bash
python3 - <<EOF
import numpy, scipy, cv2, torch
print("All imports succeeded!")
EOF
```

If you see `All imports succeeded!`, you’re ready to start coding.

---

*Your Python environment is now set up — you can install any additional packages via `pip install <package>` as needed for your project!*

```
```
