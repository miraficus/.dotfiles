# .dotfiles
My personal dotfiles. I made this for myself and it is not guaranteed to work properly.

## Installing
Copy dotfiles manualy.

## Wallpapers
I backed up my collection of wallpapers on dropbox. Use `wget` to download those files and then `unzip` to extract those files to /usr/share/backgrounds.

Wallpapers found on google pictures:
```sh
wget -O from-google.zip https://www.dropbox.com/sh/jwpk6j30kf27uie/AAD2ql1Lt_4vTmNc93nnOOxoa?dl=1
sudo unzip from-google.zip -d /usr/share/backgrounds/from-google
rm from-google.zip
```

Wallpapers from Windows Spotlight (Downloaded with [BilderGUI](https://github.com/NietroMiner00/BilderGui):
```sh
wget -O from-spotlight.zip https://www.dropbox.com/sh/nqb0yj9uv1vibci/AAAAgY7YDVB0RgqSfkMaDqICa?dl=1
sudo unzip from-spotlight.zip -d /usr/share/backgrounds/from-spotlight
rm from-spotlight.zip
```

## Program Launch commands
### Rofi: 
```sh 
rofi -show drun -show-icons -theme Arc-Dark -click-to-exit
```
In Gnome add ` -normal-window -[no-]steal-focus` flag for it to work.

### Alacritty:
- Font too big on my laptop.
```sh
alacritty -o font.size=6
```

### Steam:
-Launch Steam minimized and replace 'Big Picture Mode' with 'Steamdeck Mode'
```sh
steam -gamepadui -nochatui -nofriendsui -silent
```

## Switch Login Manager
```sh
sudo systemctl disable lightdm
sudo systemctl enable sddm
```
# Links
## Custom Themes 
### Whole
- [Dracula](https://github.com/dracula/gtk)
- [Solarized](https://ethanschoonover.com/solarized/)
- [Nord](https://www.nordtheme.com/ports)

### GTK
- [TokyoNight](https://github.com/Fausto-Korpsvart/Tokyo-Night-GTK-Theme)
- [Nordic](https://github.com/EliverLara/Nordic)

### Website
- [Themer](https://themer.dev/)

## Grub Themes
- [Distro Grub Themes](https://www.gnome-look.org/p/1482847)
- [Xenlism](https://www.gnome-look.org/p/1440862)

## Icons
- [Papirus](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme)
- [Kora](https://github.com/bikass/kora)

## Login Manager
- [LightDM GUI Settings Editor](https://github.com/Xubuntu/lightdm-gtk-greeter-settings)

## Cool Fonts
- [Nerdfonts](https://www.nerdfonts.com/font-downloads)
- [Share Tech Mono](https://fonts.google.com/specimen/Share+Tech+Mono)
- [Sen](https://github.com/philatype/Sen)

## Programs
- [GithubDesktop](https://github.com/shiftkey/desktop/releases)
- [Starship Prompt](https://starship.rs/)
- [Nix](https://nixos.org/download.html#nix-install-linux)
- [MultiMC](https://multimc.org/#Download)

## How To
- [Wireguard](https://www.cyberciti.biz/faq/debian-10-set-up-wireguard-vpn-server/)
- [Wireguard Client](https://wireguard.how/client/ios/)
- [UFW](https://www.cyberciti.biz/faq/ubuntu-22-04-lts-set-up-ufw-firewall-in-5-minutes/?utm_source=Linux_Unix_Command&utm_medium=faq&utm_campaign=nixcmd)

## Server
### Installer
- [OVPN](https://github.com/angristan/openvpn-install)

# Notes

* pkglist.txt contains packagage that i use on arch linux
* aurpkglist.txt contains packages from aur
