#!/bin/bash
trap "echo -e '\033[0;31m Script execution aborted. \033[0m'; exit 1" INT

# Function to prompt user before returning to menu
return_to_menu() {
    echo -e "\033[1;33m╭───────────────────────────────────────────────╮\033[0m"
    echo -e "\033[1;33m│ \033[1;97mOperation completed                         \033[1;33m│\033[0m"
    echo -e "\033[1;33m╰───────────────────────────────────────────────╯\033[0m"
    
    read -p $'\033[1;36mReturn to GSI Flash menu? (y/n): \033[0m' choice
    if [[ "$choice" == "y" || "$choice" == "Y" || "$choice" == "yes" || "$choice" == "YES" ]]; then
        source ./gsi-flash.sh
    else
        echo -e "\033[1;32m✓ Exiting program. Thank you for using Termux Root Recovery Tool! \033[0m"
        exit 0
    fi
}

# Function to prompt user before returning to main menu
go_to_main_menu() {
    echo -e "\033[1;33m╭───────────────────────────────────────────────╮\033[0m"
    echo -e "\033[1;33m│ \033[1;97mReturning to main menu?                     \033[1;33m│\033[0m"
    echo -e "\033[1;33m╰───────────────────────────────────────────────╯\033[0m"
    
    read -p $'\033[1;36mGo to main menu? (y/n): \033[0m' choice
    if [[ "$choice" == "y" || "$choice" == "Y" || "$choice" == "yes" || "$choice" == "YES" ]]; then
        ./flash.sh
    else
        echo -e "\033[1;32m✓ Exiting program. Thank you for using Termux Root Recovery Tool! \033[0m"
        exit 0
    fi
}

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
      echo -ne "\033[1;97mEnter the vbmeta path: \033[0m"
      read -e romname

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

    return_to_menu
  ;;
  "2")
     echo -e "\033[1;36m╭───────────────────────────────────────────────╮\033[0m"
     echo -e "\033[1;36m│\033[1;33m        VBMETA Flash Operation                \033[1;36m│\033[0m"
     echo -e "\033[1;36m╰───────────────────────────────────────────────╯\033[0m"
     
     echo -e "\033[1;92m► Please enter the vbmeta file location. \033[0m";
     echo -ne "\033[1;97mEnter the vbmeta path: \033[0m"
     read -e romname

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

    return_to_menu

  ;;
  "7")
    echo -e "\033[1;36m╭───────────────────────────────────────────────╮\033[0m"
    echo -e "\033[1;36m│\033[1;33m        Delete Logical Partition B             \033[1;36m│\033[0m"
    echo -e "\033[1;36m╰───────────────────────────────────────────────╯\033[0m"
    
    echo -e "\033[1;33m⚡ Deleting product_b partition... \033[0m"
    termux-fastboot delete-logical-partition product_b

    if [ $? -eq 0 ]; then
      echo -e "\033[1;32m✓ Partition deleted successfully! \033[0m";
    fi

    return_to_menu
  ;;
  "6")
    echo -e "\033[1;36m╭───────────────────────────────────────────────╮\033[0m"
    echo -e "\033[1;36m│\033[1;33m        Delete Logical Partition A             \033[1;36m│\033[0m"
    echo -e "\033[1;36m╰───────────────────────────────────────────────╯\033[0m"
    
    echo -e "\033[1;33m⚡ Deleting product_a partition... \033[0m"
    termux-fastboot delete-logical-partition product_a

    if [ $? -eq 0 ]; then
      echo -e "\033[1;32m✓ Partition deleted successfully! \033[0m";
    fi

    return_to_menu
  ;;
  "8")
    echo -e "\033[1;36m╭───────────────────────────────────────────────╮\033[0m"
    echo -e "\033[1;36m│\033[1;33m        GSI System Image Flash Operation       \033[1;36m│\033[0m"
    echo -e "\033[1;36m╰───────────────────────────────────────────────╯\033[0m"
  
    echo -e "\033[1;92m► Please enter the GSI image file location. \033[0m";
    echo -ne "\033[1;97mEnter the GSI image path: \033[0m"
    read -e romname

    if [ ! -f "$romname" ]; then
        echo -e "\033[1;31m✗ $romname file is not found \033[0m";
        echo -e "\033[1;31m\033[3m Please ensure that '$romname' file exists and try again. \033[0m";
        exit 1;
    fi

    echo -e "\033[1;33m⚡ Flashing GSI system image... \033[0m"
    termux-fastboot flash system $romname

    if [ $? -eq 0 ]; then
      echo -e "\033[1;32m✓ System image flashed successfully! \033[0m";
    fi

    return_to_menu


  ;;
"3")
    echo -e "\033[1;36m╭───────────────────────────────────────────────╮\033[0m"
    echo -e "\033[1;36m│\033[1;33m        Fastboot to FastbootD Operation       \033[1;36m│\033[0m"
    echo -e "\033[1;36m╰───────────────────────────────────────────────╯\033[0m"

    echo -e "\033[1;33m⚡ Rebooting to FastbootD... \033[0m"
    termux-fastboot reboot fastboot

    if [ $? -eq 0 ]; then
      echo -e "\033[1;32m✓ Reboot command sent successfully! \033[0m";
    fi

    return_to_menu
  ;;
"9")
    echo -e "\033[1;36m╭───────────────────────────────────────────────╮\033[0m"
    echo -e "\033[1;36m│\033[1;33m        Fastboot to Recovery Operation        \033[1;36m│\033[0m"
    echo -e "\033[1;36m╰───────────────────────────────────────────────╯\033[0m"

    echo -e "\033[1;33m⚡ Rebooting to recovery... \033[0m"
    termux-fastboot reboot recovery

    if [ $? -eq 0 ]; then
      echo -e "\033[1;32m✓ Reboot command sent successfully! \033[0m";
    fi

    return_to_menu
  ;;
"4")
    echo -e "\033[1;36m╭───────────────────────────────────────────────╮\033[0m"
    echo -e "\033[1;36m│\033[1;33m        Check Userspace for GSI Operation     \033[1;36m│\033[0m"
    echo -e "\033[1;36m╰───────────────────────────────────────────────╯\033[0m"

    echo -e "\033[1;33m⚡ Checking userspace for ROM... \033[0m"
    termux-fastboot getvar is-userspace

    if [ $? -eq 0 ]; then
      echo -e "\033[1;32m✓ Check completed successfully! \033[0m";
    fi

    return_to_menu
  ;;
"5")
    echo -e "\033[1;36m╭───────────────────────────────────────────────╮\033[0m"
    echo -e "\033[1;36m│\033[1;33m        Erase System Operation                \033[1;36m│\033[0m"
    echo -e "\033[1;36m╰───────────────────────────────────────────────╯\033[0m"
  
    echo -e "\033[1;33m⚡ Erasing system partition... \033[0m"
    termux-fastboot erase system 

    if [ $? -eq 0 ]; then
      echo -e "\033[1;32m✓ System partition erased successfully! \033[0m";
    fi

    return_to_menu
  ;;
"12")
    go_to_main_menu
  ;;
"11")
    echo -e "\033[1;36m╭───────────────────────────────────────────────╮\033[0m"
    echo -e "\033[1;36m│\033[1;33m        Device Reset Operation                \033[1;36m│\033[0m"
    echo -e "\033[1;36m│\033[1;31m        WARNING: Not for Xiaomi devices       \033[1;36m│\033[0m"
    echo -e "\033[1;36m╰───────────────────────────────────────────────╯\033[0m"
  
    echo -e "\033[1;33m⚡ Resetting device... \033[0m"
    termux-fastboot -w

    if [ $? -eq 0 ]; then
      echo -e "\033[1;32m✓ Device reset command sent successfully! \033[0m";
    fi

    return_to_menu
  ;;
  *)
    echo -e '\033[1;31m✗ Script execution aborted. \033[0m';
    exit 1
  ;;
esac

