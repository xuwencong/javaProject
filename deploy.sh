#!/bin/sh
SERVICE_DIR=/opt/gitProject/demo
SERVICE_NAME=demo-0.0.1-SNAPSHOT.war
SPRING_PROFILES_ACTIVE=test

## java env
export JAVA_HOME=/usr/lib/jvm/jre-openjdk
export JRE_HOME=${JAVA_HOME}/jre

case "$1" in
	start)
		procedure=`ps -ef | grep -w "${SERVICE_NAME}" |grep -w "java"| grep -v "grep" | awk '{print $2}'`
		if [ "${procedure}" = "" ];
		then
			echo "start ..."
			if [ "$2" != "" ];
			then
				SPRING_PROFILES_ACTIVE=$2
			fi
			cd ${SERVICE_DIR}
			mvn clean package  -Dmaven.test.skip=true
			echo "spring.profiles.active=${SPRING_PROFILES_ACTIVE}"
			echo "war_path=${SERVICE_DIR}/tartget/${SERVICE_NAME}"
			nohup java -jar ${SERVICE_DIR}/tartget/${SERVICE_NAME}  &
			#nohup java -jar ${SERVICE_DIR}/target/${SERVICE_NAME} --spring.profiles.active=${SPRING_PROFILES_ACTIVE} >/dev/null 2>&1 &
			echo "start success"
		else
			echo "${SERVICE_NAME} is start"
		fi
		;;

	stop)
		procedure=`ps -ef | grep -w "${SERVICE_NAME}" |grep -w "java"| grep -v "grep" | awk '{print $2}'`
		if [ "${procedure}" = "" ];
		then
			echo "${SERVICE_NAME} is stop"
		else
			kill -9 ${procedure}
			sleep 1
			argprocedure=`ps -ef | grep -w "${SERVICE_NAME}" |grep -w "java"| grep -v "grep" | awk '{print $2}'`
			if [ "${argprocedure}" = "" ];
			then
				echo "${SERVICE_NAME} stop success"
			else
				kill -9 ${argprocedure}
				echo "${SERVICE_NAME} stop error"
			fi
		fi
		;;

	restart)
		$0 stop
		sleep 1
		$0 start $2
		;;

	*)
		echo "usage: $0 [start|stop|restart] [dev|test|prod]"
		;;
esac
