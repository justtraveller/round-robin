#!/bin/bash
################################################################################################################
# This script checks if the round-robin properly works.                                                        #
# !Note that this works for 2 nodes, in order for it to  work for more node, it requires adjustment!           #
################################################################################################################

TOTAL_REQUEST_COUNT=$1
if [ -z "$TOTAL_REQUEST_COUNT" ]; then
  TOTAL_REQUEST_COUNT=100
fi

for ((request=1;request<=${TOTAL_REQUEST_COUNT};request++))
do
  CURRENT_NODE=$(curl -s -X GET "http://localhost:8080/" | jq .node)
  if [ ${CURRENT_NODE} != ${CURRENT_NODE} ]; then
    echo "Same node hits by successive call!"
    exit 1
  fi
  PREVIOUS_NODE=${CURRENT_NODE}
done

echo "All seems fine"
