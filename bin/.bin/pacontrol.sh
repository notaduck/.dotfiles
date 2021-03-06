# pacontrol.sh
#
# This script changes the volume of the current audio source based on a set interval

usage() {
    echo "Usage: pacontrol.sh [up|down|toggle-mute]"
}

vol_interval=10
sinks=$(pactl list short sinks | cut -c 1)
latest_sink=${sinks[*]: -1}

case $1 in
    "up")
        pactl set-sink-mute $latest_sink 0
        pactl set-sink-volume $latest_sink +$vol_interval%
				# dwmbar_reset
        ;;
    "down")
        pactl set-sink-volume $latest_sink -$vol_interval%
				# dwmbar_reset
        ;;
    "toggle-mute") 
			pactl set-sink-mute $latest_sink toggle
					# dwmbar_reset
        ;;
    *) usage ;;
esac

pkill -RTMIN+11 dwmblocks
