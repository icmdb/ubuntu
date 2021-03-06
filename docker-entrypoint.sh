#!/bin/bash

set -xe

PS4='+ $(date +"%F %T%z") ${BASH_SOURCE}:${LINENO}): ${FUNCNAME[0]:+${FUNCNAME[0]}(): }'

DEBUG_DELAY="${DEBUG_DELAY:=3}"

if [[ "${DEBUG_DELAY}" != "" ]]; then
    while [[  "${DEBUG_DELAY}" > 1 ]]; do
        echo "Waiting for the application start, ${DEBUG_DELAY} seconds left.." 
        sleep 1
        DEBUG_DELAY="$[DEBUG_DELAY - 1]"
    done
fi

if [[ "${@}" != "" ]]; then
    if [[ "$1" == "crashed" ]]; then
        exit 1
    else
        exec "${@}" || /bin/sh
    fi
else
    exec nginx -g "daemon off;"
fi
