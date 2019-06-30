Services Information and Management on Polybar
===

This scripts add "icon" and "number"(services count) on polybar. With mouse clicking, you can **start**, **stop** and **restart** services with `dmenu`.

## Requirements

- polybar, of course.
- dmenu
- systemd

## Installation

Copy `services.sh` file to `~/.config/polybar/scripts/`.

Add custom module to polybar's config.

```
[module/services]
type = custom/script
exec = systemctl --type=service --state=running list-units --no-pager | grep running | wc -l
interval = 10
label =  %output%
click-left = ~/.config/polybar/scripts/services.sh
```

Here we go, remember to restart polybar's config.

## Todo

- [ ] Use script file as `exec`. So no more long `exec` line on `polybar`.
- [ ] Show service status on `dmenu`
- [ ] Add support for other `menu` packages.
