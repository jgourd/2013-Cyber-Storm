#!/bin/bash

if [ $(whoami) != "root" ]; then
	echo "You must be root."
	exit
fi

delay=300
for ((;;)); do
	date -u -s "`nc.traditional time.nist.gov 13 | grep -v '^$' | awk '{print $2" "$3}'`"
	sleep $delay
done
