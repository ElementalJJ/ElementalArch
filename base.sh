source ./setup.conf

# Enable parallel downloading
sed -i 's/^#Para/Para/' /etc/pacman.conf

# Enable multilib
sed -i "/\[multilib\]/,/Include/"'s/^#//' /etc/pacman.conf

# Find optimal mirrors with Reflector
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup

iso=$(curl -4 ifconfig.co/country-iso)
reflector -a 48 -c $iso -f 5 -l 20 -p https --sort rate --save /etc/pacman.d/mirrorlist

# Update system
pacman -Syu --noconfirm

# Install Pacman Packages
pacman -S --noconfirm --needed - < ./pkg-files/pacman-pkgs.txt

# Account creation
useradd -m -G wheel $username
echo $username:$password | chpasswd

cp -R . /home/$username/$SCRIPTHOME
chmod +rx /home/$username/$SCRIPTHOME/*

# Update sudo/wheel group priviledges for AUR helper installation
sed -i 's/^# %wheel ALL=(ALL) NOPASSWD: ALL/%wheel ALL=(ALL) NOPASSWD: ALL/' /etc/sudoers
