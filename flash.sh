#!/bin/bash
trap "echo -e '\033[0;31m Script execution aborted. \033[0m'; exit 1" INT

echo -e "\033[0;33m
Repair A2Z Root Recovery Tool
What do you want to do?
1. Flash Recovery
2. Flash VBMETA
3. Use adb Sideload
4. Check adb devices
5. Check fastboot devices
6. Reboot to System
7. Flash boot image 
(Press Any key to Exit or input your choice.)
\033[0m";

read -p "Choice: " flasher

case $flasher in
  "1")

    echo -e "\033[0;33m Please ensure that 'recovery.img' file exist in root directory. Press enter to continue \033[0m";

    read

    files=("recovery.img")

    for file in "${files[@]}"; do
      if [ ! -f "$file" ]; then
        echo -e "\033[0;31m > $file file is not found \033[0m";
      fi
    done

    for file in "${files[@]}"; do
      if [ ! -f "$file" ]; then
        echo -e "\033[0;31m \033[3m Please ensure that all of these files exist and try again. Have a good day! \033[0m"
        exit 1;
      fi
    done
    
    echo -e "\033[0;32m Flashing Recovery \033[0m";
    termux-fastboot flash recovery recovery.img
    
    read -p "Do you want to flash 'vbmeta.img' file? Type 'y' to flash, any key to skip: " vbimg;

    if [ "$vbimg" = "y" ] || [ "$vbimg" = "yes" ] || [ "$vbimg" = "Y" ] || [ "$vbimg" = "YES" ]; then
      echo -e "\033[0;33m make sure 'vbmeta.img' file exist in the root directory. \033[0m";
      echo -e "\033[0;32m Flashing vbmeta.img \033[0m";
      termux-fastboot --disable-verity --disable-verification flash vbmeta vbmeta.img
    else
      echo -e "\033[0;32m Skipping Flashing vbmeta.img \033[0m";
    fi

    echo -e "\033[0;32m Rebooting to System \033[0m";
    termux-fastboot reboot

    if [ $? -eq 0 ]; then
      echo -e "\033[0;32m Operation Succeed \033[0m";
    fi

    source ./flash.sh
  ;;
  "2")
    if [ ! -f "vbmeta.img" ]; then
        echo -e "\033[0;31m \033[3m Please ensure that 'vbmeta.img' file exist in the root directory and try again. Have a good day! \033[0m"
        exit 1;
    fi

    echo -e "\033[0;32m Flashing vbmeta.img \033[0m";
    termux-fastboot --disable-verity --disable-verification flash vbmeta vbmeta.img

    echo -e "\033[0;32m Rebooting your device to system! Have a good day! \033[0m";
    termux-fastboot reboot

    if [ $? -eq 0 ]; then
      echo -e "\033[0;32m Operation Succeed \033[0m";
    fi

    source ./flash.sh

  ;;
  "3")

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
  "6")
    echo -e "\033[0;32m Rebooting your device to system! Have a good day! \033[0m";
    termux-fastboot reboot

    source ./flash.sh
  ;;
  "7")
    
 echo -e "\033[0;33m Please ensure that 'boot.img' file exist in root directory. Press enter to continue \033[0m";

    read

    files=("boot.img")

    for file in "${files[@]}"; do
      if [ ! -f "$file" ]; then
        echo -e "\033[0;31m > $file file is not found \033[0m";
      fi
    done

    for file in "${files[@]}"; do
      if [ ! -f "$file" ]; then
        echo -e "\033[0;31m \033[3m Please ensure that all of these files exist and try again. Have a good day! \033[0m"
        exit 1;
      fi
    done
    
    echo -e "\033[0;32m Flashing boot image \033[0m";
    termux-fastboot flash boot boot.img

echo -e "\033[0;32m reboot device\033[0m"
    termux-fastboot reboot

    source ./flash.sh


  ;;
  *)
    echo -e '\033[0;31m Script execution aborted. \033[0m';
    exit 1
  ;;
esac

