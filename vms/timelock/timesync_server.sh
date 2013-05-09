#!/bin/bash

for ((;;)); do
	echo "time.nist.gov is your friend!" | nc -lnvv 54321
done
