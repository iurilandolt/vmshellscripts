pacman -Syu

pacman -S --noconfirm xf86-video-fbdev #xf86-video-vmware xf86-video-qxl xf86-video-sisusb

pacman -S --noconfirm alsa-utils pulseaudio-alsa pulseaudio-equalizer
mkdir -p /etc/pulse/default.pa.d
echo "unload-module module-role-cork" >> /etc/pulse/default.pa.d/no-cork.pa

#https://archlinux.org/groups/x86_64/xorg/
#https://archlinux.org/groups/x86_64/xorg-drivers/
pacman -S --noconfirm xorg-server xorg-xinit xorg-xkill xorg-xsetroot xorg-xbacklight xorg-xprop \
	xorg-xrandr xorg-xfontsel xorg-xlsfonts xorg-xinput xorg-xwininfo libx11 libxinerama libxft

pacman -S --noconfirm vim

git clone https://git.suckless.org/dwm ~/.config/dwm
git clone https://git.suckless.org/st ~/.config/st

sudo make -C  ~/.config/dwm clean install
sudo make -C  ~/.config/st clean install
sed -i 's/"\/bin\/sh"/"\/usr\/local\/bin\/st"/' ~/.config/st/config.h

cat /etc/X11/xinit/xinitrc > ~/.xinitrc
echo "exec dwn" >> ~/.xinitrc

#echo "startx" >> ~/.bash_profile
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# https://www.youtube.com/watch?v=SRqVuAUP2N0&ab_channel=BugsWriter
# https://arch.d3sox.me/installation/install-desktop
