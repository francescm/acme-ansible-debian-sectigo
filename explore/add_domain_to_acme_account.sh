#!/bin/bash

if [ -z "$1" ]
then
  echo "Usage: ${0} account_id"
  exit 2
fi
ACCOUNT_ID=$1


curl "https://cert-manager.com/api/acme/v1/account/${ACCOUNT_ID}/domains" -i -X POST --config .config -d '{"domains":[{"name":"*.example.org"},{"name":"example.org"}]}'
