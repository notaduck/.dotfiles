#!/bin/zsh
#
# Variables
export TERMINAL='st'
export IRC_CLIENT='weechat'
export _JAVA_AWT_WM_NONREPARENTING=1

LAPTOPKEYBOARD=$( xinput --list --id-only 'AT Translated Set 2 keyboard')

# Start the gnome-keyring-daemon
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh 

sxhkd &
nm-applet &
unclutter --timeout 10 --jitter 3 &

# lock after 5 min, corners is tp,tr.bl.br
xautolock -time 10 -locker 'betterlockscreen -l' &

# Launch weechat
$TERMINAL -n $IRC_CLIENT -e $IRC_CLIENT &

xrandr --setproviderouteputsource modesetting NVIDIA-0 &
xrandr --auto &

# set the background
feh --bg-fill --no-xinerama ~/.wallpapers/wallhaven-ymym6gxx.jpg

# set the layout to be danish and map capslock to escape, and swap super <--> alt
setxkbmap -device $LAPTOPKEYBOARD -model dell -layout dk -option "caps:escape, altwin:swap_lalt_lwin" &

# Launxh nextcloud in the background
exec nextcloud --background &

# Touchpad settings
xinput set-prop "DLL06E4:01 06CB:7A13 Touchpad" "libinput Tapping Enabled" 1 
xinput set-prop "DLL06E4:01 06CB:7A13 Touchpad" "libinput Natural Scrolling Enabled" 1 

libinput-gestures-setup start

dwmblocks > ~/dwmblocks.log 2>&1 &

# exec dwm
 while :; do
 		ssh-agent dwm
 done
