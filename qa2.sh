#!/bin/bash
echo "Killing all screens..."
killall screen

echo "Checking Directory..."
 if [ -d "/home/c2s/screen_names" ] 
	   then
		   echo "Directory exists"
		     else
			     echo "Creating directory"	 
			     mkdir -p /home/c2s/screen_names
			     echo "Directory created"
			      fi

			      echo "Starting nhhs_event_log"
			      sh /opt/app/event_log/nhhs_event_log/start.sh

			      echo "Starting nhhs_event_log..."
			      screen -dmS nhhs_event_log
			      screen -ls | grep nhhs_event_log | awk '{print $1}' | head -1 > /home/c2s/screen_names/nhhs_event_log_sn
			      screen_nhhs_event_log=`cat /home/c2s/screen_names/nhhs_event_log_sn`
			      screen -r "$nhhs_event_log" -X stuff $'sh /opt/app/event_log/nhhs_event_log/start.sh\n'
			      sleep 2
			      echo "nhhs_event_log running on screen $screen_nhhs_event_log"

			      echo "Starting nhhs_api"
			      screen -dmS nhhs_api
			      screen -ls | grep nhhs_api | awk '{print $1}' | head -1 > /home/c2s/screen_names/nhhs_api_sn
			      screen_nhhs_api=`cat /home/c2s/screen_names/nhhs_api_sn`
			      screen -r "$screen_nhhs_api" -X stuff $'sh /opt/app/nhhs_api/start.sh\n'
			      sleep 2
			      echo "nhhs_api running on screen $screen_nhhs_api"

			      echo "Starting Kafka..."
			      cd /opt/app/kafka
			      sh start.sh
			      sleep 5
			      ps aux | grep kafka | head -1 | awk '{print $2}' > /var/run/kafka.pid
			      PID=`cat /var/run/kafka.pid`
			      echo "Kafka Started with pid $PID"
			      sleep 15

			      cd /opt/c2s/scripts
			      echo "Starting nhhs_event_bus"
			      screen -dmS nhhs_event_bus
			      screen -ls | grep nhhs_event_bus | awk '{print $1}' | head -1 > /home/c2s/screen_names/nhhs_event_bus_sn
			      screen_nhhs_event_bus=`cat /home/c2s/screen_names/nhhs_event_bus_sn`
			      screen -r "$screen_nhhs_event_bus" -X stuff $'sh /opt/app/nhhs_event_bus/bus_env/start.sh\n'
			      sleep 2
			      echo "nhhs_event_bus running on screen $screen_nhhs_event_bus"

			      echo "Starting nhhs_api_gateway"
			      screen -dmS nhhs_api_gateway
			      screen -ls | grep nhhs_api_gateway | awk '{print $1}' | head -1 > /home/c2s/screen_names/nhhs_api_gateway_sn
			      screen_nhhs_api_gateway=`cat /home/c2s/screen_names/nhhs_api_gateway_sn`
			      screen -r "$screen_nhhs_api_gateway" -X stuff $'sh /opt/nhhs_api_gateway/start.sh\n'
			      sleep 2
			      echo "nhhs_api_gateway running on screen $screen_nhhs_api_gateway"

			      #cd /opt/qa2_bcg
			      echo "Starting qa2_bcg"
			      screen -dmS qa2_bcg
			      screen -ls | grep qa2_bcg | awk '{print $1}' | head -1 > /home/c2s/screen_names/qa2_bcg_sn
			      screen_qa2_bcg=`cat /home/c2s/screen_names/qa2_bcg_sn`
			      screen -r "$screen_qa2_bcg" -X stuff $'sh /opt/qa2_bcg/start.sh\n'
			      sleep 2
			      echo "qa2_bcg running on screen $screen_qa2_bcg"

			      echo "Please holdon... Completing the screens..."
			      sleep 2
			      echo "All screens running..."
			      screen -ls

			      #Docker_start
			      echo "Starting Docker"
			      sh /opt/c2s/scripts/restart-nhhs-feedback.sh
			      echo "All dockers running..."
			      sleep 2

		      docker ps -a
		      screen -ls
		      echo "Done"
