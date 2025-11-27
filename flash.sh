#!/bin/bash
trap "echo -e '\033[0;31m Script execution aborted. \033[0m'; exit 1" INT

# Function to prompt user before returning to main menu
return_to_menu() {
    echo -e "\033[1;33m╭───────────────────────────────────────────────╮\033[0m"
    echo -e "\033[1;33m│ \033[1;97m           Operation completed                \033[1;33m│\033[0m"
    echo -e "\033[1;33m╰───────────────────────────────────────────────╯\033[0m"
    
    read -p $'\033[1;36mReturn to main menu? (y/n): \033[0m' choice
    if [[ "$choice" == "y" || "$choice" == "Y" || "$choice" == "yes" || "$choice" == "YES" ]]; then
        source ./flash.sh
    else
        echo -e "\033[1;32m✓ Exiting program. Thank you for using Termux Root Recovery Tool! \033[0m"
echo -e "\033[1;33m╭───────────────────────────────────────────────╮\033[0m"
echo -e "\033[1;33m│ \033[1;97m.    Subscribe - Repair A2Z YouTube channel   \033[1;33m│\033[0m"
echo -e "\033[1;33m╰───────────────────────────────────────────────╯\033[0m"
        exit 0
    fi
}

clear
echo -e "\033[1;36m
╔═══════════════════════════════════════════════╗
║  \033[1;33m★ \033[1;37mTermux Root Recovery Tool By Repair-A2Z  \033[1;33m★\033[1;36m ║
╠═══════════════════════════════════════════════╣
║\033[1;32mFlash • Recovery • Root • Customize • sideload\033[1;36m ║
╚═══════════════════════════════════════════════╝
\033[0m"

echo -e "\033[1;35m╭───────────────────────────────────────────────╮\033[0m"
echo -e "\033[1;35m│\033[1;33m          What would you like to do?           \033[1;35m│\033[0m"
echo -e "\033[1;35m╰───────────────────────────────────────────────╯\033[0m"

echo -e "\033[1;34m┌──────────────────────────────────────────────┐\033[0m"
echo -e "\033[1;34m│ \033[1;37m 1. \033[1;92m💿 Flash Recovery                        \033[1;34m│\033[0m"
echo -e "\033[1;34m│ \033[1;37m 2. \033[1;92m📀 Flash VBMETA                          \033[1;34m│\033[0m"
echo -e "\033[1;34m│ \033[1;37m 3. \033[1;92m💿 Flash Boot image                      \033[1;34m│\033[0m"
echo -e "\033[1;34m│ \033[1;37m 4. \033[1;92m📀 Flash init_Boot image                 \033[1;34m│\033[0m"
echo -e "\033[1;34m│ \033[1;37m 5. \033[1;92m💿 Flash Super_empty image               \033[1;34m│\033[0m"
echo -e "\033[1;34m│ \033[1;37m 6. \033[1;92m🔌 Check fastboot devices                \033[1;34m│\033[0m"
echo -e "\033[1;34m│ \033[1;37m 7. \033[1;92m🔌 Check ADB Device                      \033[1;34m│\033[0m"
echo -e "\033[1;34m│ \033[1;37m 8. \033[1;92m🔃 Reboot To Fastboot Mode               \033[1;34m│\033[0m"
echo -e "\033[1;34m│ \033[1;37m 9. \033[1;92m♻️  Reboot To Recovery Mode               \033[1;34m│\033[0m"
echo -e "\033[1;34m│ \033[1;37m10. \033[1;92m🔛 Reboot System  \033[1;35m(From fastboot)        \033[1;34m│\033[0m"
echo -e "\033[1;34m│ \033[1;37m11. \033[1;92m📁 Flash Zip adb Sideload                \033[1;34m│\033[0m"
echo -e "\033[1;34m│ \033[1;37m12. \033[1;92m📂 Flash Fastboot Rom                    \033[1;34m│\033[0m"
echo -e "\033[1;34m│ \033[1;37m13. \033[1;92m☯️  Flash GSi Rom \033[1;35m(Dynamic Partition)     \033[1;34m│\033[0m"
echo -e "\033[1;34m│ \033[1;37m14. \033[1;92m🆎 AB Partition Tool                     \033[1;34m│\033[0m"
echo -e "\033[1;34m│ \033[1;37m15. \033[1;92m📵 Fix Usb Not Working                   \033[1;34m│\033[0m"
echo -e "\033[1;34m│ \033[1;37m16. \033[1;33m🔓 Bootloader Unlock (coming soon)       \033[1;34m│\033[0m"
echo -e "\033[1;34m│ \033[1;37m17. \033[1;92m🔐 FRP Remove  \033[1;35m(experimental)            \033[1;34m│\033[0m"
echo -e "\033[1;34m│ \033[1;37m18. \033[1;92m⬇️  Firmware File Extract Tool            \033[1;34m│\033[0m"
echo -e "\033[1;34m│ \033[1;37m19. \033[1;92m📝 Manual Commond Exicut...              \033[1;34m│\033[0m"
echo -e "\033[1;34m└──────────────────────────────────────────────┘\033[0m"

echo -e "\033[1;33m╭───────────────────────────────────────────────╮\033[0m"
echo -e "\033[1;33m│ \033[1;97mEnter your choice or press any key to exit    \033[1;33m│\033[0m"
echo -e "\033[1;33m╰───────────────────────────────────────────────╯\033[0m"

read -p $'\033[1;36mChoice: \033[0m' flasher

case $flasher in
  "1")

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
  "2")
     echo -e "\033[1;36m╭───────────────────────────────────────────────╮\033[0m"
     echo -e "\033[1;36m│\033[1;33m         VBMETA Flash Operation                \033[1;36m│\033[0m"
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

    if [ $? -eq 0 ]; then
      echo -e "\033[1;32m✓ Operation completed successfully! \033[0m";
    fi

    return_to_menu

  ;;
  "4")

     echo -e "\033[1;36m╭───────────────────────────────────────────────╮\033[0m"
     echo -e "\033[1;36m│\033[1;33m        init_boot Flash Opration                \033[1;36m│\033[0m"
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
  "11")

    echo -e "\033[1;36m╭───────────────────────────────────────────────╮\033[0m"
    echo -e "\033[1;36m│\033[1;33m         ADB Sideload Operation                \033[1;36m│\033[0m"
    echo -e "\033[1;36m╰───────────────────────────────────────────────╯\033[0m"

    echo -e "\033[1;92m► Please enter the Zip 📁 file location... \033[0m";
    echo -ne "\033[1;97mEnter the zip file path: \033[0m"
    read -e romname

    if [ ! -f "$romname" ]; then
        echo -e "\033[1;31m ✗ $romname file is not found \033[0m";
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
  "7")
    echo -e "\033[1;36m╭───────────────────────────────────────────────╮\033[0m"
    echo -e "\033[1;36m│\033[1;33m      Searching 🔍  ADB Devices                \033[1;36m│\033[0m"
    echo -e "\033[1;36m╰───────────────────────────────────────────────╯\033[0m"
    
    echo -e "\033[1;92m► Checking ADB devices: \033[0m"
    termux-adb devices

    return_to_menu
  ;;
  "6")
    echo -e "\033[1;36m╭───────────────────────────────────────────────╮\033[0m"
    echo -e "\033[1;36m│\033[1;33m    Searching  🔍  Fastboot Devices            \033[1;36m│\033[0m"
    echo -e "\033[1;36m╰───────────────────────────────────────────────╯\033[0m"
    
    echo -e "\033[1;92m► Checking Fastboot devices: \033[0m"
    termux-fastboot devices

    return_to_menu
  ;;
  "12")
    echo -e "\033[1;36m╭───────────────────────────────────────────────╮\033[0m"
    echo -e "\033[1;36m│\033[1;33m         Stock ROM Flash Operation             \033[1;36m│\033[0m"
    echo -e "\033[1;36m╰───────────────────────────────────────────────╯\033[0m"
    
    echo -e "\033[1;92m► Launching Stock ROM Flashing Utility... \033[0m"
    cp flash-stock-rom.sh /storage/emulated/0/Download/stock-rom
    cd /storage/emulated/0/Download/stock-rom
    bash flash-stock-rom.sh

    return_to_menu
  ;;
  "3")
    echo -e "\033[1;36m╭───────────────────────────────────────────────╮\033[0m"
    echo -e "\033[1;36m│\033[1;33m         Boot Image Flash Operation            \033[1;36m│\033[0m"
    echo -e "\033[1;36m╰───────────────────────────────────────────────╯\033[0m"
    
    echo -e "\033[1;92m► Please enter the boot file location. \033[0m";
    echo -ne "\033[1;97mEnter the boot file path: \033[0m"
    read -e romname

    if [ ! -f "$romname" ]; then
        echo -e "\033[1;31m✗ $romname file is not found \033[0m";
        echo -e "\033[1;31m\033[3m Please ensure that '$romname' file exists and try again. \033[0m";
        return_to_menu;
    fi

    echo -e "\033[1;33m⚡ Flashing boot image... \033[0m"
    termux-fastboot flash boot $romname

    if [ $? -eq 0 ]; then
      echo -e "\033[1;32m✓ Operation completed successfully! \033[0m";
    fi

    return_to_menu
  ;;
"10")
    echo -e "\033[1;36m╭───────────────────────────────────────────────╮\033[0m"
    echo -e "\033[1;36m│\033[1;33m         System Reboot Operation               \033[1;36m│\033[0m"
    echo -e "\033[1;36m╰───────────────────────────────────────────────╯\033[0m"
    
    echo -e "\033[1;33m⚡ Rebooting device to system... \033[0m"
    termux-fastboot reboot

    if [ $? -eq 0 ]; then
      echo -e "\033[1;32m✓ Reboot command sent successfully! \033[0m";
    fi

    return_to_menu
  ;;
"8")
    echo -e "\033[1;36m╭───────────────────────────────────────────────╮\033[0m"
    echo -e "\033[1;36m│\033[1;33m      Reboot System To Fastboot                \033[1;36m│\033[0m"
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
    echo -e "\033[1;36m│\033[1;33m        Reboot System To Recovery              \033[1;36m│\033[0m"
    echo -e "\033[1;36m╰───────────────────────────────────────────────╯\033[0m"
    
    echo -e "\033[1;33m⚡ Rebooting device to recovery mode... \033[0m"
    termux-adb reboot recovery

    if [ $? -eq 0 ]; then
      echo -e "\033[1;32m✓ Reboot command sent successfully! \033[0m";
    fi

    return_to_menu
  ;;
"13")
    echo -e "\033[1;36m╭───────────────────────────────────────────────╮\033[0m"
    echo -e "\033[1;36m│\033[1;33m        GSI Flash Tool Launch                 \033[1;36m│\033[0m"
    echo -e "\033[1;36m╰───────────────────────────────────────────────╯\033[0m"
    
    echo -e "\033[1;92m► Launching GSI Flash Tool... \033[0m"
    ./gsi-flash.sh

    return_to_menu
  ;;
"14")
    echo -e "\033[1;36m╭───────────────────────────────────────────────╮\033[0m"
    echo -e "\033[1;36m│\033[1;33m        A/B Partition Tool Launch             \033[1;36m│\033[0m"
    echo -e "\033[1;36m╰───────────────────────────────────────────────╯\033[0m"
    
    echo -e "\033[1;92m► Launching A/B Partition Device Tool... \033[0m"
    ./flashAB.sh

    return_to_menu
  ;;
   "5")

     echo -e "\033[1;36m╭───────────────────────────────────────────────╮\033[0m"
     echo -e "\033[1;36m│\033[1;33m      Super_img Flash Opration                 \033[1;36m│\033[0m"
     echo -e "\033[1;36m╰───────────────────────────────────────────────╯\033[0m"
     
     echo -e "\033[1;92m► Please enter the super_empty.img file location. \033[0m";
    echo -ne "\033[1;97mEnter the super_empty.img path: \033[0m"
    read -e romname

    if [ ! -f "$romname" ]; then
        echo -e "\033[1;31m✗ $romname file is not found \033[0m";
        echo -e "\033[1;31m\033[3m Please ensure that '$romname' file exists and try again. \033[0m";
        return_to_menu;
    fi

    echo -e "\033[1;33m⚡ Flashing super_empty... \033[0m"
    termux-fastboot wipe-super $romname

    
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
"15")
    echo -e "\033[1;36m╭───────────────────────────────────────────────╮\033[0m"
    echo -e "\033[1;36m│\033[1;33m      USB 🔌 OTG Fix Tool Launch            \033[1;36m│\033[0m"
    echo -e "\033[1;36m╰───────────────────────────────────────────────╯\033[0m"
    
    echo -e "\033[1;92m► Launching 🔌Usb Otg Tool... \033[0m"
    ./usbfix.sh

    return_to_menu
  ;;
"17")
    echo -e "\033[1;36m╭───────────────────────────────────────────────╮\033[0m"
    echo -e "\033[1;36m│\033[1;33m       Frp Reset Tool Utility           \033[1;36m│\033[0m"
    echo -e "\033[1;36m╰───────────────────────────────────────────────╯\033[0m"
    
    echo -e "\033[1;92m► Launching frp 🔒 Tool.. \033[0m"
    ./frp.sh

    return_to_menu
  ;;
"16")
    echo -e "\033[1;36m╭───────────────────────────────────────────────╮\033[0m"
    echo -e "\033[1;36m│\033[1;33m         Bootloader 🔓 Unlock 🛠️  Utility       \033[1;36m│\033[0m"
    echo -e "\033[1;36m╰───────────────────────────────────────────────╯\033[0m"
    
    echo -e "\033[1;92m► Coming 🕤 Soon... \033[0m"
    echo -e "\033[1;92m► Wait ⏳  For Next 📢. Update... \033[0m"

    return_to_menu
  ;;
"19")
echo -e "\033[1;36m╭───────────────────────────────────────────────╮\033[0m"
     echo -e "\033[1;36m│\033[1;33m           Manual Commond Opration             \033[1;36m│\033[0m"
     echo -e "\033[1;36m╰───────────────────────────────────────────────╯\033[0m"
     
     echo -e  "\033[1;92m► Please enter your commond 👇 here. \033[0m";

# Prompt the user to enter a command
read -p "Enter your command: " user_command

# Execute the entered command
eval "termux-$user_command"

return_to_menu
;;
"18")
    echo -e "\033[1;36m╭───────────────────────────────────────────────╮\033[0m"
    echo -e "\033[1;36m│\033[1;33m      Firmwere Content Extracter Tool.         \033[1;36m│\033[0m"
    echo -e "\033[1;36m╰───────────────────────────────────────────────╯\033[0m"
    
    echo -e "\033[1;92m► Launching ⏳ F-C-E Tool... \033[0m"
    xdg-open https://fce-tool.pages.dev/

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
        ./flash.sh
    fi
  ;;
esac

