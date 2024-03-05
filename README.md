# Termux-Root-Recovery-Tool
This tool install Twrp Recovery, Boot.img, vbmeta.img Magisk Root in bootloader unlocked devices only

# installation :- 

Install [termux](https://f-droid.org/repo/com.termux_118.apk) & [Termux-api](https://f-droid.org/repo/com.termux.api_51.apk) apk
```bash
yes | pkg update && upgrade
```
```bash
pkg install termux-api
```
```bash
pkg install git
```
# install Termux-adb
[termux-adb fastboot](https://github.com/nohajc/termux-adb) credit :- termux-adb - nohajc 

```bash
git clone https://github.com/nohajc/termux-adb
```
```bash
cd termux-adb
```
```bash
bash install.sh
```
```bash
cd $HOME
```

# Installation Termux-Root-Recovery-Tool

```bash
git clone https://github.com/Ishu43642/Termux-Root-Recovery-Tool.git
```

```bash
cd Termux-Root-Recovery-Tool
```
```bash
chmod +x flash.sh
```
# Run Tool 

```bash
./flash.sh
```

# copy recovery.img boot.img & vbmeta.img to termux Termux-Root-Recovery-Tool Folder using any file xplorer 

