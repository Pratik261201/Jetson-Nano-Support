@echo off
chcp 65001 >nul

REM Folder 1: 🖥️ System Requirements
powershell -Command "New-Item -Path '🖥️ System Requirements' -ItemType Directory -Force"
powershell -Command "New-Item -Path '🖥️ System Requirements\README.md' -ItemType File -Force; Set-Content -Path '🖥️ System Requirements\README.md' -Value '# 🖥️ System Requirements'"

REM Folder 2: 💽 Installing the OS (Manual & SDK Manager)
powershell -Command "New-Item -Path '💽 Installing the OS (Manual & SDK Manager)' -ItemType Directory -Force"
powershell -Command "New-Item -Path '💽 Installing the OS (Manual & SDK Manager)\README.md' -ItemType File -Force; Set-Content -Path '💽 Installing the OS (Manual & SDK Manager)\README.md' -Value '# 💽 Installing the OS (Manual & SDK Manager)'"

REM Folder 3: 🔁 Reflashing Jetson Nano using NVIDIA SDK Manager
powershell -Command "New-Item -Path '🔁 Reflashing Jetson Nano using NVIDIA SDK Manager' -ItemType Directory -Force"
powershell -Command "New-Item -Path '🔁 Reflashing Jetson Nano using NVIDIA SDK Manager\README.md' -ItemType File -Force; Set-Content -Path '🔁 Reflashing Jetson Nano using NVIDIA SDK Manager\README.md' -Value '# 🔁 Reflashing Jetson Nano using NVIDIA SDK Manager'"

REM Folder 4: ⚙️ First Boot Setup
powershell -Command "New-Item -Path '⚙️ First Boot Setup' -ItemType Directory -Force"
powershell -Command "New-Item -Path '⚙️ First Boot Setup\README.md' -ItemType File -Force; Set-Content -Path '⚙️ First Boot Setup\README.md' -Value '# ⚙️ First Boot Setup'"

REM Folder 5: 🧠 Enabling CUDA & cuDNN
powershell -Command "New-Item -Path '🧠 Enabling CUDA & cuDNN' -ItemType Directory -Force"
powershell -Command "New-Item -Path '🧠 Enabling CUDA & cuDNN\README.md' -ItemType File -Force; Set-Content -Path '🧠 Enabling CUDA & cuDNN\README.md' -Value '# 🧠 Enabling CUDA & cuDNN'"

REM Folder 6: 📦 Installing OpenCV
powershell -Command "New-Item -Path '📦 Installing OpenCV' -ItemType Directory -Force"
powershell -Command "New-Item -Path '📦 Installing OpenCV\README.md' -ItemType File -Force; Set-Content -Path '📦 Installing OpenCV\README.md' -Value '# 📦 Installing OpenCV'"

REM Folder 7: 🔬 Installing PyTorch + TorchVision
powershell -Command "New-Item -Path '🔬 Installing PyTorch + TorchVision' -ItemType Directory -Force"
powershell -Command "New-Item -Path '🔬 Installing PyTorch + TorchVision\README.md' -ItemType File -Force; Set-Content -Path '🔬 Installing PyTorch + TorchVision\README.md' -Value '# 🔬 Installing PyTorch + TorchVision'"

REM Folder 8: 🧰 Installing TensorRT
powershell -Command "New-Item -Path '🧰 Installing TensorRT' -ItemType Directory -Force"
powershell -Command "New-Item -Path '🧰 Installing TensorRT\README.md' -ItemType File -Force; Set-Content -Path '🧰 Installing TensorRT\README.md' -Value '# 🧰 Installing TensorRT'"

REM Folder 9: 🔧 Change Boot Order (Boot from SSD/USB)
powershell -Command "New-Item -Path '🔧 Change Boot Order (Boot from SSD/USB)' -ItemType Directory -Force"
powershell -Command "New-Item -Path '🔧 Change Boot Order (Boot from SSD/USB)\README.md' -ItemType File -Force; Set-Content -Path '🔧 Change Boot Order (Boot from SSD/USB)\README.md' -Value '# 🔧 Change Boot Order (Boot from SSD/USB)'"

REM Folder 10: 🐍 Python Libraries & Pip Setup
powershell -Command "New-Item -Path '🐍 Python Libraries & Pip Setup' -ItemType Directory -Force"
powershell -Command "New-Item -Path '🐍 Python Libraries & Pip Setup\README.md' -ItemType File -Force; Set-Content -Path '🐍 Python Libraries & Pip Setup\README.md' -Value '# 🐍 Python Libraries & Pip Setup'"

REM Folder 11: 📤 Setup Jetson Nano for Remote Access (SSH, VNC)
powershell -Command "New-Item -Path '📤 Setup Jetson Nano for Remote Access (SSH, VNC)' -ItemType Directory -Force"
powershell -Command "New-Item -Path '📤 Setup Jetson Nano for Remote Access (SSH, VNC)\README.md' -ItemType File -Force; Set-Content -Path '📤 Setup Jetson Nano for Remote Access (SSH, VNC)\README.md' -Value '# 📤 Setup Jetson Nano for Remote Access (SSH, VNC)'"

REM Folder 12: 🔄 Tips on Expanding SWAP Memory
powershell -Command "New-Item -Path '🔄 Tips on Expanding SWAP Memory' -ItemType Directory -Force"
powershell -Command "New-Item -Path '🔄 Tips on Expanding SWAP Memory\README.md' -ItemType File -Force; Set-Content -Path '🔄 Tips on Expanding SWAP Memory\README.md' -Value '# 🔄 Tips on Expanding SWAP Memory'"

REM Folder 13: 📁 Enabling SPI/I2C/UART on GPIO
powershell -Command "New-Item -Path '📁 Enabling SPI/I2C/UART on GPIO' -ItemType Directory -Force"
powershell -Command "New-Item -Path '📁 Enabling SPI/I2C/UART on GPIO\README.md' -ItemType File -Force; Set-Content -Path '📁 Enabling SPI/I2C/UART on GPIO\README.md' -Value '# 📁 Enabling SPI/I2C/UART on GPIO'"

REM Folder 14: 📚 Useful Resources
powershell -Command "New-Item -Path '📚 Useful Resources' -ItemType Directory -Force"
powershell -Command "New-Item -Path '📚 Useful Resources\README.md' -ItemType File -Force; Set-Content -Path '📚 Useful Resources\README.md' -Value '# 📚 Useful Resources'"

echo All folders and README.md files created successfully!
pause
