#!/bin/bash

if [ -z "$CEM_TOKEN" ]
then
  echo "[ERROR] CEM_TOKEN is empty, did you run 'source login_api.sh' first?"
else
  entities=$(
    curl -s -X GET \
      --header "Content-Type: application/json" \
      --header "Authorization: Bearer $CEM_TOKEN" \
      --url "https://api.cem.cyberark.com/cloudEntities/api/search"
  )
  echo $entities | jq .
fi
