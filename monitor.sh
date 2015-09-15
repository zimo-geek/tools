#!/bin/bash

source /etc/profile

master="spark://hdp111:7077"
hosts[0]='hdp112'
hosts[1]='hdp113'
hosts[2]='hdp114'

workdir="./"
logfile="${workdir}/monitor.log"

cd ${workdir}

log()
{
	echo `date '+%Y-%m-%d %H:%M:%S'` $*
	echo `date '+%Y-%m-%d %H:%M:%S'` $* >> $logfile
}

function monitor_slave()
{
    host=$1
    master=$2
    log $1, $2, "bash ${SPARK_HOME}/sbin/start-slave.sh -h ${host}  ${master}"
    ssh ${host} <<EOF
    bash ${SPARK_HOME}/sbin/start-slave.sh -h ${host}  ${master}
    exit
EOF
}

#monitor_slave ${hosts[1]} ${master}
while true
do
    ps -fe|grep spark |grep -v grep
    if [ $? -ne 0 ]
    	then
		log 'master is stoped, restarting master'
        	#bash ${SPARK_HOME}/sbin/stop-slaves.sh
		bash ${SPARK_HOME}/sbin/start-master.sh
		for h in ${hosts[@]}
		do
			log "handling ${h}"
			monitor_slave $h ${master}
        	done
    	else
        	log "spark is running"
    	fi
	sleep 10m
done
