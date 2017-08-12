#!/bin/bash
set -e

# IDOL should be shut down properly
function shut_down() {
	echo "Shutting Down ..."
	smc_service -a=stop
	sudo systemctl start licenseserver.service
	sudo systemctl start content.service 
	sudo systemctl start category.service 
	sudo systemctl start community.service 
	sudo systemctl start agentstore.service 
	sudo systemctl start view.service 
	sudo systemctl start cfs.service
	echo '======================================================================================================================================='
	echo 'Thanks for using this container. Any comments/questions at hi@yuntaz.com'
	echo 'Made with love at Mexico City'
	echo '======================================================================================================================================='	
}

trap "shut_down" SIGKILL SIGTERM SIGHUP SIGINT EXIT

echo 'Starting up'
echo '======================================================================================================================================='
echo 'HPE IDOL is a search engine with machine learning built to handle all kind of information, structured (office docs, databases and more)'
echo 'and unstructured (social media, video, audio and more). To run it, you will need a valid HPE IDOL license which is not provided here.' 
echo 'See below how to contact us if you want to see IDOL working. If you are a customer from HPE IDOL, you can use your current IDOL license'
echo 'to test the new version or just to use this software as your license says to do it.'
echo '======================================================================================================================================='
su idol 
echo 'Starting up - Services ...'
sudo systemctl start licenseserver.service
sudo systemctl start content.service 
sudo systemctl start category.service 
sudo systemctl start community.service 
sudo systemctl start agentstore.service 
sudo systemctl start view.service 
sudo systemctl start cfs.service
echo 'Starting up - Connectors ...'
smc_service -a=start

while true; do
  sleep 1
done
