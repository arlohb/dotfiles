#!/bin/sh

efibootmgr --disk /dev/nvme0n1 --part 4 --create --label "Arch Linux" --loader /vmlinuz-linux-zen --unicode 'root=PARTUUID=5cc58d0e-864c-d249-a497-2b6eec7fdc5d rw quiet splash vt.global_cursor_default=0 initrd=\amd-ucode.img initrd=\initramfs-linux-zen.img' --verbose

