# The stuff I want to do regularly

Mainly from here: "https://wiki.archlinux.org/title/system_maintenance"

## Updates

- Check "https://archlinux.org" for manual update intervention
  - Or just not bother
- Run `yup` to update everything on the system

## Errors

- Run `systemctl --failed` to see any failed services
- Run `journalctl -p 3 -b` to see any other errors
  - I don't know if I'll care enough to fix some of these though

## Clearing

- Run `yup -c` to clear cache and removed unused dependencies
- Check log size with `journalctl --disk-usage` and remove with either
  - `journalctl --vacuum-size=100M`
  - `journalctl --vacuum-time=7d`
- Remove old config files from ~/.config
- Removed old / too big files from ~/.cache
- Check ~/.local/share for old files
- Use `ncdu` to check for large files

## Backups

- Check if config files are synced

## Personalisation

- Fix an annoying issue I'm experiencing
- Make another program XDG compliant??

