 #!/bin/bash

while true
do
    export DISPLAY=:0.0
    battery_level=`acpi -b | grep -P -o '[0-9]+(?=%)'`
    ac_power=`acpi -b | grep -P -o 'Charging'`
    if [ $ac_power == "Charging" ]; then
        if [ $battery_level -ge 75 ]; then
            notify-send -u normal "Battery charge above 75%. Please unplug your AC adapter!" "Charging: ${battery_level}% "
            sleep 20
        fi
    else
        if [ $battery_level -le 40 ]; then
            notify-send -u normal "Battery is low!. Need to charge! Please plug your AC adapter." "Discharging: ${battery_level}%"
            sleep 20
        fi
    fi
    
    sleep 300 # 300 seconds or 5 minutes
done
