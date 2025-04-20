#!/data/data/com.termux/files/usr/bin/bash

clear
echo -e "\033[1;36m
╔═══════════════════════════════════════════════╗
║  \033[1;33m★ \033[1;37mTermux Root Recovery Tool \033[1;33m★\033[1;36m             ║
╠═══════════════════════════════════════════════╣
║  \033[1;92mADB & Fastboot Installation\033[1;36m                 ║
╚═══════════════════════════════════════════════╝
\033[0m"

echo -e "\033[1;35m╭───────────────────────────────────────────────╮\033[0m"
echo -e "\033[1;35m│\033[1;33m           Installation Progress               \033[1;35m│\033[0m"
echo -e "\033[1;35m╰───────────────────────────────────────────────╯\033[0m"

echo -e "\033[1;92m► Checking for package updates... \033[0m"
upgradable_packages=$(apt list --upgradable 2>/dev/null | wc -l)
if [ "$upgradable_packages" -gt 1 ]; then
    echo -e "\033[1;33m⚡ Updating and upgrading packages... \033[0m"
    yes | apt update && yes | apt upgrade
    echo -e "\033[1;32m✓ Packages updated successfully! \033[0m"
else
    echo -e "\033[1;32m✓ No package updates required! \033[0m"
fi

echo -e "\033[1;92m► Checking for ADB and Fastboot... \033[0m"
if ! command -v adb &>/dev/null || ! command -v fastboot &>/dev/null; then
    echo -e "\033[1;33m⚡ Installing ADB and Fastboot... \033[0m"
    yes | pkg uninstall termux-adb 2>/dev/null
    curl -s https://raw.githubusercontent.com/nohajc/termux-adb/master/install.sh | bash
    ln -s $PREFIX/bin/termux-fastboot $PREFIX/bin/fastboot
    ln -s $PREFIX/bin/termux-adb $PREFIX/bin/adb
    echo -e "\033[1;32m✓ ADB and Fastboot installed successfully! \033[0m"
else
    echo -e "\033[1;32m✓ ADB and Fastboot are already installed! \033[0m"
fi

echo -e "\033[1;36m
╔═══════════════════════════════════════════════╗
║  \033[1;32m✓ Installation Complete! \033[1;36m                   ║
║  \033[1;97mRun './flash.sh' to start the tool\033[1;36m          ║
╚═══════════════════════════════════════════════╝
\033[0m"