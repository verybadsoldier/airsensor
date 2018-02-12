#!/bin/sh
HOST=minion
PORT=7072
DEVICE=$1
READING=airQuality
USER=tc
PID=/var/run/airsensor.pid

COMMAND=/mnt/MASS2/fhem-tc/airsensor/airsensor
COMMAND_ARM=/mnt/MASS2/fhem-tc/airsensor/airsensor_arm
PARAMS_PRE="-l 15000 -e 5 -i 10 -c "
USER_CMD="echo \"setreading $DEVICE $READING %d\" | nc -w10 $HOST $PORT"

if [ -z "$2" ]; then 
  start-stop-daemon -m -p $PID -b -c $USER -S -x $COMMAND_ARM -- $PARAMS_PRE "$USER_CMD"
else 
  (while true; do sudo -u $USER $COMMAND $PARAMS_PRE "$USER_CMD" > /dev/null 2>&1;sleep 1;done;)&
fi