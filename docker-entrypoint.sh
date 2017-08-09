#!/bin/bash
set -e

# IDOL should be shut down properly
function shut_down() {
  echo "Shutting Down"
  smc_service -a=stop
  echo 'Saving configuration'
}

trap "shut_down" SIGKILL SIGTERM SIGHUP SIGINT EXIT

echo 'Starting up'
su - idol -c 'smc_service -a=start'

echo "Connectors are now running"

while true; do
  sleep 1
done
