#!/bin/sh
export JAVA_OPTS="-Dipv4addr=$(hostname -i)"
echo $JAVA_OPTS
./veloe-broker/bin/artemis run