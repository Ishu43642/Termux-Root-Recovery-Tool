#!/bin/bash

# ============================================
# COLORS
# ============================================
CYAN="\033[1;36m"
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
RESET="\033[0m"

# ============================================
# HELP FUNCTIONS (FROM start.sh)
# ============================================
open_url() {
  url="$1"
  if command -v termux-open-url >/dev/null 2>&1; then
    termux-open-url "$url"
  elif command -v xdg-open >/dev/null 2>&1; then
    xdg-open "$url"
  else
    am start -a android.intent.action.VIEW -d "$url" >/dev/null 2>&1
  fi
}

pause_return_to_menu() {
  read -p $'\033[1;36mPress Enter to continue...\033[0m'
}

# ============================================================
# SPLASH SCREEN
# ============================================================
clear
echo -e "${CYAN}┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓"
echo -e "┃           ★ Repair A2Z Root Tool ★              ┃"
echo -e "┃               Android Edition                   ┃"
echo -e "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛${RESET}"

sleep 0.5

echo -e "${GREEN}"
echo "    ████████╗██████╗   ██████╗   ████████╗"
echo "    ╚══██╔══╝██╔══██╗  ██╔══██╗  ╚══██╔══╝"
echo "       ██║   ██████╔╝  ██████╔╝     ██║  " 
echo "       ██║   ██╔══██╗  ██╔══██╗     ██║   "
echo "       ██║   ██║  ██║  ██║  ██║     ██║   "
echo "       ╚═╝   ╚═╝  ╚═╝  ╚═╝  ╚═╝     ╚═╝"
echo "       Termux - Root - Recovery - Tool"
echo -e "${RESET}"

sleep 2

echo -e "${YELLOW}* ♻️ Initializing environment...${RESET}"
sleep 0.4
echo -e "${YELLOW}* 🔍Checking Termux environment...${RESET}"
sleep 0.4
echo -e "${YELLOW}* ⚙️ Preparing ADB/Fastboot interface...${RESET}"
sleep 0.4
echo -e "${YELLOW}* ⏳Loading UI Engine...${RESET}"
sleep 0.4

echo -e "\n${CYAN}Loading Repair A2Z Presents...${RESET}"
echo -e "\n${CYAN}*Termux Root Recovery Tool*....${RESET}"


for i in 10 25 40 55 70 85 100; do
    bars=$((i/5))
    printf "["
    for ((j=0; j<bars; j++)); do printf "█"; done
    for ((j=bars; j<20; j++)); do printf " "; done
    printf "] ${i}%%\r"
    sleep 0.15
done
echo
sleep 0.5

echo -e "${CYAN}┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓"
echo -e "┃  Developed By : Repair A2Z                      ┃"
echo -e "┃  YouTube      : @repaira2z                      ┃"
echo -e "┃  Instagram    : dineshpatel43642                ┃"
echo -e "┃  Telegram     : RepairA2Z / group               ┃"
echo -e "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛${RESET}"

sleep 2


# ============================================================
# START MENU (FROM start.sh)
# ============================================================
start_menu() {
  while true; do
    clear
    echo -e "\033[1;36m
╔═══════════════════════════════════════════════╗
║  \033[1;33m★ \033[1;37mTermux Root Recovery Tool By Repair-A2Z\033[1;33m★\033[1;36m   ║
╠═══════════════════════════════════════════════╣
║       \033[1;95mWelcome — Choose an option to begin\033[1;36m     ║
╚═══════════════════════════════════════════════╝
\033[0m"

    echo -e "\033[1;34m┌──────────────────────────────────────────────┐\033[0m"
    echo -e "\033[1;34m│ \033[1;37m1. \033[1;92mStart Check All Requirements & Lunch Tool \033[1;34m│\033[0m"
    echo -e "\033[1;34m│ \033[1;37m2. \033[1;92mLaunch Tool Main Menu                     \033[1;34m│\033[0m"
    echo -e "\033[1;34m│ \033[1;37m3. \033[1;92mAbout Developer                           \033[1;34m│\033[0m"
    echo -e "\033[1;34m│ \033[1;37m4. \033[1;91mExit                                      \033[1;34m│\033[0m"
    echo -e "\033[1;34m└──────────────────────────────────────────────┘\033[0m"

    read -p $'\033[1;36mChoice: \033[0m' start_choice

    case "$start_choice" in
      1)
        echo "Checking requirements..."
        sleep 1
        ./fixall.sh
        ;;

      2)
        echo "Launching Main Menu..."
        sleep 1
        ./flash.sh
        ;;

      3)
        # ------------------ ABOUT MENU ---------------------
        while true; do
          clear
          echo -e "\033[1;36m
╔═══════════════════════════════════════════════╗
║          \033[1;33m★ Repair A2Z - About ★\033[1;36m               ║
╚═══════════════════════════════════════════════╝
\033[0m"

          echo -e "\033[1;34m┌──────────────────────────────────────────────┐\033[0m"
          echo -e "\033[1;34m│ \033[1;37m1. \033[1;92mYouTube - Repair A2Z                      \033[1;34m│\033[0m"
          echo -e "\033[1;34m│ \033[1;37m2. \033[1;92mYouTube Mix                               \033[1;34m│\033[0m"
          echo -e "\033[1;34m│ \033[1;37m3. \033[1;92mInstagram                                 \033[1;34m│\033[0m"
          echo -e "\033[1;34m│ \033[1;37m4. \033[1;92mFacebook                                  \033[1;34m│\033[0m"
          echo -e "\033[1;34m│ \033[1;37m5. \033[1;92mTelegram Channel                          \033[1;34m│\033[0m"
          echo -e "\033[1;34m│ \033[1;37m6. \033[1;92mTelegram Group                            \033[1;34m│\033[0m"
          echo -e "\033[1;34m│ \033[1;37m7. \033[1;91mBack                                      \033[1;34m│\033[0m"
          echo -e "\033[1;34m└──────────────────────────────────────────────┘\033[0m"

          read -p $'\033[1;36mChoose: \033[0m' ab

          case "$ab" in
            1) open_url "https://youtube.com/@repaira2z" ;;
            2) open_url "https://youtube.com/@repaira2zmix" ;;
            3) open_url "https://www.instagram.com/dineshpatel43642" ;;
            4) open_url "https://m.facebook.com/Dines" ;;
            5) open_url "https://t.me/RepairA2Z" ;;
            6) open_url "https://t.me/repaira2zgroup" ;;
            7) break ;;
            *)
              echo -e "\033[1;33mInvalid option!\033[0m"
              sleep 1
              ;;
          esac
        done
        ;;

      4)
        echo -e "\033[1;32mGoodbye Thanks You For Using Tool !\033[0m"
        exit 0
        ;;

      *)
        echo -e "\033[1;33mInvalid choice!\033[0m"
        sleep 1
        ;;
    esac
  done
}

# ==========================================
# RUN FINAL MENU
# ==========================================
start_menu