#!/bin/bash

port=12345
message="There is an IRC server on this machine.  Get on it and join your team's channel."

echo "Listening on port $port..."
for ((;;)); do
	echo "$message" | nc -lnvv $port
done
