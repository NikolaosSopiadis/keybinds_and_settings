**arch notes**

# h1 initial install

setup greek:

```zsh
loadkeys gr
setfont iso07.16
```

setup internet `ip link` and verify `ping google.com`
update system clock `timedatectl`

created partitions
formatted partitions
mounted partitions

setting up mirror list

```zsh
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
reflector --latest 20 --sort rate --country GR,AL,MK,IT,TU,RO --protocol https --age 6 --save /etc/pacman.d/mirrorlist
```

install base system `pacstrap -K /mnt linux linux-firmware sof-firmware base-devel git grub efibootmngr vim nano networkmanager os-prober ntfs-3g man-db man-pages sudo`

if pgp signature error

```zsh
pacman -Sy archlinux-keyring
pacman-key --init
pacman-key --populate archlinux
```

and then retry pacstrap

fstab

```zsh
genfstab -U /mnt >> /mnt/etc/fstab
cat /mnt/etc/fstab
```

Change root into the new system: `arch-chroot /mnt`

Set the time zone: `ln -sf /usr/share/zoneinfo/Europe/Athens /etc/localtime`
Run hwclock(8) to generate /etc/adjtime: `hwclock --systohc`

`vim /etc/locale.gen` and uncomment

- el_GR.UTF-8 UTF8
- el_GR ISO-8859-7
- en_US.UTF-8 UTF-8
- en_US ISO-8859-1

 `vim /etc/locale.conf` and set locale settings (not sure what all of them do so I just set language to english)

``` txt
LANG=en_US.UTF-8
```

`vim /etc/vconsole.conf` and set

``` txt
KEYMAP=gr
FONT=iso07.16
```

``` txt
******************
* /\            *
*  |  WARNING!  *
*  |            *
******************
```

The above font does not get recognnised when creating initramfs with `sudo mkinitcpio -P`
It can safely be omitted.

`vim /etc/hostname` and set hostname (whatever I want)

```txt
ArchBTW
```

For all the above I should check the file values using cat.

add root password `passwd` (mc for the vm)
add new user `useradd -m -G wheel,users nick`
add password for user nick `passwd nick` (mc for the vm)

add user to sudoers file `sudo EDITOR=vim visudo` and uncomment `%wheel ALL=(ALL:ALL) ALL`

enable NetworkManager `systemctl enable NetworkManager`

Configure GRUB

```zsh

```

grub-mount has "fuse3" as an optional dependancy and it is needed for os-prober to work. `sudo pacman -S fuse3`
Enable os-prober: `sudo vim /etc/default/grub` and uncomment `GRUB_DISABLE_OS_PROBER=false`
sudo grub-mkconfig -o /boot/grub/grub.cfg

reboot

```zsh
exit
umount -R /mnt
reboot
```

# h1 Desktop environment

# h2 kde plasma

install `plasma` since it just has the essential apps.
Includes:

- ⚙️ System Settings – Configure Plasma
- 📁 KSysGuard / Plasma System Monitor – Resource monitoring
- 🔍 KRunner – Quick launcher (Alt + Space)
- 📦 Discover – GUI package manager

Additional apps needed:

- 🏠 Dolphin – File manager
- Browser: Librewolf
- pdf viewer: nighpdf
- image viewer: gwenview
- terminal: kitty
- calculator: kcalc
- email client: thunderbird + birdtray
- media playback: vlc
- system log viwer: ksystemlog
- sound mixer: kmix

`sudo pacman -Sy plasma sddm`

sddm is the display manager

intall gpu drivers (list by chatgpt so BE CAREFULL)
`sudo pacman -Sy nvidia nvidia-utils nvidia-settings mesa nvidia-dkms nvidia-settings nvidia-utils libva-nvidia-driver`
mesa is opengl and etc open source implementations

READ THE ARCH WIKI BEFORE INSTALLATION https://wiki.archlinux.org/title/NVIDIA#DRM_kernel_mode_setting

need wayland support so follow the correct settings

to enable sddm

```zsh
sudo systemctl enable sddm
sudo systemctl start sddm
```

to start plasma from terminal `startplasma-wayland`

# h1 post install

install aur helper "yay"

enable this systemd service to fix instant wakeup from suspend, caused on some Gigabyte motherboards
```zsh
sudo systemctl enable wakeup-disable-GPP0.service
sudo systemctl start wakeup-disable-GPP0.service
```

install and enable gnome keyring. Then follow arch wiki.
```zsh
sudo pacman -S gnome-keyring
```

to fix vscode "An OS keyring couldn't be identified for storing the encryption related data in your current desktop environment" add `"password-store": "gnome"` to `~/.vscode/argv.json`

## Secure boot

Use `sbctl` for secure boot and `efitools` to back up the existing keys. I also need to disable shim lock on grub.

## Firewall

Two pieces of software will be used: `ufw` as the firewall and `fail2ban` as an anti-probe mechanism
