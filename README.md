# ArchConfig
All-in-one repo to fully setup my Arch config with i3 window manager

Before running any scripts, you can speed up the process by enabling parallel downloads in Pacman. To do so, open the file '/etc/pacman.conf' and uncomment/change this line (ex. 5):
```
ParallelDownloads = X
```

---

**Scripts must be ran from a subfolder one-level deep in the home directory!**

**(ex. *~/ArchConfig/install_config.sh*)**

## install_config.sh
**Don't run as root, you will be prompted for a sudo password when running the script**

Fully installs and configures i3wm and related desktop environment stuff.

## install_config_files.sh
**_MUST_ be run as root, you will be also be prompted for your user password when running the script**

Installs multiple configuration files, primarily dotfiles.

## install_apps.sh
Installs multiple day-to-day apps that I would eventually have to install sooner or later.


---

Once you're done running the scripts. Restart your machine and select i3 from the display manager. Once in, verify you can open rofi (Win+D) and a terminal (Win+Enter).

There is a chance the *'lightdm-mini-greeter'* isn't working, haven't tested yet but it isn't working in my VM. I also can't easily verify the cursor theme is working properly, so that may not be working either..!

Finally, if you don't want picom (or it's causing issues), open a terminal (Win+Enter) and type *'pkill picom'*. Open *~/.config/i3/config* and remove the line that starts picom.
```
exec --no-startup-id picom -b --config ~/.config/picom/picom.conf
```
