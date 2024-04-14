
#part1

loadkeys br-latin1-abnt2
sed -i "s/^#ParallelDownloads = 5$/ParallelDownloads = 15/" /etc/pacman.conf
pacman --noconfirm -Sy archlinux-keyring
timedatectl set-ntp true

mkfs.fat -F32 -n EFI /dev/sda1

mkswap -L SWAP /dev/sda2
swapon /dev/sda2

mkfs.ext4 -L ROOT /dev/sda3

mkdir /mnt/home
mkfs.ext4 -L HOME /dev/sda4

mkdir -p /mnt/boot/efi
mount /dev/sda1 /mnt/boot/efi
mount /dev/sda3 /mnt
mount /dev/sda4 /mnt/home

reflector -c 'Berlin' -a 15 -p https --sort rate --save /etc/pacman.d/mirrorlist
pacman -Syy
pacstrap /mnt base base-devel linux linux-firmware \
	sysfsutils usbutils e2fsprogs inetutils netctl \
	nano less which man-db man-pages

genfstab -U /mnt >> /mnt/etc/fstab

arch-chroot /mnt









