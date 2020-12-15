#!/bin/bash

. organizationId.sh

COLLECT_URL="https://cert-manager.com/api/acme/v1/account?organizationId=${ORGANIZATION_ID}"

echo $COLLECT_URL

curl $COLLECT_URL -X GET --config .config

