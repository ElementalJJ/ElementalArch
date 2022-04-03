# ElementalArch
A shell script for configuring Arch Linux beyond the default installation.

## Installation
After executing ```arch-chroot``` into the Arch system, ensure ```git``` and ```reflector``` are installed — then, clone this repository and run the ```./elementalarch.sh``` shell script to configure your system:

```bash
pacman -S --noconfirm --needed git reflector
git clone https://github.com/ElementalJJ/ElementalArch.git
cd ElementalArch
./elementalarch.sh
```

Exit ```arch-chroot```, reboot, and enter into the new system. Open ```kitty```, run the ```fish``` command, and change directory into ```/home/ElementalArch```. Then, run ```./post.sh``` to finish configuration of the system.

## Fish Setup
Run the following commands after completing ```./post.sh``` to configure ```fish```:
```fish
omf install archlinux
fish_update_completions
```

## Base System
To install a base system of Arch Linux, and for best results when using this script, use the ```archinstall``` program bundled with the default Arch Linux ISO. Results may vary when configuring and installing the base system a different way.

## Credits
Inspiration taken from [ArchTitus](https://github.com/ChrisTitusTech/ArchTitus), a similar but more extensive script created to install and configure an Arch Linux system.
