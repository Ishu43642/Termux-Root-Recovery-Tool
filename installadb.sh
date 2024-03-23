#!/data/data/com.termux/files/usr/bin/bash

upgradable_packages=$(apt list --upgradable 2>/dev/null | wc -l)
if [ "$upgradable_packages" -gt 1 ]; then
    yes | apt update && yes | apt upgrade
fi

if ! command -v adb &>/dev/null || ! command -v fastboot &>/dev/null; then
    echo "Installing ADB and Fastboot..."
    yes | pkg uninstall termux-adb 2>/dev/null
    curl -s https://raw.githubusercontent.com/nohajc/termux-adb/master/install.sh | bash
    ln -s $PREFIX/bin/termux-fastboot $PREFIX/bin/fastboot
    ln -s $PREFIX/bin/termux-adb $PREFIX/bin/adb
fi