#!/bin/bash
set -e

function start-licenseserver() {
	echo "Starting LicenseServer..."
	export LD_LIBRARY_PATH=/opt/HewlettPackardEnterprise/IDOLServer-11.4.0/common:/opt/HewlettPackardEnterprise/IDOLServer-11.4.0/common/runtime:/opt/HewlettPackardEnterprise/IDOLServer-11.4.0/common/keyview:/opt/HewlettPackardEnterprise/IDOLServer-11.4.0/common/langfiles:$LD_LIBRARY_PATH
	LICENSE_PATH=/opt/HewlettPackardEnterprise/IDOLServer-11.4.0/licenseserver
	nohup $LICENSE_PATH/licenseserver.exe > $LICENSE_PATH/licenseserver.out 2> $LICENSE_PATH/licenseserver.err &
}

function stop-licenseserver() {
	if [ -f /opt/HewlettPackardEnterprise/IDOLServer-11.4.0/licenseserver/licenseserver.pid ]
	then
	  kill -2 `cat /opt/HewlettPackardEnterprise/IDOLServer-11.4.0/licenseserver/licenseserver.pid`
	fi
}

function start-agentstore() {
	echo "Starting AgentStore..."
	export LD_LIBRARY_PATH=/opt/HewlettPackardEnterprise/IDOLServer-11.4.0/common:/opt/HewlettPackardEnterprise/IDOLServer-11.4.0/common/runtime:/opt/HewlettPackardEnterprise/IDOLServer-11.4.0/common/keyview:/opt/HewlettPackardEnterprise/IDOLServer-11.4.0/common/langfiles:$LD_LIBRARY_PATH
	AGENTSTORE_PATH=/opt/HewlettPackardEnterprise/IDOLServer-11.4.0/agentstore
	nohup $AGENTSTORE_PATH/agentstore.exe > $AGENTSTORE_PATH/agentstore.out 2> $AGENTSTORE_PATH/agentstore.err &
}

function stop-agentstore() {
	if [ -f /opt/HewlettPackardEnterprise/IDOLServer-11.4.0/agentstore/agentstore.pid ]
	then
	  kill -2 `cat /opt/HewlettPackardEnterprise/IDOLServer-11.4.0/agentstore/agentstore.pid`
	fi
}

function start-cfs() {
	echo "Starting CFS..."
	export LD_LIBRARY_PATH=/opt/HewlettPackardEnterprise/IDOLServer-11.4.0/common:/opt/HewlettPackardEnterprise/IDOLServer-11.4.0/common/runtime:/opt/HewlettPackardEnterprise/IDOLServer-11.4.0/common/keyview:/opt/HewlettPackardEnterprise/IDOLServer-11.4.0/common/langfiles:$LD_LIBRARY_PATH
	CFS_PATH=/opt/HewlettPackardEnterprise/IDOLServer-11.4.0/cfs
	nohup $CFS_PATH/cfs.exe > $CFS_PATH/cfs.out 2> $CFS_PATH/cfs.err &
}

function stop-cfs() {
	if [ -f /opt/HewlettPackardEnterprise/IDOLServer-11.4.0/cfs/cfs.pid ]
	then
	  kill -2 `cat /opt/HewlettPackardEnterprise/IDOLServer-11.4.0/cfs/cfs.pid`
	fi
}

function start-community() {
	echo "Starting Community..."
	export LD_LIBRARY_PATH=/opt/HewlettPackardEnterprise/IDOLServer-11.4.0/common:/opt/HewlettPackardEnterprise/IDOLServer-11.4.0/common/runtime:/opt/HewlettPackardEnterprise/IDOLServer-11.4.0/common/keyview:/opt/HewlettPackardEnterprise/IDOLServer-11.4.0/common/langfiles:$LD_LIBRARY_PATH
	COMMUNITY_PATH=/opt/HewlettPackardEnterprise/IDOLServer-11.4.0/community
	nohup $COMMUNITY_PATH/community.exe > $COMMUNITY_PATH/community.out 2> $COMMUNITY_PATH/community.err &
}

function stop-community() {
	if [ -f /opt/HewlettPackardEnterprise/IDOLServer-11.4.0/community/community.pid ]
	then
	  kill -2 `cat /opt/HewlettPackardEnterprise/IDOLServer-11.4.0/community/community.pid`
	fi
}

function start-category() {
	echo "Starting Category..."
	export LD_LIBRARY_PATH=/opt/HewlettPackardEnterprise/IDOLServer-11.4.0/common:/opt/HewlettPackardEnterprise/IDOLServer-11.4.0/common/runtime:/opt/HewlettPackardEnterprise/IDOLServer-11.4.0/common/keyview:/opt/HewlettPackardEnterprise/IDOLServer-11.4.0/common/langfiles:$LD_LIBRARY_PATH
	CAT_PATH=/opt/HewlettPackardEnterprise/IDOLServer-11.4.0/category
	nohup $CAT_PATH/category.exe > $CAT_PATH/category.out 2> $CAT_PATH/category.err &
}

function stop-category() {
	if [ -f /opt/HewlettPackardEnterprise/IDOLServer-11.4.0/category/category.pid ]
	then
	  kill -2 `cat /opt/HewlettPackardEnterprise/IDOLServer-11.4.0/category/category.pid`
	fi
}

function start-content() {
	echo "Starting Content..."
	export LD_LIBRARY_PATH=/opt/HewlettPackardEnterprise/IDOLServer-11.4.0/common:/opt/HewlettPackardEnterprise/IDOLServer-11.4.0/common/runtime:/opt/HewlettPackardEnterprise/IDOLServer-11.4.0/common/keyview:/opt/HewlettPackardEnterprise/IDOLServer-11.4.0/common/langfiles:$LD_LIBRARY_PATH
	CONTENT_PATH=/opt/HewlettPackardEnterprise/IDOLServer-11.4.0/content
	nohup $CONTENT_PATH/content.exe > $CONTENT_PATH/content.out 2> $CONTENT_PATH/content.err &
}

function stop-content() {
	if [ -f /opt/HewlettPackardEnterprise/IDOLServer-11.4.0/content/content.pid ]
	then
	  kill -2 `cat /opt/HewlettPackardEnterprise/IDOLServer-11.4.0/content/content.pid`
	fi
}

function start-view() {
	echo "Starting View..."
	export LD_LIBRARY_PATH=/opt/HewlettPackardEnterprise/IDOLServer-11.4.0/common:/opt/HewlettPackardEnterprise/IDOLServer-11.4.0/common/runtime:/opt/HewlettPackardEnterprise/IDOLServer-11.4.0/common/keyview:/opt/HewlettPackardEnterprise/IDOLServer-11.4.0/common/langfiles:$LD_LIBRARY_PATH
	VIEW_PATH=/opt/HewlettPackardEnterprise/IDOLServer-11.4.0/view
	nohup $VIEW_PATH/view.exe > $VIEW_PATH/view.out 2> $VIEW_PATH/view.err &
}

function stop-view() {
	if [ -f /opt/HewlettPackardEnterprise/IDOLServer-11.4.0/view/view.pid ]
	then
	  kill -2 `cat /opt/HewlettPackardEnterprise/IDOLServer-11.4.0/view/view.pid`
	fi
}

function start-find() {
	echo "Starting HPE Find..."
	FIND_HOME=/opt/HewlettPackardEnterprise/Find
	nohup java -Dhp.find.home=$FIND_HOME/home -Dserver.port=8080 -jar $FIND_HOME/find.war -uriEncoding utf-8 > $FIND_HOME/find.out 2> $FIND_HOME/find.err &
}

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
#smc_service_start
#start-find

while [ 1 ]                                                                
do                                                                         
  sleep 60 &                                                             
  wait $!                                                                
done
