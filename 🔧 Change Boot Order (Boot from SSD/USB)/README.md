````markdown
# How to Format the SD Card as ext4

In this guide, we’ll walk you through moving your Jetson module’s root filesystem from eMMC to an SD card, mounting it directly at boot for faster startup times. This approach improves on the previous method (see [old blog post](https://www.forecr.io/blogs/bsp-development/changing-storage-of-the-root-file-system-emmc-to-sdmmc)) by eliminating the post-mount service delay. 

> **Warning:** After changing your root filesystem, your Jetson will not boot without the SD card unless you update `extlinux.conf`. We strongly recommend backing up your module before proceeding.

---

## Prerequisites

1. Jetson module powered off  
2. SD card inserted into the onboard slot  
3. Ethernet, HDMI, keyboard & mouse connected  
4. Basic familiarity with Linux command line  

Power on your Jetson and open a terminal.

---

## 1. Prepare the Jetson for High Performance

```bash
sudo jetson_clocks
````

This command unlocks maximum CPU/GPU frequencies for the entire boot process.

---

## 2. Launch GNOME Disks

```bash
gnome-disks
```

![](images/1boot.png)

The first command allows the Jetson module’s whole sources to use. The next command opens GNOME Disks application below.

![](images/2boot.png)

## 3. Format the SD Card

Format the whole disk before creating the storage.
![](images/3boot.png)
![](images/4boot.png)
![](images/boot5.png)

Then, create a new partition from SD card storage.
![](images/boot6.png)
![](images/boot7.png)

Format the disk as ext4 format (partition size is up to you but must be min current file system’s size).
![](images/boot8.png)

After creating the partition, check it’s name (`/dev/mmcblk1p1`).
![](images/boot9.png)

---

## How to Copy the Root File System?

Download the script file from here:
`https://github.com/forecr/forecr_blog_files/raw/master/change_rootfs_storage_direct-emmc_to_sdmmc.zip` and extract it. Then, run it with this command below:

```bash
sudo ./change_rootfs_storage_direct-emmc_to_sdmmc.sh {EXTERNAL_STORAGE}
```

In our setup, we typed this command below:

```bash
sudo ./change_rootfs_storage_direct-emmc_to_sdmmc.sh /dev/mmcblk1p1
```

![](images/boot10.png)

A few times later, the whole file system copied and the root path changed.
![](images/boot11.png)

It’s time to reboot the Jetson module. Reboot it and check the Root File System copied successfully.

---

## How to Assign SD Card as Root File System?

Open a terminal and type this command to check the root mounted from SD card below:

```bash
df -h
```

![](images/boot12.png)


```
```
