#!/bin/sh
# Example of a script to use for Docker that that sends readings to FHEM by telnet
# env variables: FHEM_HOST, FHEM_DEVICE, FHEM_READING

PARAMS_PRE="-l 15000 -e 5 -i 10 -c "
USER_CMD="echo \"setreading $FHEM_DEVICE $FHEM_READING %d\" | nc -q0 -w10 $FHEM_HOST $FHEM_PORT"

exec /usr/bin/airsensor $PARAMS_PRE "$USER_CMD"
