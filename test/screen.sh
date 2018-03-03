#!/bin/bash
date=`date`
killall screen
echo "-----------Masterlog on$date-----------" >> screen_new.log
exec &>> screen_new.log
echo "Starting nhhs_event_log..."
                              screen -dmS nhhs_event_log
			                                    screen -ls | grep nhhs_event_log | awk '{print $1}' | head -1 > /home/c2s/screen_names/nhhs_event_log_sn
							                                  screen_nhhs_event_log=`cat /home/c2s/screen_names/nhhs_event_log_sn`
											                                screen -r "$nhhs_event_log" -X stuff $'sh /opt/app/event_log/nhhs_event_log/start.sh\n'
															                              sleep 2
																		                                    echo "nhhs_event_log running on screen $screen_nhhs_event_log"
