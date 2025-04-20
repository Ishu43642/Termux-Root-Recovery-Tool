<img align="right" src="TRRT.jpg" width="350" alt="Termux Root Recovery Tool">

# Termux Root Recovery Tool

A powerful tool for Android system operations through Termux. This tool enables you to flash GSI ROMs, Fastboot ROMs, TWRP Recovery, boot images, vbmeta images, and more - all without needing a computer, just your Android device with Termux.

## Features

- 🔄 Flash recovery, boot, and vbmeta images
- 📱 Support for A/B partition devices 
- 🌐 GSI ROM flashing capabilities
- 📦 Stock ROM flashing utility
- 🛠️ ADB sideload functionality
- 🚀 Device reboot options (fastboot, recovery, system)
- 🔍 Check device connections (ADB and fastboot)
- 💾 Partition management (for dynamic partitions)
- 🔠 Tab completion for file paths
- 🎨 Beautiful and intuitive user interface

## Requirements

- Android device with unlocked bootloader
- [Termux](https://f-droid.org/repo/com.termux_118.apk) and [Termux-API](https://f-droid.org/repo/com.termux.api_51.apk) installed
- USB debugging enabled in developer options
- Proper USB connection if flashing external device

## Installation

### 1. Install Termux and Termux-API

Download and install both applications from F-Droid:
- [Termux](https://f-droid.org/repo/com.termux_118.apk)
- [Termux-API](https://f-droid.org/repo/com.termux.api_51.apk)

### 2. Set up Termux environment

Update packages and set up storage access:
```console
yes | pkg update && upgrade
```
```console
termux-setup-storage
```
```console
pkg install termux-api
```
```console
yes | pkg install git
```

### 3. Install Termux Root Recovery Tool

Clone the repository and set execution permissions:
```console
git clone https://github.com/Ishu43642/Termux-Root-Recovery-Tool.git
```
```console
cd Termux-Root-Recovery-Tool
```
```console
chmod +x flash.sh && chmod +x flash-stock-rom.sh && chmod +x flashAB.sh && chmod +x gsi-flash.sh && chmod +x installadb.sh
```

### 4. Install ADB and Fastboot in Termux

Run the installer script:
```console
bash installadb.sh
```

Credit: ADB/Fastboot for Termux by [nohajc](https://github.com/nohajc/termux-adb)

## Usage

### Starting the Tool

Launch the main interface:
```console
./flash.sh
```

### Main Features

The tool provides a menu-driven interface with the following options:

1. **Flash Recovery** - Flash recovery images to your device
2. **Flash VBMETA** - Flash vbmeta images with verity disabled
3. **Flash Boot Image** - Flash boot images (useful for Magisk root)
4. **Check ADB Devices** - List connected devices in ADB mode
5. **Check Fastboot Devices** - List connected devices in fastboot mode
6. **Flash ZIP via ADB Sideload** - Sideload custom ROMs or mods
7. **Reboot to Fastboot Mode** - Reboot the device to fastboot
8. **Reboot System** - Reboot device to normal system
9. **Reboot to Recovery Mode** - Reboot device to recovery
10. **AB Partition Tool** - Access A/B partition specific operations
11. **Flash Fastboot ROM** - Flash full stock ROMs
12. **Flash GSI ROM** - Flash Generic System Images

### A/B Partition Tool

For devices with A/B partition scheme, specialized options:

- Flash boot to specific slots (A or B)
- Flash recovery to specific slots
- Boot directly to TWRP without flashing
- Check and switch active slots

### GSI Flashing

Tools for GSI ROM installation:

- Check fastboot device connectivity
- Flash VBMETA with verification disabled
- Switch between fastboot and fastbootd modes
- Check userspace compatibility
- Erase system partition
- Delete logical partitions
- Flash GSI system images

### Stock ROM Flashing

For flashing complete stock firmware packages:

1. Rename your fastboot ROM folder to `stock-rom`
2. Copy the `stock-rom` folder to the Download folder in your internal storage
3. Select the "Flash Fastboot ROM" option in the main menu
4. Choose from available flashing options:
   - Flash without locking bootloader
   - Flash and lock bootloader
   - Flash except data storage

## File Navigation

The tool supports tab completion for file paths, making it easy to navigate to your ROM files, images, or other files needed for operations.

## Notes

- All operations require an unlocked bootloader
- Some operations may void your warranty
- Always have backups before flashing anything
- The tool works best with a proper USB connection
- For some devices, you may need specific drivers

## Credits

- ADB/Fastboot for Termux: [nohajc](https://github.com/nohajc/termux-adb)
- Original Tool: [Ishu43642](https://github.com/Ishu43642)

## License

This project is available as open source under the terms of the MIT License.
