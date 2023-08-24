#!/bin/bash

cd `dirname $0`

sed -e '/security:/d' -e '/- cognito: \[\]/d' ../openapi/openapi.yml > ../openapi/openapi_without_auth.yml
