#part2

loadkeys br-latin1-abnt2
pacman -Syy
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

pacman -S --noconfirm sed
sed -i "s/^#Color$/Color/" /etc/pacman.conf
sed -i "s/^#VerbosePkgLists$/VerbosePkgLists/" /etc/pacman.conf
sed -i "s/^#ParallelDownloads = 5$/ParallelDownloads = 15/" /etc/pacman.conf
sed -i "s/^#[[]multilib[]]$/[multilib]/" /etc/pacman.conf
sed -i "s/^#Include = \/etc\/pacman\.d\/mirrorlist$/Include = \/etc\/pacman\.d\/mirrorlist/" /etc/pacman.conf
echo "%wheel ALL=(ALL:ALL) ALL" >> /etc/sudoers
echo "%sudo ALL=(ALL:ALL) ALL" >> /etc/sudoers

echo "passwd for root: "
passwd

pacman -S --noconfirm grub os-prober efibootmgr dosfstools mtools gptfdisk fatresize
grub-install --target=x86_64-efi --bootloader-id=grub_uefi --efi-directory=/boot/efi --recheck
grub-mkconfig -o /boot/grub/grub.cfg

pacman -S --noconfirm networkmanager networkmanager-openvpn networkmanager-pptp networkmanager-vpnc
systemctl enable NetworkManager

#pacman -S alsa-utils pulseaudio-alsa pulseaudio-equalizer
#mkdir -p /etc/pulse/default.pa.d
#echo "unload-module module-role-cork" >> /etc/pulse/default.pa.d/no-cork.pa

echo "Username: "
read username
useradd -m -G audio,video,input,wheel,sys,log,rfkill,lp,adm -s /bin/zsh $username
echo "passwd for $username: "
passwd $username

echo "Pre-Installation Finish Reboot now"
echo "exit"
echo "umount - R /mnt"
echo "reboot"



