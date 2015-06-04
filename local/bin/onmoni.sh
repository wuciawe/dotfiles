#!/bin/bash

M1="eDP-0"
M2="HDMI-0"

if [[ "${1,,,}" == "pri" ]]; then
    xrandr --output $M1 --auto --output $M2 --off
else
    xrandr --output $M1 --off --output $M2 --auto
fi
