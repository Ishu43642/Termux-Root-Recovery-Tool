# Termux-Root-Recovery-Tool
This tool install Twrp Recovery, Boot.img &amp; vbmeta.img files in bootloader unlocked devices only

Usage :- 

1. Install termux & termux api apk
2. pkg update && upgrade 
3. pkg install termux-api
4. install termux-adb fastboot tool
  credit :- termux-adb - nohajc 
    1. git clone https://github.com/nohajc/termux-adb
    2. cd termux-adb
    3. bash install.sh
5. clone this repo to termux
6. chmod +x flash.sh
7. ./flash.sh

copy recovery.img boot.img & vbmeta.img to termux root directory 
