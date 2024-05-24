select yn in monitor check-error count-patterns;
do
case $yn in
monitor ) ../logs/monitor_logs.sh ../logs/sample_log.log "OK";exit;;
check-error ) ../logs/check_errors.sh ../logs/sample_log.log;exit;;
count-patterns ) ../logs/count_pattern.sh ../logs/sample_log.log "200";exit;;
* ) echo "ERROR: Invalid selection";break;;
esac
done