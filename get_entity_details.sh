#!/bin/bash

if [ -z "$CEM_TOKEN" ]
then
  echo "[ERROR] CEM_TOKEN is empty, did you run 'source login_api.sh' first?"
else
  read -p "Please enter the platform of the entity (example: aws ): " platform
  read -p "Please enter the account id of the entity (example: 179196310045 ): " account_id
  read -p "Please enter the entity id (example: arn:aws:iam::179196310045:role/Idaptive_AWS ): " entity_id
  parameters="?platform=$platform&account_id=$account_id&entity_id=$entity_id"
  entity_details=$(
    curl -s -X GET \
      --header "Content-Type: application/json" \
      --header "Authorization: Bearer $CEM_TOKEN" \
      --url "https://api.cem.cyberark.com/cloudEntities/api/get-entity-details$parameters"
  )
  echo $entity_details | jq .
fi
