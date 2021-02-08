#!/bin/bash
################################################################################################################
# This script checks if the round-robin properly works.                                                        #
# !Note that this works for 2 nodes, in order for it to  work for more node, it requires adjustment!           #
################################################################################################################

JQ_BIN=$(which jq 2> /dev/null)
CURL_BIN=$(which curl 2> /dev/null)

if [ -z "${JQ_BIN}" ] || [ -z "${CURL_BIN}" ]; then
    echo "Install curl and jq!"
    exit
fi

TOTAL_REQUEST_COUNT=$1
if [ -z "$TOTAL_REQUEST_COUNT" ]; then
  TOTAL_REQUEST_COUNT=100
fi

for ((request=1;request<=${TOTAL_REQUEST_COUNT};request++))
do
  CURRENT_NODE=$(${CURL_BIN} -s -X GET "http://localhost:8080/" | ${JQ_BIN} .node)
  if [ ${CURRENT_NODE} != ${CURRENT_NODE} ]; then
    echo "Same node hits by successive call!"
    exit 1
  fi
  PREVIOUS_NODE=${CURRENT_NODE}
done

echo "All seems fine"
