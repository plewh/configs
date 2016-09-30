#!/bin/bash
#	mouse_accel.sh
#		- install me in /etc/profile.d to run on unity log in
#		- this script turns off mouse acceleration
#		- tweak Constant Deceleration param to change sensitivity (higher number = lower speed)
############################################################################

xinput set-prop 14 "Device Accel Profile" -1
xinput set-prop 15 "Device Accel Profile" -1
xinput set-prop 14 "Device Accel Constant Deceleration" 1
xinput set-prop 15 "Device Accel Constant Deceleration" 1
