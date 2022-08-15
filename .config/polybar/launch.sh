killall polybar

if type "xrandr"; then
  for m in $(polybar --list-monitors | cut -d":" -f1); do
    MONITOR=$m polybar --reload > /dev/null 2>&1 &
  done
else
  polybar --reload > /dev/null 2>&1 &
fi
