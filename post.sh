source ./setup.conf

# Snapper
if $snapper_choice
    then
        sudo umount /.snapshots/
        sudo rm -rf /.snapshots/
        sudo snapper -c root create-config /
        sudo sed -i 's/^ALLOW_USERS=""/ALLOW_USERS="$username"/' /etc/snapper/configs/root
        sudo sed -i 's/^TIMELINE_LIMIT_YEARLY="10"/TIMELINE_LIMIT_YEARLY="0"/' /etc/snapper/configs/root
        sudo sed -i 's/^TIMELINE_LIMIT_MONTHLY="10"/TIMELINE_LIMIT_MONTHLY="4"/' /etc/snapper/configs/root
        sudo sed -i 's/^TIMELINE_LIMIT_WEEKLY="0"/TIMELINE_LIMIT_WEEKLY="7"/' /etc/snapper/configs/root
        sudo sed -i 's/^TIMELINE_LIMIT_DAILY="10"/TIMELINE_LIMIT_DAILY="8"/' /etc/snapper/configs/root
        sudo sed -i 's/^TIMELINE_LIMIT_HOURLY="10"/TIMELINE_LIMIT_HOURLY="5"/' /etc/snapper/configs/root

        sudo chmod a+rx /.snapshots/

        sudo systemctl start snapper-timeline.timer
        sudo systemctl enable snapper-timeline.timer

        sudo systemctl start snapper-cleanup.timer
        sudo systemctl enable snapper-cleanup.timer

        sudo snapper -c root create -c timeline --description AfterInstall
fi

# Remove source files from root directory
sudo rm -rf /$SCRIPTHOME/

# Configure Kitty — make sure to open Kitty first!
cp ./dotfiles/kitty/kitty.conf ~/.config/kitty/kitty.conf
cp ./dotfiles/kitty/theme.conf ~/.config/kitty/theme.conf

# Set fish as default shell
echo "exec fish" >> ~/.bashrc
sed -i 's/# Commands to run in interactive sessions can go here/neofetch/' ~/.config/fish/config.fish

# Install and configure Oh-My-Fish
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish

# Remember to manually edit and configure your SDDM theme!
