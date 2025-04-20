#!/bin/bash
trap "echo -e '\033[0;31m Script execution aborted. \033[0m'; exit 1" INT

clear
echo -e "\033[1;36m
╔═══════════════════════════════════════════════╗
║  \033[1;33m★ \033[1;37mTermux Root Recovery Tool \033[1;33m★\033[1;36m             ║
╠═══════════════════════════════════════════════╣
║  \033[1;32mFlash • Recover • Root • Customize\033[1;36m         ║
╚═══════════════════════════════════════════════╝
\033[0m"

echo -e "\033[1;35m╭───────────────────────────────────────────────╮\033[0m"
echo -e "\033[1;35m│\033[1;33m          What would you like to do?           \033[1;35m│\033[0m"
echo -e "\033[1;35m╰───────────────────────────────────────────────╯\033[0m"

echo -e "\033[1;34m┌──────────────────────────────────────────────┐\033[0m"
echo -e "\033[1;34m│ \033[1;37m 1. \033[1;92mFlash Recovery                           \033[1;34m│\033[0m"
echo -e "\033[1;34m│ \033[1;37m 2. \033[1;92mFlash VBMETA                             \033[1;34m│\033[0m"
echo -e "\033[1;34m│ \033[1;37m 3. \033[1;92mFlash Boot image                         \033[1;34m│\033[0m"
echo -e "\033[1;34m│ \033[1;37m 4. \033[1;92mCheck adb devices                        \033[1;34m│\033[0m"
echo -e "\033[1;34m│ \033[1;37m 5. \033[1;92mCheck fastboot devices                   \033[1;34m│\033[0m"
echo -e "\033[1;34m│ \033[1;37m 6. \033[1;92mFlash Zip adb Sideload                   \033[1;34m│\033[0m"
echo -e "\033[1;34m│ \033[1;37m 7. \033[1;92mReboot To Fastboot Mode                  \033[1;34m│\033[0m"
echo -e "\033[1;34m│ \033[1;37m 8. \033[1;92mReboot System (From fastboot)            \033[1;34m│\033[0m"
echo -e "\033[1;34m│ \033[1;37m 9. \033[1;92mReboot To Recovery Mode                  \033[1;34m│\033[0m"
echo -e "\033[1;34m│ \033[1;37m10. \033[1;92mAB Partition Tool                        \033[1;34m│\033[0m"
echo -e "\033[1;34m│ \033[1;37m11. \033[1;92mFlash Fastboot Rom                       \033[1;34m│\033[0m"
echo -e "\033[1;34m│ \033[1;37m12. \033[1;92mFlash GSi Rom (Dynamic Partition)        \033[1;34m│\033[0m"
echo -e "\033[1;34m└──────────────────────────────────────────────┘\033[0m"

echo -e "\033[1;33m╭───────────────────────────────────────────────╮\033[0m"
echo -e "\033[1;33m│ \033[1;97mEnter your choice or press any key to exit    \033[1;33m│\033[0m"
echo -e "\033[1;33m╰───────────────────────────────────────────────╯\033[0m"

read -p $'\033[1;36mChoice: \033[0m' flasher

case $flasher in
  "1")

     echo -e "\033[1;36m╭───────────────────────────────────────────────╮\033[0m"
     echo -e "\033[1;36m│\033[1;33m       Recovery Flash Operation               \033[1;36m│\033[0m"
     echo -e "\033[1;36m╰───────────────────────────────────────────────╯\033[0m"
     
     echo -e "\033[1;92m► Please enter the recovery file location. \033[0m";
    read -p $'\033[1;97mEnter the recovery path: \033[0m' romname

    if [ ! -f "$romname" ]; then
        echo -e "\033[1;31m✗ $romname file is not found \033[0m";
        echo -e "\033[1;31m\033[3m Please ensure that '$romname' file exists and try again. \033[0m";
        exit 1;
    fi

    echo -e "\033[1;33m⚡ Flashing recovery... \033[0m"
    termux-fastboot flash recovery $romname

    
    read -p $'\033[1;97mDo you want to flash vbmeta.img file? Type \033[1;92my\033[1;97m to flash, any key to skip: \033[0m' vbimg;

    if [ "$vbimg" = "y" ] || [ "$vbimg" = "yes" ] || [ "$vbimg" = "Y" ] || [ "$vbimg" = "YES" ]; then
      echo -e "\033[1;92m► Please enter the vbmeta file location. \033[0m";
    read -p $'\033[1;97mEnter the vbmeta path: \033[0m' romname

    if [ ! -f "$romname" ]; then
        echo -e "\033[1;31m✗ $romname file is not found \033[0m";
        echo -e "\033[1;31m\033[3m Please ensure that '$romname' file exists and try again. \033[0m";
        exit 1;
    fi

    echo -e "\033[1;33m⚡ Flashing vbmeta... \033[0m"
    termux-fastboot --disable-verity --disable-verification flash vbmeta $romname

    else
      echo -e "\033[1;33m◌ Skipping vbmeta.img flash \033[0m";
    fi

    if [ $? -eq 0 ]; then
      echo -e "\033[1;32m✓ Operation completed successfully! \033[0m";
    fi

    source ./flash.sh
  ;;
  "2")
     echo -e "\033[1;36m╭───────────────────────────────────────────────╮\033[0m"
     echo -e "\033[1;36m│\033[1;33m        VBMETA Flash Operation                \033[1;36m│\033[0m"
     echo -e "\033[1;36m╰───────────────────────────────────────────────╯\033[0m"
     
     echo -e "\033[1;92m► Please enter the vbmeta file location. \033[0m";
    read -p $'\033[1;97mEnter the vbmeta path: \033[0m' romname

    if [ ! -f "$romname" ]; then
        echo -e "\033[1;31m✗ $romname file is not found \033[0m";
        echo -e "\033[1;31m\033[3m Please ensure that '$romname' file exists and try again. \033[0m";
        exit 1;
    fi

    echo -e "\033[1;33m⚡ Flashing vbmeta... \033[0m"
    termux-fastboot --disable-verity --disable-verification flash vbmeta $romname

    if [ $? -eq 0 ]; then
      echo -e "\033[1;32m✓ Operation completed successfully! \033[0m";
    fi

    source ./flash.sh

  ;;
  "6")

    echo -e "\033[1;36m╭───────────────────────────────────────────────╮\033[0m"
    echo -e "\033[1;36m│\033[1;33m        ADB Sideload Operation                \033[1;36m│\033[0m"
    echo -e "\033[1;36m╰───────────────────────────────────────────────╯\033[0m"

    echo -e "\033[1;92m► Please enter the file name of your custom rom. \033[0m";
    read -p $'\033[1;97mEnter the zip file name: \033[0m' romname

    if [ ! -f "$romname" ]; then
        echo -e "\033[1;31m✗ $romname file is not found \033[0m";
        echo -e "\033[1;31m\033[3m Please ensure that '$romname' file exists and try again. \033[0m";
        exit 1;
    fi

    echo -e "\033[1;33m⚡ Running sideload... \033[0m"
    termux-adb sideload $romname

    if [ $? -eq 0 ]; then
      echo -e "\033[1;32m✓ Sideload operation completed successfully! \033[0m";
    fi

    source ./flash.sh
    
  ;;
  "4")
    echo -e "\033[1;36m╭───────────────────────────────────────────────╮\033[0m"
    echo -e "\033[1;36m│\033[1;33m        ADB Devices Check                     \033[1;36m│\033[0m"
    echo -e "\033[1;36m╰───────────────────────────────────────────────╯\033[0m"
    
    echo -e "\033[1;92m► Checking ADB devices: \033[0m"
    termux-adb devices

    source ./flash.sh
  ;;
  "5")
    echo -e "\033[1;36m╭───────────────────────────────────────────────╮\033[0m"
    echo -e "\033[1;36m│\033[1;33m        Fastboot Devices Check                \033[1;36m│\033[0m"
    echo -e "\033[1;36m╰───────────────────────────────────────────────╯\033[0m"
    
    echo -e "\033[1;92m► Checking Fastboot devices: \033[0m"
    termux-fastboot devices

    source ./flash.sh
  ;;
  "11")
    echo -e "\033[0;32m Flashing Miui Rom Have a good day! \033[0m";
    cp flash-stock-rom.sh /storage/emulated/0/Download/stock-rom
    cd /storage/emulated/0/Download/stock-rom
    bash flash-stock-rom.sh

    source ./flash.sh
  ;;
  "3")
    
  echo -e "\033[0;32m Please enter the boot file location. \033[0m";
    read -p "Enter the boot path: " romname

    if [ ! -f "$romname" ]; then
        echo -e "\033[0;31m > $romname file is not found \033[0m";
        echo -e "\033[0;31m \033[3m Please ensure that '$romname' file exist and try again. Have a good day! \033[0m";
        exit 1;
    fi

    termux-fastboot flash boot $romname

    source ./flash.sh


  ;;
"8")

    echo -e "\033[0;32m Rebooting Device to system ! Have a good day! \033[0m";
    termux-fastboot reboot

    source ./flash.sh
  ;;
"7")
    echo -e "\033[0;32m Rebooting your device to Fastboot Mode !Have a good day! \033[0m";
    termux-adb reboot bootloader

    source ./flash.sh
  ;;
"9")
    echo -e "\033[0;32m Rebooting your device to Recovery Mode ! Have a good day! \033[0m";
    termux-adb reboot recovery

    source ./flash.sh
  ;;
"12")
    echo -e "\033[0;32m Launching GSi Flash Tool! \033[0m";
    ./gsi-flash.sh

    source ./flash.sh
  ;;
"10")
    
  echo -e "\033[0;32m Launching AB Partition Device Tool! \033[0m";
    ./flashAB.sh

source ./flash.sh
  ;;
  *)
    echo -e '\033[1;31m✗ Script execution aborted. \033[0m';
    exit 1
  ;;
esac

