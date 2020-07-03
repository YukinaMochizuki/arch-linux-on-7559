# arch-linux-on-7559
Arch Linux installation notes &amp; script on my Dell Inspiron 15 7559 Notebook

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

    use ``fdisk /dev/sdx``
    and format ``mkfs.ext4 /dev/sdx``

    For details, please refer to the [Partitioning](https://wiki.archlinux.org/index.php/Partitioning)
    
5. Mount new root
``mount /dev/sdxY /mnt``

6. Mount EFI system partition
``mkdir /mnt/boot``and``mount /dev/sdxY /mnt/boot``

7. Change the mirrors' priority
``vim /etc/pacman.d/mirrorlist``
> The higher a mirror is placed in the list, the more priority it is given when downloading a package.
> And this file will later be copied to the new system by pacstrap, so it is worth getting right.

8. Install essential packages
``pacstrap /mnt base base-devel linux linux-firmware dhcpcd``

9. define the disk partitions, or other block devices should be mounted into the filesystem
``genfstab -U /mnt >> /mnt/etc/fstab``
check the file content correct``cat /mnt/etc/fstab``

10. Done, now go into our new system!
``arch-chroot /mnt``

