#!/bin/bash

M1="eDP-0"
M2="HDMI-0"

xrandr --output M1 --auto --primary --output $M2 --auto --right-of $M1
