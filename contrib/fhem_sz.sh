#!/bin/sh
HOST=minion
PORT=7072
DEVICE=$1
READING=airQuality
USER=tc

COMMAND=/mnt/MASS2/fhem-tc/airsensor/airsensor_arm
PARAMS_PRE="-l 15000 -e 5 -i 120 -c "
USER_CMD="echo \"setreading $DEVICE $READING %d\" | nc -w10 $HOST $PORT"

start-stop-daemon -m -p /var/run/airsensor.pid -b -c $USER -S -x $COMMAND -- $PARAMS_PRE "$USER_CMD"
#daemonize -c $USER p /var/run/airsensor.pid $COMMAND $PARAMS_PRE "$USER_CMD"