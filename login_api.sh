#!/bin/bash

read -p "Please enter your organization number (example: cyberark823): " organization
read -s -p "Please enter your access key (example: K21iXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXf10): " access_key; echo

data="{
  \"organization\": \"$organization\",
  \"accessKey\": \"$access_key\"
}"

response=$(
  curl -s -X POST \
    --header "Content-Type: application/json" \
    --url "https://api.cem.cyberark.com/apis/login" \
    --data "$data"
)

echo "[INFO] CEM Authentication Token will be exported as environment variable \$CEM_TOKEN"
export CEM_TOKEN=$(echo $response | jq .token | sed -e 's/^"//' -e 's/"$//')
