
## Enabling SPI / I2C / UART on GPIO

By default, many of the Nano’s GPIO pins are configured as simple digital I/O. You can remap them to SPI, I²C, or UART using NVIDIA’s Jetson-IO tool or by manually editing the device-tree. Below are both methods.

---

### A) Using the Jetson-IO Configuration Tool

1. **Launch Jetson-IO**  
   ```bash
   sudo /opt/nvidia/jetson-io/jetson-io.py
````

2. **Select a Preset or Custom Pinmux**

   * Choose **“Configure 40-pin header”**
   * Either select one of the example configurations (e.g. “SPI/I²C Combo”)
   * Or pick **“Custom”** to individually assign SPI, I2C, UART, GPIO, etc.
3. **Write the New Configuration**

   * Confirm and let the tool regenerate and deploy the new device-tree blob.
4. **Reboot**

   ```bash
   sudo reboot
   ```
5. **Verify Interfaces**

   * I²C buses:

     ```bash
     ls /dev/i2c-*
     ```
   * SPI buses:

     ```bash
     ls /dev/spidev*
     ```
   * UART ports:

     ```bash
     ls /dev/ttyTHS*
     ```

---

### B) Manual Device-Tree Overlay (Advanced)

1. **Install the Base Device-Tree Source**

   ```bash
   sudo apt install device-tree-compiler
   mkdir -p ~/dtb_build && cd ~/dtb_build
   apt source linux-tegra
   ```
2. **Create or Edit an Overlay**

   * Copy the Nano’s base DTS (e.g. `tegra194-p2597-0000-p3448-0000.dts`) into your build folder.
   * Add or uncomment the SPI/I2C/UART node(s) under `/tegra194-p3448-0000-pinmux { … };`
   * Example (enable I2C1):

     ```dts
     pinctrl_i2c1: i2c1-phy {
       pins {
         tps65218_pwr_good {
           pinmux = "i2c1";
           drive-strength = <4>;
           bias-pull-up;
         };
       };
       status = "okay";
     };
     ```
3. **Compile the Overlay**

   ```bash
   dtc -I dts -O dtb -o SPI_I2C_UART.dtbo your_overlay.dts
   ```
4. **Deploy the `.dtbo`**

   ```bash
   sudo cp SPI_I2C_UART.dtbo /boot/dtb/overlays/
   ```
5. **Edit `/boot/extlinux/extlinux.conf`**
   Add under your `APPEND` line:

   ```
   FDTOVERLAYS=SPI_I2C_UART.dtbo
   ```
6. **Reboot & Verify**

   ```bash
   sudo reboot
   ls /dev/i2c-*  # I2C
   ls /dev/spidev*  # SPI
   ls /dev/ttyTHS*  # UART
   ```

---

📌 **Tip:**

* Always double-check the pin numbers in the [Jetson Nano Developer Kit Pinmux Guide](https://developer.nvidia.com/jetson-nano) before assigning.
* I²C bus names on Nano are typically `/dev/i2c-0` and `/dev/i2c-1`.
* SPI on Nano appears as `/dev/spidev0.0` and `/dev/spidev0.1` by default.
* Onboard UART (TX0/RX0) is `/dev/ttyTHS1`.

With these steps you can flexibly repurpose the 40-pin header for all your SPI, I²C, and UART needs!

```
```
