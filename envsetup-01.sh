#git clone https://aur.archlinux.org.yay-git.git
#cd yay-git/
#makepkg -si
#cd ~

sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

sudo pacman -Syu

sudo pacman -S --noconfirm xf86-video-fbdev picom xorg xorg-xinit

sudo pacman -S --noconfirm vim

mkdir .suckless

cd .suckless

git clone https://git.suckless.org/dwm
git clone https://git.suckless.org/st
git clone https://git.suckless.org/dmenu

make .suckless/dwn
sudo make .suckless/dwn clean install

make .suckless/st
sudo make .suckless/st clean install

make .suckless/dmenu
sudo make .suckless/dmenu clean install

#sed -i 's/"\/bin\/sh"/"\/usr\/local\/bin\/st"/' ~/.srcs/st/config.h

touch .xinitrc
echo "exec /usr/local/bin/dwm" >> ~/.xinitrc

#pacman -S --noconfirm alsa-utils pulseaudio-alsa pulseaudio-equalizer
#mkdir -p /etc/pulse/default.pa.d
#sudo echo "unload-module module-role-cork" >> /etc/pulse/default.pa.d/no-cork.pa

# https://arch.d3sox.me/installation/install-desktop
# https://www.youtube.com/watch?v=6MaTMuFVGck&t=330s&ab_channel=Mashed
# https://gist.github.com/erlendaakre/12eb90eef84a3ab81f7b531e516c9594
