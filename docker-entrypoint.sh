#!/bin/bash
set -e

# IDOL should be shut down properly
function shut_down() {
	echo "Shutting Down ..."
	su - idol -c 'smc_service -a=stop'
	su - idol -c 'stop-agentstore' 
	su - idol -c 'stop-cfs' 
	su - idol -c 'stop-community' 
	su - idol -c 'stop-category'
	su - idol -c 'stop-content' 
	su - idol -c 'stop-view'
	su - idol -c 'stop-licenseserver'
	echo '======================================================================================================================================='
	echo 'Thanks for using this container. Any comments/questions at hi@yuntaz.com'
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
su - idol -c 'start-licenseserver'
su - idol -c 'start-agentstore'
su - idol -c 'start-cfs' 
su - idol -c 'start-community' 
su - idol -c 'start-category'
su - idol -c 'start-content'
su - idol -c 'start-view'
su - idol -c 'smc_service -a=start'
su - idol -c 'java -Dhp.find.home=/opt/HewlettPackardEnterprise/Find -Dserver.port=8080 -jar /opt/HewlettPackardEnterprise/Find/find.war -uriEncoding utf-8'
while true; do
  sleep 1
done
