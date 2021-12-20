# .dotfiles
My personal dotfiles. I made this for myself and it is not properly tested.

## Installing
Install paru from aur and then use `./installpkg.sh` to install needed packages on Arch based distributions.
Then copy dotfiles manualy.

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
## Icons
* [Papirus](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme)

## Login Manager theme
* [Sddm Sugar Dark](https://github.com/MarianArlt/sddm-sugar-dark)

## Compiz in XFCE4
Im using `paru` to install compiz packages.
```sh
paru -S compiz-gtk ccsm compiz-fusion-plugins-main compiz-fusion-plugins-extra metacity
```
Thenc open `ccsm` and then set:
* In Window Management: Move Window, Place Windows (Placement Mode: centered), Resize Windows
* In utility: Regex Matching, Session Management, Mouse position polling
* In Effects: Animations, Animations Add-on, Windows decoration, Wobbly Windows
* In General: General options (Desktop size tab: Horizontal Virtual Size: 3)

## Notes

* .bashrc and .zshrc are mostly default from arcolinux
