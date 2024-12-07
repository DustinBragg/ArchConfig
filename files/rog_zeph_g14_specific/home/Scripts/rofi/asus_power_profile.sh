#!/bin/bash

POWER_MODES=("Balanced" "Performance" "Quiet")

for MODE in ${POWER_MODES[@]}; do
    if [ x"$@" = x"$MODE" ]
    then
	asusctl profile -P $MODE &>/dev/null
	exit 0
    fi
done

echo ${POWER_MODES[0]}
echo ${POWER_MODES[1]}
echo ${POWER_MODES[2]}
