source common.sh

echo "Starting"

install_yay

read -p "shell exports? (y/n) " answer
if [ "$answer" = "y" ]; then
    echo '(cat $HOME/.config/wpg/sequences &)' >>~/.bashrc
    echo 'export TERM=xterm-256color' >>~/.bashrc
    echo 'alias cmd="~/syncthing/linux/scripts/cmd.sh"' >>~/.bashrc
    source ~/.bashrc
fi

sudo pacman -S hyprshot hyprsunset jp2a kitty mpv noto-fonts ntfs-3g nwg-displays nwg-dock-hyprland nwg-look obs-studio obsidian pavucontrol playerctl ranger shfmt signal-desktop sl sox steam swaync swayosd swww syncthing tailscale thunar ttf-font-awesome ttf-nerd-fonts-symbols udiskie unzip vim vlc wget yt-dlp zip flatpak ollama-cuda thunar-archive-plugin file-roller 7zip tesseract-data-eng ddcutil eog

yay -S anyrun-git emote feishin-bin freetube-bin gallery-dl jellyfin-media-player librewolf-bin peaclock python-pywalfox vesktop-bin visual-studio-code-bin vscodium-bin wpgtk-git python310 python312

mkdir -p ~/.config/wpg/templates
/usr/bin/wpg-install.sh -G -i -d

read -p "Enable Services? (y/n) " answer
if [ "$answer" = "y" ]; then
    sudo systemctl enable --now ollama
    sudo systemctl enable --now bluetooth
    sudo systemctl enable --now tailscaled
    sudo systemctl enable --now swayosd-libinput-backend
fi

read -p "Enable VM Services? (y/n) " answer
if [ "$answer" = "y" ]; then
    # https://christitus.com/setup-qemu-in-archlinux/
    sudo pacman -S qemu virt-manager virt-viewer dnsmasq vde2 bridge-utils openbsd-netcat ebtables iptables libguestfs
    sudo systemctl enable --now libvirtd
    sudo usermod -a -G libvirt $(whoami)
    newgrp libvirt
fi

sudo usermod -a -G uucp $USER

xdg-settings set default-web-browser librewolf.desktop

read -p "Install Roblox? (y/n) " answer
if [ "$answer" = "y" ]; then
    flatpak install flathub org.vinegarhq.Sober
fi

echo "CHECK ~ Is everything okay? ~ CHECK"

sudo systemctl status ollama
sudo systemctl status bluetooth
sudo systemctl status swayosd-libinput-backend

xdg-settings get default-web-browser

echo "Finished"
