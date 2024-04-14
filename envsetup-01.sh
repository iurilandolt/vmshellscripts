#pacman -Syu

#pacman -S --noconfirm libva-mesa-driver lib32-libva-mesa-driver mesa-vdpau \
#	lib32-mesa-vdpau libva-vdpau-driver lib32-libva-vdpau-driver vulkan-radeon \
#	lib32-vulkan-radeon mesa lib32-mesa vulkan-icd-loader lib32-vulkan-icd-loader

#pacman -S --noconfirm alsa-utils pulseaudio-alsa pulseaudio-equalizer
#mkdir -p /etc/pulse/default.pa.d
#echo "unload-module module-role-cork" >> /etc/pulse/default.pa.d/no-cork.pa

#pacman -S --noconfirm xorg-server xorg-xinit xorg-xkill xorg-xsetroot xorg-xbacklight xorg-xprop \
#	xorg-xrandr xorg-xfontsel xorg-xlsfonts xorg-xinput xorg-xwininfo libx11 libxinerama libxft \
#	webkit2gtk

#pacman -S --noconfirm vim

git clone https://git.suckless.org/dwm /tmp/dwm
git clone https://git.suckless.org/st /tmp/st

sudo make -C  /tmp/dwm clean install
sudo make -C  /tmp/st clean install
sed -i 's/"\/bin\/sh"/"\/usr\/local\/bin\/st"/'


#echo "exec dwn" >> ~/.xinitrc
#sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

