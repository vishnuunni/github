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

				      #cd /opt/c2s/scripts
				      #cd /opt/nhhs_api_gateway
				      echo "Starting nhhs_api_gateway..."
				      screen -dmS nhhs_api_gateway
				      screen -ls | grep nhhs_api_gateway | awk '{print $1}' | head -1 > /home/c2s/screen_names/nhhs_api_gateway_sn
				      screen_nhhs_api_gateway=`cat /home/c2s/screen_names/nhhs_api_gateway_sn`
				      screen -r "$screen_nhhs_api_gateway" -X stuff $'sh /opt/nhhs_api_gateway/start.sh\n'
				      sleep 2
				      echo "nhhs_api_gateway running on screen $screen_nhhs_api_gateway"

				      echo "Starting Kafka..."
				      cd /opt/kafka
				      sh start.sh
				      sleep 5
				      ps aux | grep kafka | head -1 | awk '{print $2}' > /var/run/kafka.pid
				      PID=`cat /var/run/kafka.pid`
				      echo "Kafka Started with pid $PID"
				      sleep 15

				      echo "Starting nhhs_bus..."
				      screen -dmS nhhs_bus
				      screen -ls | grep nhhs_bus | awk '{print $1}' | head -1 > /home/c2s/screen_names/nhhs_bus_sn
				      screen_nhhs_bus=`cat /home/c2s/screen_names/nhhs_bus_sn`
				      screen -r "$screen_nhhs_bus" -X stuff $'sh /opt/nhhs_bus/start.sh\n'
				      sleep 2
				      echo "nhhs_bus running on screen $screen_nhhs_bus"

				      echo "Starting nhhs_log..."
				      screen -dmS nhhs_log
				      screen -ls | grep nhhs_log | awk '{print $1}' | head -1 > /home/c2s/screen_names/nhhs_log_sn
				      screen_nhhs_log=`cat /home/c2s/screen_names/nhhs_log_sn`
				      screen -r "$screen_nhhs_log" -X stuff $'sh /opt/nhhs_log/start.sh\n'
				      sleep 2
				      echo "nhhs_log running on screen $screen_nhhs_log"

				      cd /opt/bcg/nhhs_bcg
				      echo "Starting nhhs_bcg..."
				      screen -dmS nhhs_bcg
				      screen -ls | grep nhhs_bcg | awk '{print $1}' | head -1 > /home/c2s/screen_names/nhhs_bcg_sn
				      screen_nhhs_bcg=`cat /home/c2s/screen_names/nhhs_bcg_sn`
				      screen -r "$screen_nhhs_bcg" -X stuff $'sh /opt/bcg/nhhs_bcg/start.sh\n'
				      sleep 2
				      echo "nhhs_bcg running on screen $screen_nhhs_bcg"

				      cd /opt/app/nhhs_api
				      echo "Starting nhhs_api..."
				      screen -dmS nhhs_api
				      screen -ls | grep nhhs_api | awk '{print $1}' | head -1 > /home/c2s/screen_names/nhhs_api_sn
				      screen_nhhs_api=`cat /home/c2s/screen_names/nhhs_api_sn`
				      screen -r "$screen_nhhs_api" -X stuff $'sh /opt/app/nhhs_api/start.sh\n'
				      sleep 2
				      echo "nhhs_api running on screen $screen_nhhs_api"

				      #echo "Starting nhhs_payment..."
				      #screen -dmS nhhs_payment
				      #screen -ls | grep nhhs_payment | awk '{print $1}' | head -1 > /opt/c2s/scripts/screen_name/nhhs_payment_sn
				      #screen_nhhs_payment=`/opt/c2s/scripts/screen_name/nhhs_payment_sn`
				      #screen -r "$screen_nhhs_payment" -X stuff $'sh /opt/nhhs_payment/start.sh\n'
				      #sleep 5
				      #echo "nhhs_payment running on screen $screen_nhhs_payment"

				      #echo "Starting nhhs_rpm..."
				      #screen -dmS nhhs_rpm
				      #screen -ls | grep nhhs_rpm | awk '{print $1}' | head -1 > /opt/c2s/scripts/screen_name/nhhs_rpm_sn
				      #screen_nhhs_rpm=`/opt/c2s/scripts/screen_name/nhhs_rpm_sn`
				      #screen -r "$screen_nhhs_rpm" -X stuff $'sh /opt/rpm/start.sh\n'

				      cd /opt/c2s/scripts
				      echo "Please holdon... Completing the screens..."
				      sleep 2
				      echo "All screens running..."
				      screen -ls
				      sleep 2

				      echo "Starting all dockers..."
				      sh /opt/c2s/scripts/restart-rpm.sh
				      sh /opt/c2s/scripts/restart-nhhs_payment.sh
				      sh /opt/c2s/scripts/restart-nhhs_rpm.sh
				      sh /opt/c2s/scripts/restart-api.sh
				      echo "All dockers running..."
			      docker ps -a
			      screen -ls
			      #monit summary
			      echo "Done"
