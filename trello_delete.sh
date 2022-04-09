#!/bin/bash

BOARD_ID=$1
API_KEY=$2
API_TOKEN=$3

# Create array with IDs of closed cards
readarray -t id_array < <(curl --request GET --url "https://api.trello.com/1/boards/$BOARD_ID/cards/closed?key=$API_KEY&token=$API_TOKEN" | jq -r '.[]|.id')

# Iterate over array to delete each card
for i in "${id_array[@]}"
do
  curl --request DELETE  --url "https://api.trello.com/1/cards/$i?key=$API_KEY&token=$API_TOKEN"
done
