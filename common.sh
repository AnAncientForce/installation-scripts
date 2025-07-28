function install_yay() {
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
}
