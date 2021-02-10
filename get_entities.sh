#!/bin/bash

curl -X GET \
  --header "Content-Type: application/json" \
  --header "Authorization: Bearer $CEM_TOKEN" \
  --url "https://api.cem.cyberark.com/cloudEntities/api/search"
