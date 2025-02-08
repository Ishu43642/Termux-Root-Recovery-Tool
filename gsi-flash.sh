#!/bin/bash
trap "echo -e '\033[0;31m Script execution aborted. \033[0m'; exit 1" INT

echo -e "\033[0;33m
-------------------------------------------
 * RepairA2Z GSi Flashing Tool *
-------------------------------------------
        What do you want to do?
-------------------------------------------
  1. Check Fastboot Device
  2. Flash VBMETA
  3. Fastboot to FastbootD
  4. Check Userspace for GSi
  5. Erase system 
  6. Delete logical partition A
  7. Delete logical partition B
  8. Flash GSi system image
  9. Fastboot to recovery 
 11. Reset Device via commond (Not for Xiaomi)
 12. Main Menu
-------------------------------------------
(Press Any key to Exit or input your choice.)
\033[0m";

read -p "Choice: " flasher

case $flasher in
  "1")

     echo -e "\033[0;32m fastboot device list. \033[0m";
    termux-fastboot devices

    
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

    source ./gsi-flash.sh
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

    source ./gsi-flash.sh

  ;;
  "7")
    echo -e "\033[0;32m deleting product b: \033[0m"
    termux-fastboot delete-logical-partition product_b

    source ./gsi-flash.sh
  ;;
  "6")
    echo -e "\033[0;32m Deleting product A: \033[0m"
    termux-fastboot delete-logical-partition product_a

    source ./gsi-flash.sh
  ;;
  "8")
    
  echo -e "\033[0;32m Please enter the GSi image file location. \033[0m";
    read -p "Enter the GSi image path: " romname

    if [ ! -f "$romname" ]; then
        echo -e "\033[0;31m > $romname file is not found \033[0m";
        echo -e "\033[0;31m \033[3m Please ensure that '$romname' file exist and try again. Have a good day! \033[0m";
        exit 1;
    fi

    termux-fastboot flash system $romname


    source ./gsi-flash.sh


  ;;
"3")

    echo -e "\033[0;32m Rebooting to FastbootD ! Have a good day! \033[0m";
    termux-fastboot reboot fastboot

    source ./gsi-flash.sh
  ;;
"9")
    echo -e "\033[0;32m Rebooting to recovery !Have a good day! \033[0m";
    termux-fastboot reboot recovery

    source ./gsi-flash.sh
  ;;
"4")
    echo -e "\033[0;32m Chacking Userspace for rom ! Have a good day! \033[0m";
    termux-fastboot getvar is-userspace

    source ./gsi-flash.sh
  ;;
"5")
    
  echo -e "\033[0;32m Erasing system ! \033[0m";
    termux-fastboot erase system 

source ./gsi-flash.sh
  ;;
"12")
    echo -e "\033[0;32m Back to Main Page! \033[0m";
    ./flash.sh

    source ./gsi-flash.sh
  ;;
"11")
    
  echo -e "\033[0;32m Erasing system ! \033[0m";
    termux-fastboot -w

source ./gsi-flash.sh
  ;;
  *)
    echo -e '\033[0;31m Script execution aborted. \033[0m';
    exit 1
  ;;
esac

