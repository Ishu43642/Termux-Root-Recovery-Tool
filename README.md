# Termux-Root-Recovery-Tool
This tool install Twrp Recovery, Boot.img, vbmeta.img Magisk Root in bootloader unlocked devices only

# installation :- 

```Install``` [termux](https://f-droid.org/repo/com.termux_118.apk) & [Termux-api](https://f-droid.org/repo/com.termux.api_51.apk) ```apk```
```console
yes | pkg update && upgrade
```
```console
pkg install termux-api
```
```console
pkg install git
```
# install Termux-adb
[termux-adb fastboot](https://github.com/nohajc/termux-adb) credit :- termux-adb - [nohajc](https://github.com/nohajc)

```console
git clone https://github.com/nohajc/termux-adb
```
```console
cd termux-adb
```
```console
bash install.sh
```
```console
cd $HOME
```

# Installation Termux-Root-Recovery-Tool

```console
git clone https://github.com/Ishu43642/Termux-Root-Recovery-Tool.git
```

```console
cd Termux-Root-Recovery-Tool
```
```console
chmod +x flash.sh
```
# Run Tool 

```console
./flash.sh
```

# copy recovery.img boot.img & vbmeta.img to termux Termux-Root-Recovery-Tool Folder using any file xplorer 

