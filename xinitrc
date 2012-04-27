## The following variable defines the session which is started if the user doesn't explicitly select a session
## Source: http://svn.berlios.de/svnroot/repos/slim/trunk/xinitrc.sample
#
DEFAULT_SESSION=xmonad

case $1 in
xmonad)
  start-pulseaudio-x11
  ./.screenlayout/layout.sh
  gvim &
  rhythmbox &
  pidgin &
  terminator &
  ./Documents/backgrounds/.wallpaper_random.sh &
  ./start_synergy.sh &
  dropboxd &
  chromium &
  xmonad
  ;;
gnome)
  exec ck-launch-session gnome-session
  ;;
*)
  exec $DEFAULT_SESSION
  ;;
esac


