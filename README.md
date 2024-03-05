# Termux-Root-Recovery-Tool
This tool install Twrp Recovery, Boot.img, vbmeta.img Magisk Root in bootloader unlocked devices only

installation :- 

1. Install [termux](https://f-droid.org/repo/com.termux_118.apk) & [Termux-api](https://f-droid.org/repo/com.termux.api_51.apk) apk
2. yes | pkg update && upgrade 
3. pkg install termux-api
4. install [termux-adb fastboot](https://github.com/nohajc/termux-adb)
   credit :- termux-adb - nohajc 
    1. git clone https://github.com/nohajc/termux-adb
    2. cd termux-adb
    3. bash install.sh
5. clone this repo to termux
6. cd Termux-Root-Recovery-Tool
7. chmod +x flash.sh

 Run Tool 
8. ./flash.sh

copy recovery.img boot.img & vbmeta.img to termux Termux-Root-Recovery-Tool Folder using any file xplorer 
