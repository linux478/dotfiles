xrandr --output DP-2 --rotate right

while :; do
  xsetroot -name "$(date +'📅 %a %d %b %Y | 🕓 %H:%M %p %Z')"
  sleep 1m

done &

exec ${HOME}/.local/bin/dwm
