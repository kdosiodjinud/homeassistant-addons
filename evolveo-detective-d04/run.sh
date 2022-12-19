#!/usr/bin/env bash

CONFIG_PATH=/data/options.json
mqtt_host="$(jq --raw-output '.mqtt_host' $CONFIG_PATH)"
mqtt_port="$(jq --raw-output '.mqtt_port' $CONFIG_PATH)"
mqtt_username="$(jq --raw-output '.mqtt_username' $CONFIG_PATH)"
mqtt_password="$(jq --raw-output '.mqtt_password' $CONFIG_PATH)"
mqtt_root_topic="$(jq --raw-output '.mqtt_root_topic' $CONFIG_PATH)"

echo "STARTED"

while true;do

    RAW_INPUT="$(echo "OK" | tr -d '\0' | nc -l -p 15002 | tr -d '\0')"
    INPUT=$(tr -cd [:alnum:][:punct:] <<< "$RAW_INPUT")

    EVENT_NAME=$(echo ${INPUT} | jq --raw-output .Event)
    EVENT_CHANEL=$(echo ${INPUT} | jq --raw-output .Channel)
    EVENT_STATUS=$(echo ${INPUT} | jq --raw-output .Status)

    STATUS="unknown"
    VALID="FALSE"

    if [[ ${EVENT_NAME} = "MotionDetect" ]] ; then
      if [[ ${EVENT_STATUS} = "Start" ]] ; then
        STATUS="on"
        VALID="TRUE"
        fi

        if [[ ${EVENT_STATUS} = "Stop" ]] ; then
        STATUS="off"
        VALID="TRUE"
        fi
    else
      echo "Recived unknown Event ${EVENT_NAME} with status ${STATUS} by Camera${EVENT_CHANEL}"
    fi

    if [[ ${VALID} = "TRUE" ]] ; then
        mosquitto_pub -h ${mqtt_host} -p ${mqtt_port} -u ${mqtt_username} -P ${mqtt_password} -t "$mqtt_root_topic/Camera$EVENT_CHANEL/$EVENT_NAME" -m "$STATUS"
    else
        echo "Cannot push to MQTT, camera send:"
        echo Input: ${INPUT}
        echo Event: ${EVENT_NAME}
        echo Camera: ${EVENT_CHANEL}
        echo EventText: ${EVENT_STATUS}
        echo Status: ${STATUS}
    fi

done
