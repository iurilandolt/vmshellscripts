#part2
loadkeys br-latin1-abnt2
pacman -S --noconfirm sed
sed -i "s/^#Color$/Color/" /etc/pacman.conf
sed -i "s/^#VerbosePkgLists$/VerbosePkgLists/" /etc/pacman.conf
sed -i "s/^#ParallelDownloads = 5$/ParallelDownloads = 15/" /etc/pacman.conf
sed -i "s/^#[[]multilib[]]$/[multilib]/" /etc/pacman.conf
sed -i "s/^#Include = \/etc\/pacman\.d\/mirrorlist$/Include = \/etc\/pacman\.d\/mirrorlist/" /etc/pacman.conf
pacman -Sy

ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime
hwclock --systohc
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
export	LANG=en_US.UTF-8
echo "KEYMAP=br-latin1-abnt2" > /etc/vconsole.conf
export	KEYMAP=br-latin1-abnt2
echo "Hostname: "
read hostname
echo $hostname > /etc/hostname
echo "127.0.0.1       localhost" >> /etc/hosts
echo "::1             localhost" >> /etc/hosts
echo "127.0.1.1       $hostname.localdomain $hostname" >> /etc/hosts
mkinitcpio -P
echo "passwd for root: "
passwd

grub-install --target=x86_64-efi --bootloader-id=grub_uefi --efi-directory=/boot/efi --recheck
grub-mkconfig -o /boot/grub/grub.cfg

pacman -S --noconfirm zsh nano
#	xorg-server xorg-xinit xorg-xrandr xorg-xfontsel \
#	xorg-xlsfonts xorg-xkill xorg-xinput xorg-xwininfo \
#	linux-headers dkms jshon expac git wget acpid avahi \
#	net-tools xdg-user-dirs vulkan-icd-loader lib32-vulkan-icd-loader \
#	mesa lib32-mesa libva-mesa-driver lib32-libva-mesa-driver \
#	mesa-vdpau lib32-mesa-vdpau libva-vdpau-driver lib32-libva-vdpau-driver \
#	vulkan-radeon lib32-vulkan-radeon xz \
#	alsa-utils pulseaudio-alsa pulseaudio-equalizer

#systemctl enable connman.service acpid avahi-daemon systemd-timesyncd

#mkdir -p /etc/pulse/default.pa.d
#echo "unload-module module-role-cork" >> /etc/pulse/default.pa.d/no-cork.pa

#echo "Enter Username: "
#read username
#useradd -m -G audio,video,input,wheel,sys,log,rfkill,lp,adm -s /bin/zsh $username
#echo "passwd for $username: "
#passwd $username

sed -i "s/^#% wheel ALL=(ALL) ALL$/%wheel ALL=(ALL) ALL/" /etc/sudoers
sed -i "s/^#% sudo ALL=(ALL) ALL$/%sudo ALL=(ALL) ALL/" /etc/sudoers



echo "Pre-Installation Finish Reboot now ut first"



