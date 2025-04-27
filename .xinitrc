xrandr --output DP-2 --rotate right --right-of DP-3

while :; do
  xsetroot -name "$(date +'%U 📅 %a %d %b %Y | 🕓 %H:%M %p %Z')"
  sleep 1m

done &

exec ${HOME}/.local/bin/dwm
