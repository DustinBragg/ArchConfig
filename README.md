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
Fully installs and configures i3wm and related desktop environment stuff.

## install_config_files.sh
Installs multiple configuration files, primarily dotfiles.

## install_apps.sh
Installs multiple day-to-day apps that I would eventually have to install sooner or later.

## install_eluk_mag_15_additional.sh
Installs additional things for an Eluktronics MAG-15 laptop. Battery/volume icons, power management, keybinds for brightness/volume, etc.


---

Once you're done running the scripts. Restart your machine and you should be greeted with the *'lightdm-mini-greeter'*. Once logged in, verify you can open rofi (Win+D) and a terminal (Win+Enter).

There is a chance the *'lightdm'* isn't working, in which case you need to enable the service manually: *'sudo systemctl enable lightdm.service -f'*. There is also a chance the cursor theme isn't working everywhere, I haven't figured this out yet..!

Finally, if you don't want picom (or it's causing issues), open a terminal (Win+Enter) and type *'pkill picom'*. Open *~/.config/i3/config* and remove the line that starts picom.
```
exec --no-startup-id picom -b --config ~/.config/picom/picom.conf
```
