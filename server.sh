source common.sh

echo "Starting"

install_yay

read -p "shell exports? (y/n) " answer
if [ "$answer" = "y" ]; then
    echo 'alias cmd="~/mnt/a/scripts/cmd.sh"' >>~/.bashrc
    echo 'fastfetch' >>~/.bashrc
    source ~/.bashrc
fi

sudo pacman -S rocm-smi-lib btop docker tailscale yt-dlp fdupes wget shfmt fastfetch tmux ranger git

yay -S gallery-dl

sudo systemctl enable --now tailscaled

echo "Finished"
