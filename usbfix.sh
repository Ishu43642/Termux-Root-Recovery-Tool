#!/bin/bash
trap "echo -e '\033[0;31m Script execution aborted. \033[0m'; exit 1" INT

# Function to prompt user before returning to main menu
return_to_menu() {
    echo -e "\033[1;33m╭───────────────────────────────────────────────╮\033[0m"
    echo -e "\033[1;33m│ \033[1;97m     Operation completed                      \033[1;33m│\033[0m"
    echo -e "\033[1;33m╰───────────────────────────────────────────────╯\033[0m"
    
    read -p $'\033[1;36mReturn to Usb Otg Fix menu? (y/n): \033[0m' choice
    if [[ "$choice" == "y" || "$choice" == "Y" || "$choice" == "yes" || "$choice" == "YES" ]]; then
        source ./usbfix.sh
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
        ./usbfix.sh
    fi
}

clear
echo -e "\033[1;36m
╔═══════════════════════════════════════════════╗
║\033[1;33m ★ \033[1;37mTermux Root Recovery Tool By Repair-A2Z\033[1;33m ★\033[1;36m   ║
╠═══════════════════════════════════════════════╣
║  \033[1;95m           USB OTG FIXING TOOL     \033[1;36m          ║
╚═══════════════════════════════════════════════╝
\033[0m"

echo -e "\033[1;35m╭───────────────────────────────────────────────╮\033[0m"
echo -e "\033[1;35m│\033[1;33m          What would you like to do?           \033[1;35m│\033[0m"
echo -e "\033[1;35m╰───────────────────────────────────────────────╯\033[0m"

echo -e "\033[1;34m┌──────────────────────────────────────────────┐\033[0m"
echo -e "\033[1;34m│ \033[1;37m 1. \033[1;92m🔌 Check OTG Device                      \033[1;34m│\033[0m"
echo -e "\033[1;34m│ \033[1;37m 2. \033[1;92m♻️  Reinstall Termux Api                  \033[1;34m│\033[0m"
echo -e "\033[1;34m│ \033[1;37m 3. \033[1;92m♻️  Reinstall Adb Fastboot                \033[1;34m│\033[0m"
echo -e "\033[1;34m│ \033[1;37m 4. \033[1;92m📵 Stop Adb Server                       \033[1;34m│\033[0m"
echo -e "\033[1;34m│ \033[1;37m 5. \033[1;92m🔁 Start Adb Server                      \033[1;34m│\033[0m"
echo -e "\033[1;34m│ \033[1;37m 6. \033[1;92m🔌 Check adb Devices                     \033[1;34m│\033[0m"
echo -e "\033[1;34m│ \033[1;37m 7. \033[1;92m🔌 Check Fastboot Devices                \033[1;34m│\033[0m"
echo -e "\033[1;34m│ \033[1;37m 8. \033[1;92m⬇️  install Android-tools \033[1;35m( only for      \033[1;34m│\033[0m"
echo -e "\033[1;34m│      \033[1;35m  fastboot rom flash )                  \033[1;34m│\033[0m"
echo -e "\033[1;34m│ \033[1;37m 9. \033[1;33m↩️  Return to Main Menu                   \033[1;34m│\033[0m"
echo -e "\033[1;34m└──────────────────────────────────────────────┘\033[0m"

echo -e "\033[1;33m╭───────────────────────────────────────────────╮\033[0m"
echo -e "\033[1;33m│ \033[1;97mEnter your choice or press any key to exit    \033[1;33m│\033[0m"
echo -e "\033[1;33m╰───────────────────────────────────────────────╯\033[0m"

read -p $'\033[1;36mChoice: \033[0m' flasher

case $flasher in
  "1")
    echo -e "\033[1;36m╭───────────────────────────────────────────────╮\033[0m"
    echo -e "\033[1;36m│\033[1;33m    Connected Device in OTG Port Tester 🔗     \033[1;36m│\033[0m"
    echo -e "\033[1;36m╰───────────────────────────────────────────────╯\033[0m"
    
    echo -e "\033[1;92m► 👇 Checking OTG & Usb 🔌 Port... \033[0m"
    termux-usb -l

    return_to_menu
  ;;

  "9")
    go_to_main_menu
  ;;

  "3")
    echo -e "\033[1;36m╭───────────────────────────────────────────────╮\033[0m"
    echo -e "\033[1;36m│\033[1;33m         Remove Adb & Reinstalling             \033[1;36m│\033[0m"
    echo -e "\033[1;36m╰───────────────────────────────────────────────╯\033[0m"
    
    echo -e "\033[1;33m♻️ Reinstalling Termux-adb fastboot... \033[0m"
    yes | pkg rm termux-adb && bash installadb.sh


    return_to_menu
  ;;
"4")
    echo -e "\033[1;36m╭───────────────────────────────────────────────╮\033[0m"
    echo -e "\033[1;36m│\033[1;33m              🔴  Stop Adb Server              \033[1;36m│\033[0m"
    echo -e "\033[1;36m╰───────────────────────────────────────────────╯\033[0m"
    
    echo -e "\033[1;33m 📵 stoping adb server... \033[0m"
    termux-adb kill-server

    return_to_menu
  ;;
"5")    
     echo -e "\033[1;36m╭───────────────────────────────────────────────╮\033[0m"
    echo -e "\033[1;36m│\033[1;33m             🟢  Start Adb Server              \033[1;36m│\033[0m"
    echo -e "\033[1;36m╰───────────────────────────────────────────────╯\033[0m"
    
    echo -e "\033[1;33m ♻️Restarting adb server... \033[0m"
    termux-adb start-server

        return_to_menu
  ;;
"6")    
     echo -e "\033[1;36m╭───────────────────────────────────────────────╮\033[0m"
    echo -e "\033[1;36m│\033[1;33m              Search 🔍 Adb device             \033[1;36m│\033[0m"
    echo -e "\033[1;36m╰───────────────────────────────────────────────╯\033[0m"
    
    echo -e "\033[1;33m Searching adb device... \033[0m"
    termux-adb devices

        return_to_menu
  ;;
"7")    
     echo -e "\033[1;36m╭───────────────────────────────────────────────╮\033[0m"
    echo -e "\033[1;36m│\033[1;33m           Search 🔍  Fastboot Device          \033[1;36m│\033[0m"
    echo -e "\033[1;36m╰───────────────────────────────────────────────╯\033[0m"
    
    echo -e "\033[1;33m Searching Fastboot device... \033[0m"
    termux-fastboot devices

        return_to_menu
  ;;
  "8")
    echo -e "\033[1;36m╭───────────────────────────────────────────────╮\033[0m"
    echo -e "\033[1;36m│\033[1;33m  installing  android-tools        \033[1;36m│\033[0m"
    echo -e "\033[1;36m╰───────────────────────────────────────────────╯\033[0m"
    
    echo -e "\033[1;33m♻️ installing android-tools... \033[0m"
    yes | pkg install android-tools


    return_to_menu
  ;;
"2")
    echo -e "\033[1;36m╭───────────────────────────────────────────────╮\033[0m"
    echo -e "\033[1;36m│\033[1;33m        Termux-api PKG Reinstallation          \033[1;36m│\033[0m"
    echo -e "\033[1;36m╰───────────────────────────────────────────────╯\033[0m"
    
    echo -e "\033[1;33m♻️ Reinstalling Termux-api... \033[0m"
    yes | pkg rm termux-api && pkg install termux-api


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
        ./usbfix.sh
    fi
  ;;
esac

