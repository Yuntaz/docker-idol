#!/bin/bash
set -e

function smc_service_start() {
	echo "Starting Connectors..."
	nohup smc_service -a=start > /dev/null 2> /dev/null &
}

function smc_service_stop() {
	echo "Stopping Connectors..."
	sudo smc_service -a=stop
}

# IDOL should be shut down properly
function shut_down() {
	echo "Shutting Down ..."
	smc_service_stop
	stop-agentstore 
	stop-cfs
	stop-community
	stop-category
	stop-content
	stop-view
	stop-licenseserver
	stop-find
	echo '======================================================================================================================================='
	echo 'Thanks for using this container. Any comments/questions at hi@yuntaz.com'
	echo '======================================================================================================================================='	
	kill -s SIGTERM $!                                                         
	exit 0  	
}

trap "shut_down" SIGKILL SIGTERM SIGHUP SIGINT EXIT

echo 'Starting up'
echo '======================================================================================================================================='
echo 'HPE IDOL is a search engine with machine learning built to handle all kind of information, structured (office docs, databases and more)'
echo 'and unstructured (social media, video, audio and more). To run it, you will need a valid HPE IDOL license which is not provided here.' 
echo 'See below how to contact us if you want to see IDOL working. If you are a customer from HPE IDOL, you can use your current IDOL license'
echo 'to test the new version or just to use this software as your license says to do it.'
echo '======================================================================================================================================='
start-licenseserver
start-agentstore
start-cfs
start-community
start-category
start-content
start-view
start-find
smc_service_start
su - idol -c '/bin/bash'

while true; do
  sleep 1
done
