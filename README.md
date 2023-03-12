# ArchConfig
All-in-one repo to fully setup my Arch config with i3 window manager

Before running any scripts, you can speed up the process by enabling parallel downloads in Pacman. To do so, open the file '/etc/pacman.conf' and uncomment/change this line (ex. 5):
```
ParallelDownloads = X
```

---

**Scripts must be ran from a subfolder one-level deep in the home directory!**
**(ex. *~/ArchConfig/install_config.sh*)**
**Don't run as root, you will be prompted for a sudo password when running the script**

## install_config.sh
Fully installs and configures i3wm and related desktop environment stuff.

## install_apps.sh
Installs multiple day-to-day apps that I would eventually have to install sooner or later.
