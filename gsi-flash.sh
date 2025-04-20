#!/bin/bash
trap "echo -e '\033[0;31m Script execution aborted. \033[0m'; exit 1" INT

clear
echo -e "\033[1;36m
╔═══════════════════════════════════════════════╗
║  \033[1;33m★ \033[1;37mTermux Root Recovery Tool \033[1;33m★\033[1;36m             ║
╠═══════════════════════════════════════════════╣
║  \033[1;96mGSI ROM Flashing Utility\033[1;36m                   ║
╚═══════════════════════════════════════════════╝
\033[0m"

echo -e "\033[1;35m╭───────────────────────────────────────────────╮\033[0m"
echo -e "\033[1;35m│\033[1;33m          What would you like to do?           \033[1;35m│\033[0m"
echo -e "\033[1;35m╰───────────────────────────────────────────────╯\033[0m"

echo -e "\033[1;34m┌──────────────────────────────────────────────┐\033[0m"
echo -e "\033[1;34m│ \033[1;37m 1. \033[1;92mCheck Fastboot Device                    \033[1;34m│\033[0m"
echo -e "\033[1;34m│ \033[1;37m 2. \033[1;92mFlash VBMETA                             \033[1;34m│\033[0m"
echo -e "\033[1;34m│ \033[1;37m 3. \033[1;92mFastboot to FastbootD                    \033[1;34m│\033[0m"
echo -e "\033[1;34m│ \033[1;37m 4. \033[1;92mCheck Userspace for GSi                  \033[1;34m│\033[0m"
echo -e "\033[1;34m│ \033[1;37m 5. \033[1;92mErase system                             \033[1;34m│\033[0m"
echo -e "\033[1;34m│ \033[1;37m 6. \033[1;92mDelete logical partition A               \033[1;34m│\033[0m"
echo -e "\033[1;34m│ \033[1;37m 7. \033[1;92mDelete logical partition B               \033[1;34m│\033[0m"
echo -e "\033[1;34m│ \033[1;37m 8. \033[1;92mFlash GSi system image                   \033[1;34m│\033[0m"
echo -e "\033[1;34m│ \033[1;37m 9. \033[1;92mFastboot to recovery                     \033[1;34m│\033[0m"
echo -e "\033[1;34m│ \033[1;37m11. \033[1;92mReset Device via cmd (Not for Xiaomi)    \033[1;34m│\033[0m"
echo -e "\033[1;34m│ \033[1;37m12. \033[1;92mReturn to Main Menu                      \033[1;34m│\033[0m"
echo -e "\033[1;34m└──────────────────────────────────────────────┘\033[0m"

echo -e "\033[1;33m╭───────────────────────────────────────────────╮\033[0m"
echo -e "\033[1;33m│ \033[1;97mEnter your choice or press any key to exit    \033[1;33m│\033[0m"
echo -e "\033[1;33m╰───────────────────────────────────────────────╯\033[0m"

read -p $'\033[1;36mChoice: \033[0m' flasher

case $flasher in
  "1")

     echo -e "\033[1;36m╭───────────────────────────────────────────────╮\033[0m"
     echo -e "\033[1;36m│\033[1;33m        Fastboot Device Check                 \033[1;36m│\033[0m"
     echo -e "\033[1;36m╰───────────────────────────────────────────────╯\033[0m"
     
     echo -e "\033[1;92m► Checking fastboot devices: \033[0m";
    termux-fastboot devices

    
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
    echo -e "\033[1;36m╭───────────────────────────────────────────────╮\033[0m"
    echo -e "\033[1;36m│\033[1;33m        Returning to Main Menu                 \033[1;36m│\033[0m"
    echo -e "\033[1;36m╰───────────────────────────────────────────────╯\033[0m"
    
    echo -e "\033[1;92m► Loading main menu... \033[0m"
    ./flash.sh

    source ./gsi-flash.sh
  ;;
"11")
    
  echo -e "\033[0;32m Resetting Device! \033[0m";
    termux-fastboot -w

source ./gsi-flash.sh
  ;;
  *)
    echo -e '\033[1;31m✗ Script execution aborted. \033[0m';
    exit 1
  ;;
esac

