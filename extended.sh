source ${HOME}/$SCRIPTHOME/setup.conf

# Install AUR helper
cd ~
git clone "https://aur.archlinux.org/$aur_helper-bin.git"
cd ${HOME}/$aur_helper-bin
makepkg -si --noconfirm
cd ${HOME}/$SCRIPTHOME

# Install AUR packages
$aur_helper -S --noconfirm --needed - < ${HOME}/$SCRIPTHOME/pkg-files/aur-pkgs.txt
