#      __  ____            _____                
#     /  |/  (_)________ _/ __(_)______  _______
#    / /|_/ / / ___/ __ `/ /_/ / ___/ / / / ___/
#   / /  / / / /  / /_/ / __/ / /__/ /_/ (__  ) 
#  /_/  /_/_/_/   \__,_/_/ /_/\___/\__,_/____/  
#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

### Exports
export TERM="xterm-256color"                # getting proper colors
export HISTCONTROL=ignoreboth:erasedups     # no duplicate entries

# Make nano the default editor
export EDITOR='nano'
export VISUAL='nano'


### PROMPT
# This is commented out if using starship prompt
# PS1='[\u@\h \W]\$ '

### PATH
if [ -d "$HOME/.bin" ] ;
  then PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/Applications" ] ;
  then PATH="$HOME/Applications:$PATH"
fi

if [ -d "/var/lib/flatpak/exports/bin/" ] ;
  then PATH="/var/lib/flatpak/exports/bin/:$PATH"
fi

### CHANGE TITLE OF TERMINALS
case ${TERM} in
  xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|alacritty|st|konsole*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'
        ;;
  screen*)
    PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"'
    ;;
esac

### Shoptd
shopt -s autocd # change to named directory
shopt -s cdspell # autocorrects cd misspellings
shopt -s cmdhist # save multi-line commands in history as single line
shopt -s dotglob
shopt -s histappend # do not overwrite history
shopt -s expand_aliases # expand aliases

### EXtractor for all kinds of archives
# usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   tar xf $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

#Ignore upper and lowercase when TAB completion
bind "set completion-ignore-case on"

### Aliases for software management
#Set colors
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
            #echo -e "${GREEN}Using Pacman Aliases${NC}\n"
            #Package manager aliases
            #Fix typo's
            alias udpate='sudo pacman -Syyu'
            alias upate='sudo pacman -Syyu'
            alias updte='sudo pacman -Syyu'
            alias updqte='sudo pacman -Syyu'
            alias upqll="paru -Syu --noconfirm"
            alias upal="paru -Syu --noconfirm"

            #pacman unlock
            alias unlock="sudo rm /var/lib/pacman/db.lck"
            alias rmpacmanlock="sudo rm /var/lib/pacman/db.lck"

            # pacman or pm
            alias pacman='sudo pacman --color auto'
            alias update='sudo pacman -Syyu'

            # paru as aur helper - updates everything
            alias pksyua="paru -Syu --noconfirm"    # update standard pkgs and AUR pkgs
            alias parsua='paru -Sua --noconfirm'    # update only AUR pkgs
            alias upall="paru -Syu --noconfirm"
            alias updateaur="paru -Syu --noconfirm"

            #Cleanup orphaned packages
            alias cleanup='sudo pacman -Rns $(pacman -Qtdq)'

            #switch between lightdm and sddm
            alias tolightdm="sudo pacman -S lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings --noconfirm --needed ; sudo systemctl enable lightdm.service -f ; echo 'Lightm is active - reboot now'"
            alias tosddm="sudo pacman -S sddm --noconfirm --needed ; sudo systemctl enable sddm.service -f ; echo 'Sddm is active - reboot now'"

            #get fastest mirrors in your neighborhood
            alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
            alias mirrord="sudo reflector --latest 30 --number 10 --sort delay --save /etc/pacman.d/mirrorlist"
            alias mirrors="sudo reflector --latest 30 --number 10 --sort score --save /etc/pacman.d/mirrorlist"
            alias mirrora="sudo reflector --latest 30 --number 10 --sort age --save /etc/pacman.d/mirrorlist"

        elif [[ ${osInfo[$f]} = apt-get ]]; then
            #echo -e "${GREEN}Using Apt Aliases${NC}\n"
            #Package manager aliases
            #Fix typo's
            alias udpate='sudo apt update && sudo apt upgrade'
            alias upate='sudo apt update && sudo apt upgrade'
            alias updte='sudo apt update && sudo apt upgrade'
            alias updqte='sudo apt update && sudo apt upgrade'

            #Advanced Package Tool
            alias apt='sudo apt'
            alias update='sudo apt update && sudo apt upgrade'

        elif [[ ${osInfo[$f]} = yum ]]; then
            #echo -e "${GREEN}Using yum Aliases${NC}\n"
            #Package manager aliases
            #Fix typo's
            alias udpate='sudo dnf update -y'
            alias upate='sudo dnf update -y'
            alias updte='sudo dnf update -y'
            alias updqte='sudo dnf update -y'

            #dnf
            alias update='sudo dnf update -y'
            alias dnf='sudo dnf --color auto'

            #yum
            alias yum='sudo yum --color auto'

        else
            echo -e "${RED}Package manager not supported!${NC}"
        fi
    fi
done

#nix
function nixsearch { nix-env -qaP | grep "$1"; } # use nixsearch 'package'
function nixfix { ln -s /home/$USER/.nix-profile/share/applications/* /home/$USER/.local/share/applications/; } # fix apps not showing up in start menu or rofi/dmenu
function nixinstall { nix-env -iA "$1"; } # use nixinstall 'nixpkgs.package'
function nixremove { nix-env -e "$1"; }
alias nixinstalled='nix-env -q' # lists installed packages
alias nixupdate='nix-env -u' # updates all packages or specified package
function nixinstallitself { curl -L https://nixos.org/nix/install | sh; } # install nix

#list
alias ls='ls --color=auto'
alias la='ls -a'
alias ll='ls -la'
alias l='ls'
alias l.="ls -A | egrep '^\.'"

alias exaa='exa -lah'
alias exah='exa -lh'

#fix obvious typo's
alias cd..='cd ..'
alias pdw="pwd"

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

## Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

#readable output
alias df='df -h'
alias free='free -m'                      # show sizes in MB

#continue download
alias wget="wget -c"

#userlist
alias userlist="cut -d: -f1 /etc/passwd"

#grub update
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"

#add new fonts
alias update-fc='sudo fc-cache -fv'

#quickly kill conkies
alias kc='killall conky'

#hardware info --short
alias hw="hwinfo --short"

#skip integrity check
alias yayskip='yay -S --mflags --skipinteg'
alias trizenskip='trizen -S --skipinteg'

#check vulnerabilities microcode
alias microcode='grep . /sys/devices/system/cpu/vulnerabilities/*'

# Play video files in current dir by type
alias playavi='vlc *.avi'
alias playmov='vlc *.mov'
alias playmp4='vlc *.mp4'

#youtube-dl
alias yta-aac="youtube-dl --extract-audio --audio-format aac "
alias yta-best="youtube-dl --extract-audio --audio-format best "
alias yta-flac="youtube-dl --extract-audio --audio-format flac "
alias yta-m4a="youtube-dl --extract-audio --audio-format m4a "
alias yta-mp3="youtube-dl --extract-audio --audio-format mp3 "
alias yta-opus="youtube-dl --extract-audio --audio-format opus "
alias yta-vorbis="youtube-dl --extract-audio --audio-format vorbis "
alias yta-wav="youtube-dl --extract-audio --audio-format wav "

alias ytv-best="youtube-dl -f bestvideo+bestaudio "

#Recent Installed Packages
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"
alias riplong="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -3000 | nl"

#search content with ripgrep
alias rg="rg --sort path"

#get the error messages from journalctl
alias jctl="journalctl -p 3 -xb"

#nano for important configuration files
#know what you do in these files
alias nlightdm="sudo $EDITOR /etc/lightdm/lightdm.conf"
alias npacman="sudo $EDITOR /etc/pacman.conf"
alias ngrub="sudo $EDITOR /etc/default/grub"
alias nconfgrub="sudo $EDITOR /boot/grub/grub.cfg"
alias nmkinitcpio="sudo $EDITOR /etc/mkinitcpio.conf"
alias nmirrorlist="sudo $EDITOR /etc/pacman.d/mirrorlist"
alias nsddm="sudo $EDITOR /etc/sddm.conf"
alias nfstab="sudo $EDITOR /etc/fstab"
alias nnsswitch="sudo $EDITOR /etc/nsswitch.conf"
alias nsamba="sudo $EDITOR /etc/samba/smb.conf"
alias nb="$EDITOR ~/.bashrc"
alias nz="$EDITOR ~/.zshrc"

#gpg
#verify signature for isos
alias gpg-check="gpg2 --keyserver-options auto-key-retrieve --verify"
alias fix-gpg-check="gpg2 --keyserver-options auto-key-retrieve --verify"
#receive the key of a developer
alias gpg-retrieve="gpg2 --keyserver-options auto-key-retrieve --receive-keys"
alias fix-gpg-retrieve="gpg2 --keyserver-options auto-key-retrieve --receive-keys"
alias fix-key="[ -d ~/.gnupg ] || mkdir ~/.gnupg ; cp /etc/pacman.d/gnupg/gpg.conf ~/.gnupg/ ; echo 'done'"

#systeminfo
alias probe="sudo -E hw-probe -all -upload"

#shutdown or reboot
alias ssn="sudo shutdown now"
alias shutdown="sudo shutdown"
alias sr="sudo reboot"
alias reboot="sudo reboot"

#give the list of all installed desktops - xsessions desktops
alias xd="ls /usr/share/xsessions"

# Pastebins
alias tb="nc termbin.com 9999"    #Termbin Usage: (echo just testing! | tb)
alias ix="curl -F 'f:1=<-' ix.io" #IX Usage: (echo just testing! | ix)
#Fix this shit later:   function 0x0 { curl -F'file=@"$1"' https://0x0.st; } # 0x0 Usage: 0x0 image.png

#create a file called .bashrc-personal and put all your personal aliases

[[ -f ~/.bashrc-personal ]] && . ~/.bashrc-personal

# reporting tools
neofetch

eval "$(starship init bash)"


