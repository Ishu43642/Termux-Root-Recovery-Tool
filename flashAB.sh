#!/bin/bash
trap "echo -e '\033[0;31m Script execution aborted. \033[0m'; exit 1" INT

# Function to prompt user before returning to main menu
return_to_menu() {
    echo -e "\033[1;33m╭───────────────────────────────────────────────╮\033[0m"
    echo -e "\033[1;33m│ \033[1;97m  Operation completed                         \033[1;33m│\033[0m"
    echo -e "\033[1;33m╰───────────────────────────────────────────────╯\033[0m"
    
    read -p $'\033[1;36mReturn to A/B Partition menu? (y/n): \033[0m' choice
    if [[ "$choice" == "y" || "$choice" == "Y" || "$choice" == "yes" || "$choice" == "YES" ]]; then
        source ./flashAB.sh
    else
    echo -e "\033[1;32m✓ Exiting program. Thank you for using Termux Root Recovery Tool! \033[0m"
	echo -e "\033[1;33m╭───────────────────────────────────────────────╮\033[0m"
    echo -e "\033[1;33m│ \033[1;97m     Subscribe - Repair A2Z YouTube channel   \033[1;33m│\033[0m"
	echo -e "\033[1;33m╰───────────────────────────────────────────────╯\033[0m"
        exit 0
    fi
}

# Function to prompt user before returning to main menu
go_to_main_menu() {
    echo -e "\033[1;33m╭───────────────────────────────────────────────╮\033[0m"
    echo -e "\033[1;33m│ \033[1;97m  Returning to main menu?                     \033[1;33m│\033[0m"
    echo -e "\033[1;33m╰───────────────────────────────────────────────╯\033[0m"
    
    read -p $'\033[1;36mGo to main menu? (y/n): \033[0m' choice
    if [[ "$choice" == "y" || "$choice" == "Y" || "$choice" == "yes" || "$choice" == "YES" ]]; then
        ./flash.sh
    else
        echo -e "\033[1;32m✓ Exiting program. Thank you for using Termux Root Recovery Tool! \033[0m"
	echo -e "\033[1;33m╭───────────────────────────────────────────────╮\033[0m"
    echo -e "\033[1;33m│ \033[1;97m     Subscribe - Repair A2Z YouTube channel   \033[1;33m│\033[0m"
	echo -e "\033[1;33m╰───────────────────────────────────────────────╯\033[0m"
        ./flashAB.sh
    fi
}

clear
echo -e "\033[1;36m
╔═══════════════════════════════════════════════╗
║\033[1;33m ★ \033[1;37mTermux Root Recovery Tool By Repair-A2Z\033[1;33m ★\033[1;36m   ║
╠═══════════════════════════════════════════════╣
║  \033[1;95m       🆎  Partition Device - Tool\033[1;36m           ║
╚═══════════════════════════════════════════════╝
\033[0m"

echo -e "\033[1;35m╭───────────────────────────────────────────────╮\033[0m"
echo -e "\033[1;35m│\033[1;33m          What would you like to do?           \033[1;35m│\033[0m"
echo -e "\033[1;35m╰───────────────────────────────────────────────╯\033[0m"

echo -e "\033[1;34m┌──────────────────────────────────────────────┐\033[0m"
echo -e "\033[1;34m│ \033[1;37m 1. \033[1;92mFlash Boot                               \033[1;34m│\033[0m"
echo -e "\033[1;34m│ \033[1;37m 2. \033[1;92mFlash init_Boot                          \033[1;34m│\033[0m"
echo -e "\033[1;34m│ \033[1;37m 3. \033[1;92mFlash Vendor_Boot                        \033[1;34m│\033[0m"
echo -e "\033[1;34m│ \033[1;37m 4. \033[1;92mFlash Recovery                           \033[1;34m│\033[0m"
echo -e "\033[1;34m│ \033[1;37m 5. \033[1;92mCheck Active Slot 🆎                     \033[1;34m│\033[0m"
echo -e "\033[1;34m│ \033[1;37m 6. \033[1;92mFlash Boot_🅰️                             \033[1;34m│\033[0m"
echo -e "\033[1;34m│ \033[1;37m 7. \033[1;92mFlash Boot_🅱️                             \033[1;34m│\033[0m"
echo -e "\033[1;34m│ \033[1;37m 8. \033[1;92mFlash init_Boot_🅰️                        \033[1;34m│\033[0m"
echo -e "\033[1;34m│ \033[1;37m 9. \033[1;92mFlash init_Boot_🅱️                        \033[1;34m│\033[0m"
echo -e "\033[1;34m│ \033[1;37m10. \033[1;92mFlash Recovery_🅰️                         \033[1;34m│\033[0m"
echo -e "\033[1;34m│ \033[1;37m11. \033[1;92mFlash Recovery_🅱️                         \033[1;34m│\033[0m"
echo -e "\033[1;34m│ \033[1;37m12. \033[1;92mFlash Zip adb Sideload                   \033[1;34m│\033[0m"
echo -e "\033[1;34m│ \033[1;37m13. \033[1;92mBoot TWRP Recovery                       \033[1;34m│\033[0m"
echo -e "\033[1;34m│ \033[1;37m14. \033[1;92mFlash vbmeta_🅰️                           \033[1;34m│\033[0m"
echo -e "\033[1;34m│ \033[1;37m15. \033[1;92mFlash vbmeta_🅱️                           \033[1;34m│\033[0m"
echo -e "\033[1;34m│ \033[1;37m16. \033[1;92mActivate Slot 🅰️                          \033[1;34m│\033[0m"
echo -e "\033[1;34m│ \033[1;37m17. \033[1;92mActivate Slot 🅱️                          \033[1;34m│\033[0m"
echo -e "\033[1;34m│ \033[1;37m18. \033[1;92mFlash Vendor_Boot_🅰️                      \033[1;34m│\033[0m"
echo -e "\033[1;34m│ \033[1;37m19. \033[1;92mFlash Vendor_Boot_🅱️                      \033[1;34m│\033[0m"
echo -e "\033[1;34m│ \033[1;37m20. \033[1;33m↩️ Return to Main Menu                    \033[1;34m│\033[0m"
echo -e "\033[1;34m└──────────────────────────────────────────────┘\033[0m"

echo -e "\033[1;33m╭───────────────────────────────────────────────╮\033[0m"
echo -e "\033[1;33m│ \033[1;97mEnter your choice or press any key to exit    \033[1;33m│\033[0m"
echo -e "\033[1;33m╰───────────────────────────────────────────────╯\033[0m"

read -p $'\033[1;36mChoice: \033[0m' flasher

case $flasher in
  "10")

     echo -e "\033[1;36m╭───────────────────────────────────────────────╮\033[0m"
     echo -e "\033[1;36m│\033[1;33m      Recovery_a Flash Operation               \033[1;36m│\033[0m"
     echo -e "\033[1;36m╰───────────────────────────────────────────────╯\033[0m"
     
     echo -e "\033[1;92m► Please enter the recovery file location. \033[0m";
     echo -ne "\033[1;97mEnter the recovery path: \033[0m"
     read -e romname

    if [ ! -f "$romname" ]; then
        echo -e "\033[1;31m✗ $romname file is not found \033[0m";
        echo -e "\033[1;31m\033[3m Please ensure that '$romname' file exists and try again. \033[0m";
        return_to_menu;
    fi

    echo -e "\033[1;33m⚡ Flashing recovery_a... \033[0m"
    termux-fastboot flash recovery_a $romname

    
    read -p $'\033[1;97mDo you want to flash recovery_b file? Type \033[1;92my\033[1;97m to flash, any key to skip: \033[0m' vbimg;

    if [ "$vbimg" = "y" ] || [ "$vbimg" = "yes" ] || [ "$vbimg" = "Y" ] || [ "$vbimg" = "YES" ]; then
      echo -e "\033[1;92m► Please enter the recovery file location. \033[0m";
      echo -ne "\033[1;97mEnter the recovery path: \033[0m"
      read -e romname

    if [ ! -f "$romname" ]; then
        echo -e "\033[1;31m✗ $romname file is not found \033[0m";
        echo -e "\033[1;31m\033[3m Please ensure that '$romname' file exists and try again. \033[0m";
        return_to_menu;
    fi

    echo -e "\033[1;33m⚡ Flashing recovery_b... \033[0m"
    termux-fastboot flash recovert_b $romname
    else
      echo -e "\033[1;33m◌ Skipping recovery_b.img flash \033[0m";
    fi


    if [ $? -eq 0 ]; then
      echo -e "\033[1;32m✓ Operation completed successfully! \033[0m";
    fi

    return_to_menu
  ;;
  "11")
     echo -e "\033[1;36m╭───────────────────────────────────────────────╮\033[0m"
     echo -e "\033[1;36m│\033[1;33m      Recovery_b Flash Operation               \033[1;36m│\033[0m"
     echo -e "\033[1;36m╰───────────────────────────────────────────────╯\033[0m"
     
     echo -e "\033[1;92m► Please enter the recovery file location. \033[0m";
     echo -ne "\033[1;97mEnter the recovery path: \033[0m"
     read -e romname

    if [ ! -f "$romname" ]; then
        echo -e "\033[1;31m✗ $romname file is not found \033[0m";
        echo -e "\033[1;31m\033[3m Please ensure that '$romname' file exists and try again. \033[0m";
        return_to_menu;
    fi

    echo -e "\033[1;33m⚡ Flashing recovery_b... \033[0m"
    termux-fastboot flash recovery_b $romname


    if [ $? -eq 0 ]; then
      echo -e "\033[1;32m✓ Operation completed successfully! \033[0m";
    fi

    return_to_menu

  ;;
  "12")
     echo -e "\033[1;36m╭───────────────────────────────────────────────╮\033[0m"
     echo -e "\033[1;36m│\033[1;33m         ADB Sideload Operation                \033[1;36m│\033[0m"
     echo -e "\033[1;36m╰───────────────────────────────────────────────╯\033[0m"

    echo -e "\033[1;92m► Please enter the file location of your zip file. \033[0m";
    echo -ne "\033[1;97mEnter the zip file path: \033[0m"
    read -e romname

    if [ ! -f "$romname" ]; then
        echo -e "\033[1;31m✗ $romname file is not found \033[0m";
        echo -e "\033[1;31m\033[3m Please ensure that '$romname' file exists and try again. \033[0m";
        return_to_menu;
    fi

    echo -e "\033[1;33m⚡ Running sideload... \033[0m"
    termux-adb sideload $romname

    if [ $? -eq 0 ]; then
      echo -e "\033[1;32m✓ Sideload operation completed successfully! \033[0m";
    fi

    return_to_menu
    
  ;;
  "5")
    echo -e "\033[1;36m╭───────────────────────────────────────────────╮\033[0m"
    echo -e "\033[1;36m│\033[1;33m        Active Slot Check                      \033[1;36m│\033[0m"
    echo -e "\033[1;36m╰───────────────────────────────────────────────╯\033[0m"
    
    echo -e "\033[1;92m► Checking active slot... \033[0m"
    termux-fastboot getvar current-slot

    return_to_menu
  ;;
  "1")
    echo -e "\033[1;36m╭───────────────────────────────────────────────╮\033[0m"
    echo -e "\033[1;36m│\033[1;33m        Boot Flash Operation                   \033[1;36m│\033[0m"
    echo -e "\033[1;36m╰───────────────────────────────────────────────╯\033[0m"
    
    echo -e "\033[1;92m► Please enter the boot file location. \033[0m";
    echo -ne "\033[1;97mEnter the boot path: \033[0m"
    read -e romname

    if [ ! -f "$romname" ]; then
        echo -e "\033[1;31m✗ $romname file is not found \033[0m";
        echo -e "\033[1;31m\033[3m Please ensure that '$romname' file exists and try again. \033[0m";
        return_to_menu;
    fi

    echo -e "\033[1;33m⚡ Flashing boot... \033[0m"
    termux-fastboot flash boot $romname

    if [ $? -eq 0 ]; then
      echo -e "\033[1;32m✓ Operation completed successfully! \033[0m";
    fi

    return_to_menu
  ;;
  "2")
    echo -e "\033[1;36m╭───────────────────────────────────────────────╮\033[0m"
    echo -e "\033[1;36m│\033[1;33m        init_Boot Flash Operation              \033[1;36m│\033[0m"
    echo -e "\033[1;36m╰───────────────────────────────────────────────╯\033[0m"
    
    echo -e "\033[1;92m► Please enter the init_boot file location. \033[0m";
    echo -ne "\033[1;97mEnter the init_boot path: \033[0m"
    read -e romname

    if [ ! -f "$romname" ]; then
        echo -e "\033[1;31m✗ $romname file is not found \033[0m";
        echo -e "\033[1;31m\033[3m Please ensure that '$romname' file exists and try again. \033[0m";
        return_to_menu;
    fi

    echo -e "\033[1;33m⚡ Flashing init_boot... \033[0m"
    termux-fastboot flash init_boot $romname

    if [ $? -eq 0 ]; then
      echo -e "\033[1;32m✓ Operation completed successfully! \033[0m";
    fi

    return_to_menu
  ;;
  "4")
     echo -e "\033[1;36m╭───────────────────────────────────────────────╮\033[0m"
     echo -e "\033[1;36m│\033[1;33m        Recovery Flash Opration                \033[1;36m│\033[0m"
     echo -e "\033[1;36m╰───────────────────────────────────────────────╯\033[0m"
     
     echo -e "\033[1;92m► Please enter the recovery file location. \033[0m";
    echo -ne "\033[1;97mEnter the recovery path: \033[0m"
    read -e romname

    if [ ! -f "$romname" ]; then
        echo -e "\033[1;31m✗ $romname file is not found \033[0m";
        echo -e "\033[1;31m\033[3m Please ensure that '$romname' file exists and try again. \033[0m";
        return_to_menu;
    fi

    echo -e "\033[1;33m⚡ Flashing recovery... \033[0m"
    termux-fastboot flash recovery $romname

    
    read -p $'\033[1;97mDo you want to flash vbmeta.img file? Type \033[1;92my\033[1;97m to flash, any key to skip: \033[0m' vbimg;

    if [ "$vbimg" = "y" ] || [ "$vbimg" = "yes" ] || [ "$vbimg" = "Y" ] || [ "$vbimg" = "YES" ]; then
	 echo -e "\033[1;36m╭───────────────────────────────────────────────╮\033[0m"
     echo -e "\033[1;36m│\033[1;33m        VBMETA Flash Operation                \033[1;36m│\033[0m"
     echo -e "\033[1;36m╰───────────────────────────────────────────────╯\033[0m"
      echo -e "\033[1;92m► Please enter the vbmeta file location. \033[0m";
      echo -ne "\033[1;97mEnter the vbmeta path: \033[0m"
      read -e romname

    if [ ! -f "$romname" ]; then
        echo -e "\033[1;31m✗ $romname file is not found \033[0m";
        echo -e "\033[1;31m\033[3m Please ensure that '$romname' file exists and try again. \033[0m";
        return_to_menu;
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
  "20")
    go_to_main_menu
  ;;
  "6")
    echo -e "\033[1;36m╭───────────────────────────────────────────────╮\033[0m"
    echo -e "\033[1;36m│\033[1;33m        Boot_a Flash Operation                 \033[1;36m│\033[0m"
    echo -e "\033[1;36m╰───────────────────────────────────────────────╯\033[0m"
   
    echo -e "\033[1;92m► Please enter the boot file location. \033[0m";
    echo -ne "\033[1;97mEnter the boot path: \033[0m"
    read -e romname

    if [ ! -f "$romname" ]; then
        echo -e "\033[1;31m✗ $romname file is not found \033[0m";
        echo -e "\033[1;31m\033[3m Please ensure that '$romname' file exists and try again. \033[0m";
        return_to_menu;
    fi

    echo -e "\033[1;33m⚡ Flashing boot_a... \033[0m"
    termux-fastboot flash boot_a $romname

    
    read -p $'\033[1;97mDo you want to flash boot_b file? Type \033[1;92my\033[1;97m to flash, any key to skip: \033[0m' vbimg;

    if [ "$vbimg" = "y" ] || [ "$vbimg" = "yes" ] || [ "$vbimg" = "Y" ] || [ "$vbimg" = "YES" ]; then
      echo -e "\033[1;92m► Please enter the boot file location. \033[0m";
      echo -ne "\033[1;97mEnter the boot path: \033[0m"
      read -e romname

    if [ ! -f "$romname" ]; then
        echo -e "\033[1;31m✗ $romname file is not found \033[0m";
        echo -e "\033[1;31m\033[3m Please ensure that '$romname' file exists and try again. \033[0m";
        return_to_menu;
    fi

    echo -e "\033[1;33m⚡ Flashing boot_b... \033[0m"
    termux-fastboot flash boot_b $romname
    else
      echo -e "\033[1;33m◌ Skipping boot_b.img flash \033[0m";
    fi

    if [ $? -eq 0 ]; then
      echo -e "\033[1;32m✓ Operation completed successfully! \033[0m";
    fi

    return_to_menu
  ;;
"13")
    echo -e "\033[1;36m╭───────────────────────────────────────────────╮\033[0m"
    echo -e "\033[1;36m│\033[1;33m        Boot TWRP Recovery                     \033[1;36m│\033[0m"
    echo -e "\033[1;36m╰───────────────────────────────────────────────╯\033[0m"

    echo -e "\033[1;92m► Please enter the recovery file location. \033[0m";
    echo -ne "\033[1;97mEnter the recovery path: \033[0m"
    read -e romname

    if [ ! -f "$romname" ]; then
        echo -e "\033[1;31m✗ $romname file is not found \033[0m";
        echo -e "\033[1;31m\033[3m Please ensure that '$romname' file exists and try again. \033[0m";
        return_to_menu;
    fi

    echo -e "\033[1;33m⚡ Booting recovery... \033[0m"
    termux-fastboot boot $romname

    if [ $? -eq 0 ]; then
      echo -e "\033[1;32m✓ Boot command sent successfully! \033[0m";
    fi

    return_to_menu
  ;;
"16")
    echo -e "\033[1;36m╭───────────────────────────────────────────────╮\033[0m"
    echo -e "\033[1;36m│\033[1;33m        Activate Slot A Operation              \033[1;36m│\033[0m"
    echo -e "\033[1;36m╰───────────────────────────────────────────────╯\033[0m"
    
    echo -e "\033[1;33m⚡ Activating Slot A... \033[0m"
    termux-fastboot set_active a

    if [ $? -eq 0 ]; then
      echo -e "\033[1;32m✓ Slot A activated successfully! \033[0m";
    fi

    return_to_menu
  ;;
"17")
    echo -e "\033[1;36m╭───────────────────────────────────────────────╮\033[0m"
    echo -e "\033[1;36m│\033[1;33m        Activate Slot B Operation              \033[1;36m│\033[0m"
    echo -e "\033[1;36m╰───────────────────────────────────────────────╯\033[0m"
    
    echo -e "\033[1;33m⚡ Activating Slot B... \033[0m"
    termux-fastboot set_active b

    if [ $? -eq 0 ]; then
      echo -e "\033[1;32m✓ Slot B activated successfully! \033[0m";
    fi

    return_to_menu
  ;;
"7")    
    echo -e "\033[1;36m╭───────────────────────────────────────────────╮\033[0m"
    echo -e "\033[1;36m│\033[1;33m        Boot_b Flash Operation                 \033[1;36m│\033[0m"
    echo -e "\033[1;36m╰───────────────────────────────────────────────╯\033[0m"
  
    echo -e "\033[1;92m► Please enter the boot file location. \033[0m";
    echo -ne "\033[1;97mEnter the boot path: \033[0m"
    read -e romname

    if [ ! -f "$romname" ]; then
        echo -e "\033[1;31m✗ $romname file is not found \033[0m";
        echo -e "\033[1;31m\033[3m Please ensure that '$romname' file exists and try again. \033[0m";
        return_to_menu;
    fi

    echo -e "\033[1;33m⚡ Flashing boot_b... \033[0m"
    termux-fastboot flash boot_b $romname

    if [ $? -eq 0 ]; then
      echo -e "\033[1;32m✓ Operation completed successfully! \033[0m";
    fi

    return_to_menu
  ;;
  "8")
    echo -e "\033[1;36m╭───────────────────────────────────────────────╮\033[0m"
    echo -e "\033[1;36m│\033[1;33m        init_Boot_a Flash Operation            \033[1;36m│\033[0m"
    echo -e "\033[1;36m╰───────────────────────────────────────────────╯\033[0m"
   
    echo -e "\033[1;92m► Please enter the init_boot file location. \033[0m";
    echo -ne "\033[1;97mEnter the init_boot path: \033[0m"
    read -e romname

    if [ ! -f "$romname" ]; then
        echo -e "\033[1;31m✗ $romname file is not found \033[0m";
        echo -e "\033[1;31m\033[3m Please ensure that '$romname' file exists and try again. \033[0m";
        return_to_menu;
    fi

    echo -e "\033[1;33m⚡ Flashing init_boot_a... \033[0m"
    termux-fastboot flash init_boot_a $romname

    
    read -p $'\033[1;97mDo you want to flash init_boot_b file? Type \033[1;92my\033[1;97m to flash, any key to skip: \033[0m' vbimg;

    if [ "$vbimg" = "y" ] || [ "$vbimg" = "yes" ] || [ "$vbimg" = "Y" ] || [ "$vbimg" = "YES" ]; then
      echo -e "\033[1;92m► Please enter the init_boot file location. \033[0m";
      echo -ne "\033[1;97mEnter the init_boot path: \033[0m"
      read -e romname

    if [ ! -f "$romname" ]; then
        echo -e "\033[1;31m✗ $romname file is not found \033[0m";
        echo -e "\033[1;31m\033[3m Please ensure that '$romname' file exists and try again. \033[0m";
        return_to_menu;
    fi

    echo -e "\033[1;33m⚡ Flashing init_boot_b... \033[0m"
    termux-fastboot flash init_boot_b $romname
    else
      echo -e "\033[1;33m◌ Skipping init_boot_b.img flash \033[0m";
    fi

    if [ $? -eq 0 ]; then
      echo -e "\033[1;32m✓ Operation completed successfully! \033[0m";
    fi

    return_to_menu
  ;;
"9")    
    echo -e "\033[1;36m╭───────────────────────────────────────────────╮\033[0m"
    echo -e "\033[1;36m│\033[1;33m        init_Boot_b Flash Operation            \033[1;36m│\033[0m"
    echo -e "\033[1;36m╰───────────────────────────────────────────────╯\033[0m"
  
    echo -e "\033[1;92m► Please enter the init_boot file location. \033[0m";
    echo -ne "\033[1;97mEnter the init_boot path: \033[0m"
    read -e romname

    if [ ! -f "$romname" ]; then
        echo -e "\033[1;31m✗ $romname file is not found \033[0m";
        echo -e "\033[1;31m\033[3m Please ensure that '$romname' file exists and try again. \033[0m";
        return_to_menu;
    fi

    echo -e "\033[1;33m⚡ Flashing init_boot_b... \033[0m"
    termux-fastboot flash init_boot_b $romname

    if [ $? -eq 0 ]; then
      echo -e "\033[1;32m✓ Operation completed successfully! \033[0m";
    fi

    return_to_menu
  ;;
  "14")
    echo -e "\033[1;36m╭───────────────────────────────────────────────╮\033[0m"
    echo -e "\033[1;36m│\033[1;33m        vbmeta_a Flash Operation               \033[1;36m│\033[0m"
    echo -e "\033[1;36m╰───────────────────────────────────────────────╯\033[0m"
   
    echo -e "\033[1;92m► Please enter the vbmeta file location. \033[0m";
    echo -ne "\033[1;97mEnter the vbmeta path: \033[0m"
    read -e romname

    if [ ! -f "$romname" ]; then
        echo -e "\033[1;31m✗ $romname file is not found \033[0m";
        echo -e "\033[1;31m\033[3m Please ensure that '$romname' file exists and try again. \033[0m";
        return_to_menu;
    fi

    echo -e "\033[1;33m⚡ Flashing vbmeta_a... \033[0m"
    termux-fastboot --disable-verity --disable-verification flash vbmeta_a $romname

    
    read -p $'\033[1;97mDo you want to flash vbmeta_b file? Type \033[1;92my\033[1;97m to flash, any key to skip: \033[0m' vbimg;

    if [ "$vbimg" = "y" ] || [ "$vbimg" = "yes" ] || [ "$vbimg" = "Y" ] || [ "$vbimg" = "YES" ]; then
      echo -e "\033[1;92m► Please enter the vbmeta file location. \033[0m";
      echo -ne "\033[1;97mEnter the vbmeta path: \033[0m"
      read -e romname

    if [ ! -f "$romname" ]; then
        echo -e "\033[1;31m✗ $romname file is not found \033[0m";
        echo -e "\033[1;31m\033[3m Please ensure that '$romname' file exists and try again. \033[0m";
        return_to_menu;
    fi

    echo -e "\033[1;33m⚡ Flashing vbmeta_b... \033[0m"
    termux-fastboot --disable-verity --disable-verification flash vbmeta_b $romname

    else
      echo -e "\033[1;33m◌ Skipping vbmeta_b.img flash \033[0m";
    fi

    if [ $? -eq 0 ]; then
      echo -e "\033[1;32m✓ Operation completed successfully! \033[0m";
    fi

    return_to_menu
  ;;
"15")    
    echo -e "\033[1;36m╭───────────────────────────────────────────────╮\033[0m"
    echo -e "\033[1;36m│\033[1;33m        vbmeta_b Flash Operation               \033[1;36m│\033[0m"
    echo -e "\033[1;36m╰───────────────────────────────────────────────╯\033[0m"
  
    echo -e "\033[1;92m► Please enter the vbmeta file location. \033[0m";
    echo -ne "\033[1;97mEnter the vbmeta path: \033[0m"
    read -e romname

    if [ ! -f "$romname" ]; then
        echo -e "\033[1;31m✗ $romname file is not found \033[0m";
        echo -e "\033[1;31m\033[3m Please ensure that '$romname' file exists and try again. \033[0m";
        return_to_menu;
    fi

    echo -e "\033[1;33m⚡ Flashing vbmeta_b... \033[0m"
    termux-fastboot --disable-verity --disable-verification flash vbmeta_b $romname

    if [ $? -eq 0 ]; then
      echo -e "\033[1;32m✓ Operation completed successfully! \033[0m";
    fi

    return_to_menu
  ;;
  "3")
    echo -e "\033[1;36m╭───────────────────────────────────────────────╮\033[0m"
    echo -e "\033[1;36m│\033[1;33m        Vendor_Boot Flash Operation            \033[1;36m│\033[0m"
    echo -e "\033[1;36m╰───────────────────────────────────────────────╯\033[0m"
    
    echo -e "\033[1;92m► Please enter the vendor_boot file location. \033[0m";
    echo -ne "\033[1;97mEnter the vendor_boot path: \033[0m"
    read -e romname

    if [ ! -f "$romname" ]; then
        echo -e "\033[1;31m✗ $romname file is not found \033[0m";
        echo -e "\033[1;31m\033[3m Please ensure that '$romname' file exists and try again. \033[0m";
        return_to_menu;
    fi

    echo -e "\033[1;33m⚡ Flashing vendor_boot... \033[0m"
    termux-fastboot flash vendor_boot $romname

    if [ $? -eq 0 ]; then
      echo -e "\033[1;32m✓ Operation completed successfully! \033[0m";
    fi

    return_to_menu
;;
  "18")
    echo -e "\033[1;36m╭───────────────────────────────────────────────╮\033[0m"
    echo -e "\033[1;36m│\033[1;33m   Vendor_Boot_a Flash Operation               \033[1;36m│\033[0m"
    echo -e "\033[1;36m╰───────────────────────────────────────────────╯\033[0m"
    
    echo -e "\033[1;92m► Please enter the vendor_boot file location. \033[0m";
    echo -ne "\033[1;97mEnter the vendor_boot path: \033[0m"
    read -e romname

    if [ ! -f "$romname" ]; then
        echo -e "\033[1;31m✗ $romname file is not found \033[0m";
        echo -e "\033[1;31m\033[3m Please ensure that '$romname' file exists and try again. \033[0m";
        return_to_menu;
    fi

    echo -e "\033[1;33m⚡ Flashing vendor_boot... \033[0m"
    termux-fastboot flash vendor_boot_a $romname

    if [ $? -eq 0 ]; then
      echo -e "\033[1;32m✓ Operation completed successfully! \033[0m";
    fi

    return_to_menu
  ;;
  "19")
    echo -e "\033[1;36m╭───────────────────────────────────────────────╮\033[0m"
    echo -e "\033[1;36m│\033[1;33m     Vendor_Boot_b Flash Operation             \033[1;36m│\033[0m"
    echo -e "\033[1;36m╰───────────────────────────────────────────────╯\033[0m"
    
    echo -e "\033[1;92m► Please enter the vendor_boot file location. \033[0m";
    echo -ne "\033[1;97mEnter the vendor_boot path: \033[0m"
    read -e romname

    if [ ! -f "$romname" ]; then
        echo -e "\033[1;31m✗ $romname file is not found \033[0m";
        echo -e "\033[1;31m\033[3m Please ensure that '$romname' file exists and try again. \033[0m";
        return_to_menu;
    fi

    echo -e "\033[1;33m⚡ Flashing vendor_boot... \033[0m"
    termux-fastboot flash vendor_boot_b $romname

    if [ $? -eq 0 ]; then
      echo -e "\033[1;32m✓ Operation completed successfully! \033[0m";
    fi

    return_to_menu
  ;;
  *)
    echo -e '\033[1;31m✗ Wrong key press please select correct. \033[0m';
    
read -p $'\033[1;36mDo You want to exit? (y/n): \033[0m' choice
    if [[ "$choice" == "y" || "$choice" == "Y" || "$choice" == "yes" || "$choice" == "YES" ]]; then
        echo -e "\033[1;32m✓ Exiting program. Thank you for using Termux Root Recovery Tool! \033[0m"
	echo -e "\033[1;33m╭───────────────────────────────────────────────╮\033[0m"
    echo -e "\033[1;33m│ \033[1;97m     Subscribe - Repair A2Z YouTube channel   \033[1;33m│\033[0m"
	echo -e "\033[1;33m╰───────────────────────────────────────────────╯\033[0m"
xdg-open https://youtube.com/@repaira2z
        exit 0
    else
        ./flashAB.sh
    fi
  ;;
esac

