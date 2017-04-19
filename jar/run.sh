#!/bin/sh
CLASSPATH=${CLASSPATH}:"./classes":`echo ./lib/*.jar | sed "s/ /:/g"`
if [ -z "${JAVA_HOME}" ] ; then
    echo "JAVA_HOME setting ERROR"
    echo "Please set JAVA_HOME"
    exit 1
fi
if [ ! -x "${JAVA_HOME}/bin/java" ] ; then
    echo "JAVA_HOME SETTING ERROR"
    echo "Can not find Java VM"
    exit 1
fi

echo "Using JAVA_HOME   ${JAVA_HOME}"
echo "Using CLASSPATH   ${CLASSPATH}"
JAVA_OPTS=${JAVA_OPTS}" -Xms1024M -Xmx1024M -Dspring.profiles.active=test2"

nohup "${JAVA_HOME}/bin/java" -server -jar ${JAVA_OPTS} *.jar & 
if [ $? -eq 0 ]
    then
	/bin/echo "${!}" > "tempid"

fi
