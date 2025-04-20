#!/bin/bash
trap "echo -e '\033[0;31m Script execution aborted. \033[0m'; exit 1" INT

# Function to prompt user before returning to main menu
return_to_menu() {
    echo -e "\033[1;33m╭───────────────────────────────────────────────╮\033[0m"
    echo -e "\033[1;33m│ \033[1;97mOperation completed                         \033[1;33m│\033[0m"
    echo -e "\033[1;33m╰───────────────────────────────────────────────╯\033[0m"
    
    read -p $'\033[1;36mReturn to main menu? (y/n): \033[0m' choice
    if [[ "$choice" == "y" || "$choice" == "Y" || "$choice" == "yes" || "$choice" == "YES" ]]; then
        source ./flash.sh
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

    return_to_menu
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

    return_to_menu

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

    return_to_menu
    
  ;;
  "4")
    echo -e "\033[1;36m╭───────────────────────────────────────────────╮\033[0m"
    echo -e "\033[1;36m│\033[1;33m        ADB Devices Check                     \033[1;36m│\033[0m"
    echo -e "\033[1;36m╰───────────────────────────────────────────────╯\033[0m"
    
    echo -e "\033[1;92m► Checking ADB devices: \033[0m"
    termux-adb devices

    return_to_menu
  ;;
  "5")
    echo -e "\033[1;36m╭───────────────────────────────────────────────╮\033[0m"
    echo -e "\033[1;36m│\033[1;33m        Fastboot Devices Check                \033[1;36m│\033[0m"
    echo -e "\033[1;36m╰───────────────────────────────────────────────╯\033[0m"
    
    echo -e "\033[1;92m► Checking Fastboot devices: \033[0m"
    termux-fastboot devices

    return_to_menu
  ;;
  "11")
    echo -e "\033[1;36m╭───────────────────────────────────────────────╮\033[0m"
    echo -e "\033[1;36m│\033[1;33m        Stock ROM Flash Operation             \033[1;36m│\033[0m"
    echo -e "\033[1;36m╰───────────────────────────────────────────────╯\033[0m"
    
    echo -e "\033[1;92m► Launching Stock ROM Flashing Utility... \033[0m"
    cp flash-stock-rom.sh /storage/emulated/0/Download/stock-rom
    cd /storage/emulated/0/Download/stock-rom
    bash flash-stock-rom.sh

    return_to_menu
  ;;
  "3")
    echo -e "\033[1;36m╭───────────────────────────────────────────────╮\033[0m"
    echo -e "\033[1;36m│\033[1;33m        Boot Image Flash Operation            \033[1;36m│\033[0m"
    echo -e "\033[1;36m╰───────────────────────────────────────────────╯\033[0m"
    
    echo -e "\033[1;92m► Please enter the boot file location. \033[0m";
    read -p $'\033[1;97mEnter the boot path: \033[0m' romname

    if [ ! -f "$romname" ]; then
        echo -e "\033[1;31m✗ $romname file is not found \033[0m";
        echo -e "\033[1;31m\033[3m Please ensure that '$romname' file exists and try again. \033[0m";
        exit 1;
    fi

    echo -e "\033[1;33m⚡ Flashing boot image... \033[0m"
    termux-fastboot flash boot $romname

    if [ $? -eq 0 ]; then
      echo -e "\033[1;32m✓ Operation completed successfully! \033[0m";
    fi

    return_to_menu
  ;;
"8")
    echo -e "\033[1;36m╭───────────────────────────────────────────────╮\033[0m"
    echo -e "\033[1;36m│\033[1;33m        System Reboot Operation               \033[1;36m│\033[0m"
    echo -e "\033[1;36m╰───────────────────────────────────────────────╯\033[0m"
    
    echo -e "\033[1;33m⚡ Rebooting device to system... \033[0m"
    termux-fastboot reboot

    if [ $? -eq 0 ]; then
      echo -e "\033[1;32m✓ Reboot command sent successfully! \033[0m";
    fi

    return_to_menu
  ;;
"7")
    echo -e "\033[1;36m╭───────────────────────────────────────────────╮\033[0m"
    echo -e "\033[1;36m│\033[1;33m        Fastboot Mode Reboot                  \033[1;36m│\033[0m"
    echo -e "\033[1;36m╰───────────────────────────────────────────────╯\033[0m"
    
    echo -e "\033[1;33m⚡ Rebooting device to fastboot mode... \033[0m"
    termux-adb reboot bootloader

    if [ $? -eq 0 ]; then
      echo -e "\033[1;32m✓ Reboot command sent successfully! \033[0m";
    fi

    return_to_menu
  ;;
"9")
    echo -e "\033[1;36m╭───────────────────────────────────────────────╮\033[0m"
    echo -e "\033[1;36m│\033[1;33m        Recovery Mode Reboot                  \033[1;36m│\033[0m"
    echo -e "\033[1;36m╰───────────────────────────────────────────────╯\033[0m"
    
    echo -e "\033[1;33m⚡ Rebooting device to recovery mode... \033[0m"
    termux-adb reboot recovery

    if [ $? -eq 0 ]; then
      echo -e "\033[1;32m✓ Reboot command sent successfully! \033[0m";
    fi

    return_to_menu
  ;;
"12")
    echo -e "\033[1;36m╭───────────────────────────────────────────────╮\033[0m"
    echo -e "\033[1;36m│\033[1;33m        GSI Flash Tool Launch                 \033[1;36m│\033[0m"
    echo -e "\033[1;36m╰───────────────────────────────────────────────╯\033[0m"
    
    echo -e "\033[1;92m► Launching GSI Flash Tool... \033[0m"
    ./gsi-flash.sh

    return_to_menu
  ;;
"10")
    echo -e "\033[1;36m╭───────────────────────────────────────────────╮\033[0m"
    echo -e "\033[1;36m│\033[1;33m        A/B Partition Tool Launch             \033[1;36m│\033[0m"
    echo -e "\033[1;36m╰───────────────────────────────────────────────╯\033[0m"
    
    echo -e "\033[1;92m► Launching A/B Partition Device Tool... \033[0m"
    ./flashAB.sh

    return_to_menu
  ;;
  *)
    echo -e '\033[1;31m✗ Script execution aborted. \033[0m';
    exit 1
  ;;
esac

