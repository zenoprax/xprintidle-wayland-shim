Hello! This script will spoof `xprintidle` which can fool some X11 apps (eg. Electron) that don't have
functional idle detection on Wayland-based desktops. You must install `swayidle` and ensure nothing else is using it for this script to work.

> [!IMPORTANT]
> `make install` will safely add the script and warn you of any typical problems.
> The `makefile` also contains the bare `install` command if you want to take your chances.

---

At the time of writing (Using KDE Plasma on Arch):

Working: Super Productivity as well as Steam (I'm guessing this is xwayland).
Not Working: Does not work for my version of Discord.

Nothing else tested yet.

> [!WARNING]
> If you are using both X11 and Wayland then I'm not sure if there is a reasonable
solution for you. You can definitely layer hacks on top of hacks though...

Idea stolen from: https://github.com/johannesjo/super-productivity/issues/5554#issue-3647358339

This script: https://github.com/zenoprax/xprintidle-wayland-shim

