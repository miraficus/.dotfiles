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
Rofi: 
```sh 
rofi -show drun -show-icons -theme Arc-Dark 
```
In Gnome add ` -normal-window ` flag for it to work.


## Switch Login Manager
```sh
sudo systemctl disable lightdm
sudo systemctl enable sddm
```
# Links
## Custom Themes 
* [Nordic](https://github.com/EliverLara/Nordic)
* [Dracula](https://github.com/dracula/gtk)

## Grub Themes
* [Distro Grub Themes](https://www.gnome-look.org/p/1482847)
* [Xenlism](https://www.gnome-look.org/p/1440862)

## Icons
* [Papirus](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme)

## Login Manager theme
* [Sddm Sugar Dark](https://github.com/MarianArlt/sddm-sugar-dark)

## Cool Fonts
- [Exo](https://www.fontsquirrel.com/fonts/exo)
- [Share Tech Mono](https://fonts.google.com/specimen/Share+Tech+Mono)

## Programs
- [GithubDesktop](https://github.com/shiftkey/desktop/releases)

# Notes

* pkglist.txt contains packagage that i use on arch linux
* aurpkglist.txt contains packages from aur
