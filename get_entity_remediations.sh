#!/bin/bash

if [ -z "$CEM_TOKEN" ]
then
  echo "[ERROR] CEM_TOKEN is empty, did you run 'source login_api.sh' first?"
else
  read -p "Please enter the platform of the entity (example: aws ): " platform
  read -p "Please enter the account id of the entity (example: 179196310045 ): " account_id
  read -p "Please enter the entity id (example: arn:aws:iam::179196310045:role/Idaptive_AWS ): " entity_id
  parameters="?platform=$platform&account_id=$account_id&entity_id=$entity_id"
  entity_remediations=$(
    curl -s -X GET \
      --header "Content-Type: application/json" \
      --header "Authorization: Bearer $CEM_TOKEN" \
      --url "https://api.cem.cyberark.com/recommendations/remediations$parameters"
  )
  echo $entity_remediations | jq .
  echo "[INFO] commands to run and the policy are base64 encoded, use 'base64 -d' to decode them"

  #AWS EXAMPLE FOR COMMANDS
  #commands=`echo $entity_remediations | jq .remediations[0].UN_USED_PERMISSIONS.LEAST_PRIVILEGE.data.commands | sed -e 's/^"//' -e 's/"$//' | base64 -d`
  #echo "commands: $commands"
fi
