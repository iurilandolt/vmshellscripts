#part2
pacman -S --noconfirm grub os-prober efibootmgr dosfstools mtools gptfdisk fatresize
grub-install --target=x86_64-efi --bootloader-id=grub_uefi --efi-directory=/boot/efi --recheck
grub-mkconfig -o /boot/grub/grub.cfg

sed -i "s/^#Color$/Color/" /etc/pacman.conf
sed -i "s/^#VerbosePkgLists$/VerbosePkgLists/" /etc/pacman.conf
sed -i "s/^#ParallelDownloads = 5$/ParallelDownloads = 15/" /etc/pacman.conf
echo "[multilib]" >> /etc/pacman.conf
echo "Include = /etc/pacman.d/mirrorlist" >> /etc/pacman.conf
#sed -i "s/^#[multilib]$/[multilib]/" /etc/pacman.conf
#sed -i "s/^#Include = \/etc\/pacman\.d\/mirrorlist$/Include = \/etc\/pacman\.d\/mirrorlist/" /etc/pacman.conf
echo "%wheel ALL=(ALL:ALL) ALL" >> /etc/sudoers
echo "%sudo ALL=(ALL:ALL) ALL" >> /etc/sudoers

#reflector -c ES -a 15 -p https --sort rate --save /etc/pacman.d/mirrorlist
#pacman --noconfirm -Sy archlinux-keyring
pacman -Syu

loadkeys br-latin1-abnt2
ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime
hwclock --systohc
echo "en_GB.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
echo "LANG=en_GB.UTF-8" > /etc/locale.conf
echo "KEYMAP=br-latin1-abnt2" > /etc/vconsole.conf
#export LANG=en_GB.UTF-8
#export KEYMAP=br-latin1-abnt2
echo "Hostname: "
read hostname
echo $hostname > /etc/hostname
echo "127.0.0.1       localhost" >> /etc/hosts
echo "::1             localhost" >> /etc/hosts
echo "127.0.1.1       $hostname.localdomain $hostname" >> /etc/hosts
#mkinitcpio -P

pacman -S --noconfirm networkmanager networkmanager-openvpn networkmanager-pptp networkmanager-vpnc \
	linux-headers dkms jshon expac wget acpid avahi net-tools xdg-user-dirs zsh zsh-completions
systemctl enable NetworkManager acpid avahi-daemon systemd-timesyncd


#pacman -S alsa-utils pulseaudio-alsa pulseaudio-equalizer
#mkdir -p /etc/pulse/default.pa.d
#echo "unload-module module-role-cork" >> /etc/pulse/default.pa.d/no-cork.pa

echo "passwd for root: "
passwd
echo "Username: "
read username
useradd -m -G audio,video,input,wheel,sys,log,rfkill,lp,adm -s /bin/bash $username
echo "passwd for $username: "
passwd $username
chsh -s /usr/bin/zsh $username

echo "Pre-Installation Finish Reboot now"
echo "exit"
echo "umount - R /mnt"
echo "reboot"



