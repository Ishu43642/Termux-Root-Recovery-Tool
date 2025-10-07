#!/bin/bash
trap "echo -e '\033[0;31m Script execution aborted. \033[0m'; exit 1" INT

# Function to prompt user before returning to main menu
return_to_menu() {
    echo -e "\033[1;33m╭───────────────────────────────────────────────╮\033[0m"
    echo -e "\033[1;33m│ \033[1;97m     Operation completed                      \033[1;33m│\033[0m"
    echo -e "\033[1;33m╰───────────────────────────────────────────────╯\033[0m"
    
    read -p $'\033[1;36mReturn to Firmware content Extracter menu? (y/n): \033[0m' choice
    if [[ "$choice" == "y" || "$choice" == "Y" || "$choice" == "yes" || "$choice" == "YES" ]]; then
        source ./FCE.sh
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
        ./FCE.sh
    fi
}

clear
echo -e "\033[1;36m
╔═══════════════════════════════════════════════╗
║\033[1;33m ★ \033[1;37mTermux Root Recovery Tool By Repair-A2Z\033[1;33m ★\033[1;36m   ║
╠═══════════════════════════════════════════════╣
║\033[1;95m📀 Firmwere content Extracter Tool - Boot.img \033[1;36m ║
╠═══════════════════════════════════════════════╣
║ \033[1;92m Boot.img • init_Boot.img • Vender_boot.img\033[1;36m   ║
╚═══════════════════════════════════════════════╝
\033[0m"

echo -e "\033[1;35m╭───────────────────────────────────────────────╮\033[0m"
echo -e "\033[1;35m│\033[1;33m          What would you like to do?           \033[1;35m│\033[0m"
echo -e "\033[1;35m╰───────────────────────────────────────────────╯\033[0m"

echo -e "\033[1;34m┌──────────────────────────────────────────────┐\033[0m"
echo -e "\033[1;34m│ \033[1;37m 1. \033[1;92m⬇️  Extract Boot.img Vender.img           \033[1;34m│\033[0m"
echo -e "\033[1;34m│ \033[1;37m 2. \033[1;92m💿 Download Boot.img                     \033[1;34m│\033[0m"
echo -e "\033[1;34m│ \033[1;37m 3. \033[1;92m📀 Download init_boot.img                \033[1;34m│\033[0m"
echo -e "\033[1;34m│ \033[1;37m 4. \033[1;92m💽 Download Vender_boot.img              \033[1;34m│\033[0m"
echo -e "\033[1;34m│ \033[1;37m 5. \033[1;92m🌐 Credit - Offici5l  Tool Owner         \033[1;34m│\033[0m"
echo -e "\033[1;34m│ \033[1;37m 6. \033[1;33m↩️  Return to Main Menu                   \033[1;34m│\033[0m"
echo -e "\033[1;34m└──────────────────────────────────────────────┘\033[0m"

echo -e "\033[1;33m╭───────────────────────────────────────────────╮\033[0m"
echo -e "\033[1;33m│ \033[1;97mEnter your choice or press any key to exit    \033[1;33m│\033[0m"
echo -e "\033[1;33m╰───────────────────────────────────────────────╯\033[0m"

read -p $'\033[1;36mChoice: \033[0m' flasher

case $flasher in
  "1")
    echo -e "\033[1;36m╭───────────────────────────────────────────────╮\033[0m"
    echo -e "\033[1;36m│\033[1;33m  Firmwere File Extract Boot,init-boot,Vender  \033[1;36m│\033[0m"
    echo -e "\033[1;36m╰───────────────────────────────────────────────╯\033[0m"
    
    echo -e "\033[1;92m► Enter 👇 Your Firmware Link 🌐... \033[0m"

echo -n "Enter your firmware link: "

read user_command

eval "curl "fce.offici5l.workers.dev?url=$user_command""

    return_to_menu
  ;;

  "6")
    go_to_main_menu
  ;;

  "2")
    echo -e "\033[1;36m╭───────────────────────────────────────────────╮\033[0m"
    echo -e "\033[1;36m│\033[1;33m       Download Extracted Boot.img             \033[1;36m│\033[0m"
    echo -e "\033[1;36m╰───────────────────────────────────────────────╯\033[0m"
    
    echo -e "\033[1;33m Opening Telegram Link... \033[0m"
    xdg-open https://t.me/boot_img_zip


    return_to_menu
  ;;
"3")
    echo -e "\033[1;36m╭───────────────────────────────────────────────╮\033[0m"
    echo -e "\033[1;36m│\033[1;33m      Download Extracted init_boot.img         \033[1;36m│\033[0m"
    echo -e "\033[1;36m╰───────────────────────────────────────────────╯\033[0m"
    
    echo -e "\033[1;33m Opening Telegram Link.. \033[0m"
    xdg-open https://t.me/init_boot_img_zip

    return_to_menu
  ;;
"4")    
     echo -e "\033[1;36m╭───────────────────────────────────────────────╮\033[0m"
    echo -e "\033[1;36m│\033[1;33m  Download Extracted Vender_boot.img           \033[1;36m│\033[0m"
    echo -e "\033[1;36m╰───────────────────────────────────────────────╯\033[0m"
    
    echo -e "\033[1;33m Opening Telegram Link.. \033[0m"
    xdg-open https://t.me/vendor_boot_img_zip

        return_to_menu
  ;;
"5")    
     echo -e "\033[1;36m╭───────────────────────────────────────────────╮\033[0m"
    echo -e "\033[1;36m│\033[1;33m          F-C-E Tool Credit - Offici5l         \033[1;36m│\033[0m"
    echo -e "\033[1;36m╰───────────────────────────────────────────────╯\033[0m"
    
    echo -e "\033[1;33m Opening link... \033[0m"
    xdg-open https://github.com/offici5l/Firmware-Content-Extractor

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
        ./FCE.sh
    fi
  ;;
esac

