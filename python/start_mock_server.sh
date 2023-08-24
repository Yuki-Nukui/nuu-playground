#!/bin/bash

cd `dirname $0`

yarn prism mock ../openapi/openapi_without_auth.yml
