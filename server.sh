echo "Starting"

if ! pacman -Qs yay &>/dev/null; then
    sudo pacman -S --needed base-devel git
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
    yay --version
    cd ~
else
    echo "yay is already installed."
fi

read -p "Add cmd.sh alias? (y/n) " answer
if [ "$answer" = "y" ]; then
    echo 'alias cmd="~/mnt/a/scripts/cmd.sh"' >>~/.bashrc
    echo 'fastfetch' >>~/.bashrc
    source ~/.bashrc
fi

sudo pacman -S rocm-smi-lib btop docker tailscale yt-dlp fdupes wget shfmt fastfetch tmux ranger git

yay -S gallery-dl

sudo systemctl enable --now tailscaled

echo "Finished"
