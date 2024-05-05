sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://aur.archlinux.org.yay-git.git
cd yay-git/
makepkg -si
cd ~

sudo pacman -Syu

sudo pacman -S --noconfirm xf86-video-fbdev #xf86-video-vmware xf86-video-qxl xf86-video-sisusb

pacman -S --noconfirm alsa-utils pulseaudio-alsa pulseaudio-equalizer
mkdir -p /etc/pulse/default.pa.d
sudo echo "unload-module module-role-cork" >> /etc/pulse/default.pa.d/no-cork.pa

#https://archlinux.org/groups/x86_64/xorg/
#https://archlinux.org/groups/x86_64/xorg-drivers/
sudo pacman -S --noconfirm xorg xorg-xinit nitrogen picom vim

#git clone https://git.suckless.org/dwm ~/.srcs/dwm
#git clone https://git.suckless.org/st ~/.srcs/st

#sudo make -C  ~/.srcs/dwm clean install
#sudo make -C  ~/.srcs/st clean install
#sed -i 's/"\/bin\/sh"/"\/usr\/local\/bin\/st"/' ~/.srcs/st/config.h

#cat /etc/X11/xinit/xinitrc > ~/.xinitrc
#echo "exec dwn" >> ~/.xinitrc

#echo "startx" >> ~/.bash_profile

# https://www.youtube.com/watch?v=SRqVuAUP2N0&ab_channel=BugsWriter
# https://arch.d3sox.me/installation/install-desktop
