# Realtek RTL8188EUS WiFi Antenna Installer and Configuration

This repository contains drivers for the Realtek RTL8188EUS WiFi antenna and a series of scripts that facilitate its installation and configuration on Linux systems.  
**Important:** The drivers in the `drivers` folder were obtained from the original repository at https://github.com/aircrack-ng/rtl8188eus.

[![Monitor mode](https://img.shields.io/badge/monitor%20mode-supported-brightgreen.svg)](#)
[![Linux supported](https://img.shields.io/badge/Linux-supported-brightgreen.svg)](#)

---
## Repository Contents

- **drivers/**  
  Folder containing the drivers obtained from the original source.

- **install_linux_headers.sh**  

- **setup.sh**

- **startWifi.sh**

---

## Requirements

- Debian/Ubuntu-based Linux distribution (using `apt` for package installation).
- Superuser permissions(`sudo`).
- Internet connection to update packages and download dependencies.

---

## Installation and Usage Instructions

### 1. Clone the Repository

```bash
git clone https://github.com/ernestoo-v/Realtek-RTL8188EUS-drivers.git
```

### 2. Navigate to the Repository Directory

```bash
cd REALTEK-RTL8188EUS
```

### 3. Grant Execution Permissions to the Scripts

```bash
chmod +x install_linux_headers.sh setup.sh startWifi.sh
```

### 4. Run the Script to Install Linux Headers

```bash
./install_linux_headers.sh
```
> :warning: **Warning**: Installing `linux-headers-generic` modifies critical system components needed to compile kernel modules. Make sure that the installed headers correspond to your current kernel version. If an incompatible version is installed, you may experience compilation or system functionality issues.

### 5. Restart the System
After installing the headers, restart your computer for the changes to take effect.

### 6. Run the Driver Configuration and Compilation Script

```bash
./setup.sh
```
- This script:
  - Updates the package list.
  - Checks for and installs specific Linux headers if necessary.
  - Removes any conflicting modules.
  - Compiles and installs the driver contained in the `drivers` folder. 
  - Configures the system to avoid conflicts by creating a blacklist file.

### 7. Run the WiFi Antenna Configuration Script

```bash
./startWifi.sh
```
- This script configures the WiFi antenna by: 
  - Loading the `8188eu` module for the Realtek RTL8188EUS chipset.
  - Restarting the `NetworkManager` service.
  - Prompting the user to disconnect and reconnect the USB WiFi adapter.
  - Waiting for the `wlan0` interface to appear.
  - Terminating processes that might interfere and activating monitor mode on the interface.


## Credits and Acknowledgements

**Drivers**: The drivers in the `drivers` folder were obtained from the original repository at https://github.com/aircrack-ng/rtl8188eus.git. Thank you for sharing and contributing to the community!

**Script Development**: Ernesto Villar

