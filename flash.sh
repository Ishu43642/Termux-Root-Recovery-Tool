#!/bin/bash
trap "echo -e '\033[0;31m Script execution aborted. \033[0m'; exit 1" INT

echo -e "\033[0;33m
-----------------------------------------
   * Repair A2Z Root Recovery Tool *
-----------------------------------------
        What do you want to do?
-----------------------------------------
  1. Flash Recovery
  2. Flash VBMETA
  3. Flash Boot image
  4. Check adb devices
  5. Check fastboot devices
  6. Flash Zip adb Sideload
  7. Reboot To Fastboot Mode
  8. Reboot System (From fastboot)
  9. Reboot To Recovery Mode
 10. AB Partition Tool
 11. Flash Fastboot Rom
 12. Flash GSi Rom (Dynamic Partition)
------------------------------------------
(Press Any key to Exit or input your choice.)
\033[0m";

read -p "Choice: " flasher

case $flasher in
  "1")

     echo -e "\033[0;32m Please enter the recovery file location. \033[0m";
    read -p "Enter the recovery path: " romname

    if [ ! -f "$romname" ]; then
        echo -e "\033[0;31m > $romname file is not found \033[0m";
        echo -e "\033[0;31m \033[3m Please ensure that '$romname' file exist and try again. Have a good day! \033[0m";
        exit 1;
    fi

    termux-fastboot flash recovery $romname

    
    read -p "Do you want to flash 'vbmeta.img' file? Type 'y' to flash, any key to skip: " vbimg;

    if [ "$vbimg" = "y" ] || [ "$vbimg" = "yes" ] || [ "$vbimg" = "Y" ] || [ "$vbimg" = "YES" ]; then
      echo -e "\033[0;32m Please enter the vbmeta file location. \033[0m";
    read -p "Enter the vbmeta path: " romname

    if [ ! -f "$romname" ]; then
        echo -e "\033[0;31m > $romname file is not found \033[0m";
        echo -e "\033[0;31m \033[3m Please ensure that '$romname' file exist and try again. Have a good day! \033[0m";
        exit 1;
    fi

    termux-fastboot --disable-verity --disable-verification flash vbmeta $romname

    else
      echo -e "\033[0;32m Skipping Flashing vbmeta.img \033[0m";
    fi

    if [ $? -eq 0 ]; then
      echo -e "\033[0;32m Operation Succeed \033[0m";
    fi

    source ./flash.sh
  ;;
  "2")
     echo -e "\033[0;32m Please enter the vbmeta file location. \033[0m";
    read -p "Enter the vbmeta path: " romname

    if [ ! -f "$romname" ]; then
        echo -e "\033[0;31m > $romname file is not found \033[0m";
        echo -e "\033[0;31m \033[3m Please ensure that '$romname' file exist and try again. Have a good day! \033[0m";
        exit 1;
    fi

    termux-fastboot --disable-verity --disable-verification flash vbmeta $romname

    if [ $? -eq 0 ]; then
      echo -e "\033[0;32m Operation Succeed \033[0m";
    fi

    source ./flash.sh

  ;;
  "6")

    echo -e "\033[0;32m Please enter the file name of your custom rom. \033[0m";
    read -p "Enter the zip file name: " romname

    if [ ! -f "$romname" ]; then
        echo -e "\033[0;31m > $romname file is not found \033[0m";
        echo -e "\033[0;31m \033[3m Please ensure that '$romname' file exist and try again. Have a good day! \033[0m";
        exit 1;
    fi

    termux-adb sideload $romname

    if [ $? -eq 0 ]; then
      echo -e "\033[0;32m sideload operation completed \033[0m";
    fi

    source ./flash.sh
    
  ;;
  "4")
    echo -e "\033[0;32m adb device list: \033[0m"
    termux-adb devices

    source ./flash.sh
  ;;
  "5")
    echo -e "\033[0;32m fastboot device list: \033[0m"
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
    echo -e '\033[0;31m Script execution aborted. \033[0m';
    exit 1
  ;;
esac

