#!/bin/bash
trap "echo -e '\033[0;31m Script execution aborted. \033[0m'; exit 1" INT
file1="flash_all.sh"
file2="flash_all_lock.sh"
file3="flash_all_except_data_storage.sh"

chmod +x $file1 $file2 $file3

echo -e "\033[1;32m✓ Permissions set successfully!
    \033[0m"

# Perform search and replace using awk
if [ ! -f $file1 ]; then
    echo -e "\033[1;31m✗ $file1 file is not found
    Please rename your firmware folder to 'stock-rom' and copy it to the Download folder in internal storage.\033[0m";
    exit 1;    
fi

if [ ! -f $file2 ]; then
    echo -e "\033[1;31m✗ $file2 file is not found\033[0m";
    exit 1;    
fi

if [ ! -f $file3 ]; then
    echo -e "\033[1;31m✗ $file3 file is not found\033[0m";
    exit 1;    
fi

clear
echo -e "\033[1;36m
╔═══════════════════════════════════════════════╗
║  \033[1;33m★ \033[1;37mTermux Root Recovery Tool \033[1;33m★\033[1;36m             ║
╠═══════════════════════════════════════════════╣
║  \033[1;93mStock ROM Flashing Utility\033[1;36m                  ║
╚═══════════════════════════════════════════════╝
\033[0m"

echo -e "\033[1;35m╭───────────────────────────────────────────────╮\033[0m"
echo -e "\033[1;35m│\033[1;33m          What would you like to do?           \033[1;35m│\033[0m"
echo -e "\033[1;35m╰───────────────────────────────────────────────╯\033[0m"

echo -e "\033[1;34m┌──────────────────────────────────────────────┐\033[0m"
echo -e "\033[1;34m│ \033[1;37m1. \033[1;92mFlash without locking bootloader         \033[1;34m│\033[0m"
echo -e "\033[1;34m│ \033[1;37m2. \033[1;92mFlash and lock bootloader                \033[1;34m│\033[0m"
echo -e "\033[1;34m│ \033[1;37m3. \033[1;92mFlash except data storage                \033[1;34m│\033[0m"
echo -e "\033[1;34m│ \033[1;37m4. \033[1;92mReturn to Main Menu                      \033[1;34m│\033[0m"
echo -e "\033[1;34m└──────────────────────────────────────────────┘\033[0m"

echo -e "\033[1;33m╭───────────────────────────────────────────────╮\033[0m"
echo -e "\033[1;33m│ \033[1;97mEnter your choice or press any key to exit    \033[1;33m│\033[0m"
echo -e "\033[1;33m╰───────────────────────────────────────────────╯\033[0m"

read -p $'\033[1;36mChoice: \033[0m' flasher

case $flasher in
    "1")
        echo -e "\033[1;33m⚡ Flashing stock ROM without locking bootloader... \033[0m"
        source $file1
    ;;
    "2")
        echo -e "\033[1;33m⚡ Flashing stock ROM and locking bootloader... \033[0m"
        source $file2
    ;;
    "3")
        echo -e "\033[1;33m⚡ Flashing stock ROM except data storage... \033[0m"
        source $file3
    ;;
    "4")
        echo -e "\033[1;92m► Returning to main menu... \033[0m"
        cd ~/Termux-Root-Recovery-Tool
   
        source ./flash.sh
    ;;
    *)
        echo -e '\033[1;31m✗ Script execution aborted. \033[0m';
        exit 1
    ;;
esac