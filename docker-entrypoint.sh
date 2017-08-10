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
echo 'Starting up - Connectors ...'
su idol 
smc_service -a=start
echo 'Starting up - Services ...'
sudo systemctl start licenseserver.service
sudo systemctl start content.service 
sudo systemctl start category.service 
sudo systemctl start community.service 
sudo systemctl start agentstore.service 
sudo systemctl start view.service 
sudo systemctl start cfs.service

while true; do
  sleep 1
done
