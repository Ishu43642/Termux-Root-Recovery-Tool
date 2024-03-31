#!/bin/bash
trap "echo -e '\033[0;31m Script execution aborted. \033[0m'; exit 1" INT
file1="flash_all.sh"
file2="flash_all_lock.sh"
file3="flash_all_except_data_storage.sh"

chmod +x $file1 $file2 $file3

echo -e "\033[0;32m Succeed! CHMOD EXECUTED!
    \033[0m"

# Perform search and replace using awk
if [ ! -f $file1 ]; then
    echo -e "\033[0;31m $file1 file is not found \033[0m";
    exit 1;    
fi

if [ ! -f $file2 ]; then
    echo -e "\033[0;31m $file2 file is not found \033[0m";
    exit 1;    
fi

if [ ! -f $file3 ]; then
    echo -e "\033[0;31m $file3 file is not found \033[0m";
    exit 1;    
fi



echo -e "\033[0;33m 
--------------------------------------------------
What do you want to do?
--------------------------------------------------
1. Flash without lock bootloader
2. Flash and lock bootloader
3. Flash except data storage
4. Home Page
--------------------------------------------------
(Press Any key to Exit or input your choice.)
\033[0m";

read -p "Choice: " flasher

case $flasher in
    "1")
        source $file1
    ;;
    "2")
        source $file2
    ;;
    "3")
        source $file3
    ;;
    "4")
        cd ~/Termux-Root-Recovery-Tool
   
        source ./flash.sh
    ;;
esac