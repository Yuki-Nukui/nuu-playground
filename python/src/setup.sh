#!/bin/bash

cd `dirname $0`

exit_code=0

# 再起的にサブディレクトリを検索し、setup.shを実行
for setup_sh in $(find . -mindepth 2 -maxdepth 2 -name 'setup.sh'); do
    sh $setup_sh
    if [ $? -ne 0 ]; then
        exit_code=1
    fi
done

# lambda layer
mkdir -p ./layers
mkdir -p ./layers/common
mkdir -p ./layers/common/python
cp -r ./common ./layers/common/python/common

exit $exit_code
