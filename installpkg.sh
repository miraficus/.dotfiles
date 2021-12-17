#!/bin/bash


#Colors
#Black        0;30     Dark Gray     1;30
#Red          0;31     Light Red     1;31
#Green        0;32     Light Green   1;32
#Brown/Orange 0;33     Yellow        1;33
#Blue         0;34     Light Blue    1;34
#Purple       0;35     Light Purple  1;35
#Cyan         0;36     Light Cyan    1;36
#Light Gray   0;37     White         1;37

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

#Check for package manger
declare -A osInfo;
osInfo[/etc/redhat-release]=yum
osInfo[/etc/arch-release]=pacman
osInfo[/etc/gentoo-release]=emerge
osInfo[/etc/SuSE-release]=zypp
osInfo[/etc/debian_version]=apt-get

for f in ${!osInfo[@]}
do
    if [[ -f $f ]];then
        echo -e "Package manager:${BLUE} ${osInfo[$f]}${NC}\n"
        if [[ ${osInfo[$f]} = pacman ]]; then
            echo -e "${GREEN}Installing packages!${NC}\n"
            sudo pacman --needed --ask 4 -Sy - < pkglist.txt
            paru -S arcolinux-wallpapers-git ttf-ms-fonts sublime-text-4 vscodium

        else
            echo -e "${RED}Package manager not supported!${NC}"
        fi
    fi
done
