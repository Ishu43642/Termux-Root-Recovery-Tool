#!/bin/bash
trap "echo -e '\033[0;31m Script execution aborted. \033[0m'; exit 1" INT

echo -e "\033[0;33m
-----------------------------------------
* Repair A2Z Root Recovery Tool *
-----------------------------------------
  For  AB Partition Device
-----------------------------------------
  1. Flash Boot 
  2. Check Active Slot
  3. Flash Boot_a
  4. Flash Boot_b
  5. Flash Recovery_a
  6. Flash Recovery_b
  7. Flash Zip adb Sideload
  8. Boot TWRP Recovery
  9. Activate Slot A
 10. Activate Slot B
 11. Main Page
------------------------------------------
(Press Any key to Exit or input your choice.)
\033[0m";

read -p "Choice: " flasher

case $flasher in
  "5")

     echo -e "\033[0;32m Please enter the recovery file location. \033[0m";
    read -p "Enter the recovery path: " romname

    if [ ! -f "$romname" ]; then
        echo -e "\033[0;31m > $romname file is not found \033[0m";
        echo -e "\033[0;31m \033[3m Please ensure that '$romname' file exist and try again. Have a good day! \033[0m";
        exit 1;
    fi

    termux-fastboot flash recovery_a $romname

    
    read -p "Do you want to flash 'recovery_b' file? Type 'y' to flash, any key to skip: " vbimg;

    if [ "$vbimg" = "y" ] || [ "$vbimg" = "yes" ] || [ "$vbimg" = "Y" ] || [ "$vbimg" = "YES" ]; then
      echo -e "\033[0;32m Please enter the recovery file location. \033[0m";
    read -p "Enter the recovery path: " romname

    if [ ! -f "$romname" ]; then
        echo -e "\033[0;31m > $romname file is not found \033[0m";
        echo -e "\033[0;31m \033[3m Please ensure that '$romname' file exist and try again. Have a good day! \033[0m";
        exit 1;
    fi

    termux-fastboot flash recovert_b $romname
    else
      echo -e "\033[0;32m Skipping Flashing recovery_b.img \033[0m";
    fi

    echo -e "\033[0;32m Rebooting to recovery \033[0m";
    termux-fastboot reboot recovery

    if [ $? -eq 0 ]; then
      echo -e "\033[0;32m Operation Succeed \033[0m";
    fi

    source ./flashAB.sh
  ;;
  "6")
     echo -e "\033[0;32m Please enter the recovery file location. \033[0m";
    read -p "Enter the recovery path: " romname

    if [ ! -f "$romname" ]; then
        echo -e "\033[0;31m > $romname file is not found \033[0m";
        echo -e "\033[0;31m \033[3m Please ensure that '$romname' file exist and try again. Have a good day! \033[0m";
        exit 1;
    fi

    termux-fastboot flash recovery_b $romname

    echo -e "\033[0;32m Rebooting your device to recovery! Have a good day! \033[0m";
    termux-fastboot reboot recovery

    if [ $? -eq 0 ]; then
      echo -e "\033[0;32m Operation Succeed \033[0m";
    fi

    source ./flashAB.sh

  ;;
  "7")

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

    source ./flashAB.sh
    
  ;;
  "2")
    echo -e "\033[0;32m Chaking active slot. \033[0m";
    
    termux-fastboot getvar current-slot

    source ./flashAB.sh
  ;;
  "1")
    echo -e "\033[0;32m Please enter the boot file location. \033[0m";
    read -p "Enter the boot path: " romname

    if [ ! -f "$romname" ]; then
        echo -e "\033[0;31m > $romname file is not found \033[0m";
        echo -e "\033[0;31m \033[3m Please ensure that '$romname' file exist and try again. Have a good day! \033[0m";
        exit 1;
    fi

    termux-fastboot flash boot $romname

    source ./flashAB.sh
  ;;
  "11")
    echo -e "\033[0;32m Back to Main Page! \033[0m";
    ./flash.sh

    source ./flashAB.sh
  ;;
  "3")
 echo -e "\033[0;32m Please enter the boot file location. \033[0m";
    read -p "Enter the Boot path: " romname

    if [ ! -f "$romname" ]; then
        echo -e "\033[0;31m > $romname file is not found \033[0m";
        echo -e "\033[0;31m \033[3m Please ensure that '$romname' file exist and try again. Have a good day! \033[0m";
        exit 1;
    fi

    termux-fastboot flash boot_a $romname

    
    read -p "Do you want to flash 'boot_b' file? Type 'y' to flash, any key to skip: " vbimg;

    if [ "$vbimg" = "y" ] || [ "$vbimg" = "yes" ] || [ "$vbimg" = "Y" ] || [ "$vbimg" = "YES" ]; then
      echo -e "\033[0;32m Please enter the boot file location. \033[0m";
    read -p "Enter the boot path: " romname

    if [ ! -f "$romname" ]; then
        echo -e "\033[0;31m > $romname file is not found \033[0m";
        echo -e "\033[0;31m \033[3m Please ensure that '$romname' file exist and try again. Have a good day! \033[0m";
        exit 1;
    fi

    termux-fastboot flash boot_b $romname
    else
      echo -e "\033[0;32m Skipping Flashing boot_b.img \033[0m";
    fi

    echo -e "\033[0;32m Rebooting to system\033[0m";
    termux-fastboot reboot

    if [ $? -eq 0 ]; then
      echo -e "\033[0;32m Operation Succeed \033[0m";
    fi

    source ./flashAB.sh
  ;;
"8")

echo -e "\033[0;32m Please enter the Recovery file location. \033[0m";
    read -p "Enter the Recovery path: " romname

    if [ ! -f "$romname" ]; then
        echo -e "\033[0;31m > $romname file is not found \033[0m";
        echo -e "\033[0;31m \033[3m Please ensure that '$romname' file exist and try again. Have a good day! \033[0m";
        exit 1;
    fi

    termux-fastboot boot $romname

    source ./flashAB.sh
  ;;
"9")
    echo -e "\033[0;32m Activating Slot A ! Have a good day! \033[0m";
    termux-fastboot set_active a

    source ./flashAB.sh
  ;;
"10")
    echo -e "\033[0;32m Activating Slot B !Have a good day! \033[0m";
    termux-fastboot set_active b

    source ./flashAB.sh
  ;;
"4")    
  echo -e "\033[0;32m Please enter the boot file location. \033[0m";
    read -p "Enter the boot path: " romname

    if [ ! -f "$romname" ]; then
        echo -e "\033[0;31m > $romname file is not found \033[0m";
        echo -e "\033[0;31m \033[3m Please ensure that '$romname' file exist and try again. Have a good day! \033[0m";
        exit 1;
    fi

    termux-fastboot flash boot_b $romname

source ./flashAB.sh
  ;;
  *)
    echo -e '\033[0;31m Script execution aborted. \033[0m';
    exit 1
  ;;
esac

