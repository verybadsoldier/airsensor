#!/bin/sh
HOST=localhost
PORT=7072
DEVICE=fl_airSensor
READING=airQuality
USER=fhem

COMMAND=/media/fhem/airsensor/airsensor
PARAMS_PRE="-e 5 -i 120 -c "
USER_CMD="echo \"setreading $DEVICE $READING %d\" | nc -w10 $HOST $PORT"

# either use this to start airsensor in shell-observered respawn loop
(while true; do sudo -u $USER $COMMAND $PARAMS_PRE "$USER_CMD" > /dev/null 2>&1;sleep 1;done;)&

# or us start stop
#start-stop-daemon -b -c $USER -S -x $COMMAND -- $PARAMS_PRE "$USER_CMD"
