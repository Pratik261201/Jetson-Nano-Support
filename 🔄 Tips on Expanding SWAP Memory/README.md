
## 🧠 Tips on Expanding SWAP Memory

Jetson Nano ships with a small default swap; heavier workloads may require more. Below are a few approaches:

1. **Create a Swap File**  
   ```bash
   # Allocate a 4 GB swap file
   sudo fallocate -l 4G /swapfile
   sudo chmod 600 /swapfile
   sudo mkswap /swapfile
   sudo swapon /swapfile
````

* Verify with `sudo swapon --show` or `free -h`.
* To make permanent, add to `/etc/fstab`:

  ```
  /swapfile none swap sw 0 0
  ```

2. **Adjust Swappiness**
   Controls how aggressively Linux uses swap vs. RAM (default 60). Lower = prefers RAM longer.

   ```bash
   # Check current
   cat /proc/sys/vm/swappiness
   # Set to 10 (for example)
   sudo sysctl vm.swappiness=10
   # To persist, add to /etc/sysctl.conf:
   vm.swappiness=10
   ```

3. **Use zram (Compressed RAM Swap)**
   zram uses RAM for a compressed swap device—boosts performance on flash-bound systems.

   ```bash
   sudo apt install zram-tools
   # By default, it creates one half-RAM zram device; tweak /etc/default/zramswap
   ```

4. **Enable Swap on External Storage**
   If you have a fast USB drive or SSD attached:

   ```bash
   sudo fallocate -l 2G /mnt/ssd/swapfile
   sudo chmod 600 /mnt/ssd/swapfile
   sudo mkswap /mnt/ssd/swapfile
   sudo swapon /mnt/ssd/swapfile
   ```

   And add to `/etc/fstab` similarly.

5. **Monitor Swap Usage**

   ```bash
   watch -n1 free -h
   vmstat 1
   ```

   Adjust swap size and swappiness until your workloads stop thrashing.

With these tips, you can fine-tune your Jetson Nano’s memory behavior to suit heavier AI and data-processing tasks.

```
```
