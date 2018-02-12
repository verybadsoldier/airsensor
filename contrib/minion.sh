#!/bin/sh
HOST=minion
PORT=7072
DEVICE=fl_airSensor
READING=airQuality

PARAMS_PRE="-l 15000 -e 5 -i 10 -c "
USER_CMD="echo \"setreading $DEVICE $READING %d\" | nc -w10 $HOST $PORT"

./airsensor $PARAMS_PRE "$USER_CMD"
