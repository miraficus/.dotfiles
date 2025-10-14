#!/bin/bash

echo "🔧 Instalace KDE Plasma..."
sudo apt update
sudo apt install -y kde-plasma-desktop

echo ""
read -p "❓ Chceš použít LightDM jako správce přihlášení? (ano/a/y/ne/n): " use_lightdm
use_lightdm=$(echo "$use_lightdm" | tr '[:upper:]' '[:lower:]')

if [[ "$use_lightdm" == "ano" || "$use_lightdm" == "a" || "$use_lightdm" == "y" ]]; then
    echo ""
    read -p "👤 Zadej uživatelské jméno pro automatické přihlášení: " autologin_user

    echo "🧩 Instalace LightDM..."
    sudo apt install -y lightdm lightdm-gtk-greeter

    echo "🔒 Nastavení automatického přihlášení do KDE pro uživatele '$autologin_user'..."
    sudo sed -i "/^\[Seat:\*\]/a autologin-user=$autologin_user\nautologin-session=plasma" /etc/lightdm/lightdm.conf

    echo ""
    read -p "❓ Chceš nainstalovat XFCE jako záložní prostředí? (ano/a/y/ne/n): " install_xfce
    install_xfce=$(echo "$install_xfce" | tr '[:upper:]' '[:lower:]')

    if [[ "$install_xfce" == "ano" || "$install_xfce" == "a" || "$install_xfce" == "y" ]]; then
        echo "🌈 Instalace XFCE4..."
        sudo apt install -y xfce4 xfce4-goodies
        echo "✅ XFCE bude dostupné při přihlášení přes LightDM."
    fi

    echo "✅ KDE Plasma + LightDM nastaveno. Po restartu se automaticky přihlásíš do KDE jako '$autologin_user'."
else
    echo ""
    read -p "👤 Zadej uživatelské jméno pro automatické přihlášení do konzole: " autologin_user

    echo "🔒 Nastavení automatického loginu do konzole pro '$autologin_user'..."
    sudo mkdir -p /etc/systemd/system/getty@tty1.service.d
    echo "[Service]
ExecStart=
ExecStart=-/sbin/agetty --autologin $autologin_user --noclear %I \$TERM" | sudo tee /etc/systemd/system/getty@tty1.service.d/autologin.conf

    echo "🚀 Nastavení KDE Plasma pro automatický start bez login manageru..."
    sudo -u $autologin_user bash -c 'echo "exec startplasma-x11" > ~/.xinitrc'

    if ! sudo -u $autologin_user grep -q "startx" /home/$autologin_user/.bash_profile 2>/dev/null; then
        sudo -u $autologin_user bash -c 'echo "" >> ~/.bash_profile'
        sudo -u $autologin_user bash -c 'echo "if [ -z \"\$DISPLAY\" ] && [ \"\$(tty)\" = \"/dev/tty1\" ]; then" >> ~/.bash_profile'
        sudo -u $autologin_user bash -c 'echo "  startx" >> ~/.bash_profile'
        sudo -u $autologin_user bash -c 'echo "fi" >> ~/.bash_profile'
    fi

    echo "✅ KDE Plasma bude spuštěno automaticky po bootu bez nutnosti přihlášení."
fi

echo ""
echo "🎉 Hotovo! Restartuj Raspberry Pi pro aplikaci změn."
