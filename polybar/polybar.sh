#!/usr/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch polybar
# polybar --config=$HOME/.config/polybar/config.ini example &

for m in $(polybar --list-monitors | cut -d":" -f1); do
    MONITOR=$m polybar --reload --config=$HOME/.config/polybar/config.ini example &
done
