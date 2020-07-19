# arch-linux-on-7559
Arch Linux installation notes &amp; script for my Dell Inspiron 15 7559 Laptop

## Basic Information
- Hardware Detail: [notebookcheck](https://www.notebookcheck.net/Dell-Inspiron-15-7559-Notebook-Review.154635.0.html)
- UEFI Boot (and already **HAVE** an EFI system partition)
- Window manager used i3wm-gaps
- Display manager used LightDM
- TODO: status bar used polybar

## Ref
- [Wiki Installation guide](https://wiki.archlinux.org/index.php/Installation_guide#Update_the_system_clock)

---
## 	Pre-installation

### On live usb

1. Check disk partition
``fdisk -l``

2. Link to network
wired network
``dhcpcd``
or wifi
``wifi-menu``

3. Update the system clock
``timedatectl set-ntp true``
and no output

4. Partition the disks
    > Use ``fdisk /dev/sdx`` and format ``mkfs.ext4 /dev/sdx``.
    > 
    > For details, please refer to the [Partitioning](https://wiki.archlinux.org/index.php/Partitioning)
    
5. Mount new root
``mount /dev/sdxY /mnt``

6. Mount EFI system partition
``mkdir /mnt/boot`` and ``mount /dev/sdxY /mnt/boot``

7. Change the mirrors' priority
``vim /etc/pacman.d/mirrorlist``
    > The higher a mirror is placed in the list, the more priority it is given when downloading a package.
    > And this file will later be copied to the new system by pacstrap, so it is worth getting right.

8. Install essential packages
``pacstrap /mnt base base-devel linux linux-firmware dhcpcd``

9. Define the disk partitions or other block devices. It should be mounted into the filesystem
``genfstab -U /mnt >> /mnt/etc/fstab``
check the file content correct
``cat /mnt/etc/fstab``

10. Done, now go into our new system!
``arch-chroot /mnt``

### On new root

1. Set time zone
````
# Taipei time zone
ln -sf /usr/share/zoneinfo/Asia/Taipei /etc/localtime
timedatectl set-local-rtc 1 --adjust-system-clock
hwclock --systohc
````

2. Install basic tools
````
# My text editor and terminal multiplexer
pacman -S vim tmux htop

# lib, wifi tools and intel cpu stability and security updates
pacman -S dialog wpa_supplicant networkmanager netctl intel-ucode
systemctl enable networkmanager

# Those package can helps grub to scanning already exists os
pacman -S os-prober ntfs-3g
````

3. Localization
``
vim /etc/locale.gen
``
find``zh_TW.UTF-8 UTF-8`` and ``en_US.UTF-8 UTF-8`` then uncomment it.

````
locale-gen
vim /etc/locale.conf
# and add LANG=en_US.UTF-8
````

4. Set hostname
``
vim /etc/hostname
``

5. Set localhost in /etc/hosts

````
127.0.0.1	localhost
::1		localhost
127.0.1.1	myhostname.localdomain	myhostname
````

6. Root password and create user
````
passwd

# Create a user with home dir
useradd -m Username
````

7. Install bootloader
````
# Install grub2
pacman -S grub efibootmgr

# Word "x" in sdx need to replace according to the actual situation 
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=grub

# Generate config
grub-mkconfig -o /boot/grub/grub.cfg
````

8. Umount and reboot
````
exit
umount /mnt/boot
umount /mnt
reboot
````

9. Make a swap
````
# Login root account
# Create a fulled zero 4GB file
dd if=/dev/zero of=/swapfile bs=1M conut=4096
chmod 600 /swapfile

# Set up a Linux swap area
mkswap /swapfile
swapon /swapfile

# Let swapfile can auto-monut
# Add /swapfile	none	swap	defaults	0	0
vim /etc/fstab

# Reboot and check its mounted
reboot
free -h
````

Options: wifi configuration
````
nmtui
````

## Screenshot
This is what my laptop looks like now, I will add the remaining steps and dotfile to this note or new repo (such as dotfile v2...etc).

![](https://github.com/YukinaMochizuki/arch-linux-on-7559/blob/master/2020-07-19-163901_1920x1080_scrot.png)
