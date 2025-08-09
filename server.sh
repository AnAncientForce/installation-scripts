source common.sh

echo "Starting"

install_yay

sudo pacman -S rocm-smi-lib btop docker tailscale yt-dlp fdupes wget shfmt fastfetch tmux ranger git

yay -S gallery-dl

read -p "shell exports? (y/n) " answer
if [ "$answer" = "y" ]; then
    echo 'alias cmd="~/mnt/a/scripts/cmd.sh"' >>~/.bashrc
    echo 'fastfetch' >>~/.bashrc
    source ~/.bashrc
fi

sudo cp etc/samba/smb.conf /etc/samba/smb.conf
sudo cp etc/ssh/sshd_config /etc/ssh/sshd_config

read -p "Set a password for smb? (y/n) " answer
if [ "$answer" = "y" ]; then
    echo "You will now be prompted"
    sudo smbpasswd -a z
fi

read -p "Enable Services? (y/n) " answer
if [ "$answer" = "y" ]; then
    sudo systemctl enable --now smb
    sudo systemctl enable --now docker
    sudo systemctl enable --now tailscaled
fi

echo "CHECK ~ Is everything okay? ~ CHECK"

sudo systemctl status smb
sudo systemctl status docker
sudo systemctl status tailscaled

echo "Finished"
