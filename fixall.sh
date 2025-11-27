#!/bin/bash

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
RESET='\033[0m'

# Function: Check Termux-API is installed
check_termux_api() {
    if ! command -v termux-usb >/dev/null 2>&1; then
        echo -e "${RED}Termux:API not installed. Installing now...${RESET}"
        pkg install termux-api -y
    fi
}

# Function: Check Termux ADB/Fastboot is installed
check_termux_adb() {
    if ! command -v termux-adb >/dev/null 2>&1 || ! command -v fastboot >/dev/null 2>&1; then
        echo -e "${RED}ADB/Fastboot not found.${RESET}"
        echo -e "${BLUE}Running installadb.sh to install them...${RESET}"
        bash installadb.sh
    fi
}

# MAIN LOOP
while true; do
    echo -e "${CYAN}Checking USB using: Termux-USB${RESET}"

    USB_OUTPUT=$(termux-usb -l)

    # Detect USB in JSON list: "/dev/bus/usb/xxx/xxx"
    USB_ID=$(echo "$USB_OUTPUT" | grep -oE '/dev/bus/usb/[0-9]+/[0-9]+')

    if [ -z "$USB_ID" ]; then
        echo -e "${RED}No USB device detected.${RESET}"

        # Termux API may not be installed
        check_termux_api

        echo -e "${RED}USB not found, please check connection.${RESET}"
        sleep 3
        continue
    fi

    echo -e "${GREEN}USB detected: ${YELLOW}$USB_ID${RESET}"

    # Check if ADB/Fastboot installed
    check_termux_adb

    echo -e "${BLUE}Searching for ADB devices...${RESET}"
    ADB_DEVICE=$(termux-adb devices | awk 'NR>1 && $2=="device" {print $1}')

    if [ -n "$ADB_DEVICE" ]; then
        echo -e "${GREEN}ADB device found: ${YELLOW}$ADB_DEVICE${RESET}"
        break
    fi

    echo -e "${BLUE}Searching for Fastboot devices...${RESET}"
    FASTBOOT_DEVICE=$(termux-fastboot devices | awk 'NR>1 {print $1}')

    if [ -n "$FASTBOOT_DEVICE" ]; then
        echo -e "${GREEN}Fastboot device found: ${YELLOW}$FASTBOOT_DEVICE${RESET}"
        break
    fi

    echo -e "${RED}USB detected but no ADB/Fastboot device found.${RESET}"
    echo -e "${RED}Please check your USB connection or enable USB debugging.${RESET}"
    sleep 3
done

echo -e "${GREEN}Device connected successfully! Launching Termux-Root-Recovery-Tool...${RESET}"

# ------------------------
# PLACE YOUR NEXT COMMANDS BELOW
# Example:
# adb reboot
# ------------------------
   ./flash.sh