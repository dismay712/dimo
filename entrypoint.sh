#!/usr/bin/env sh

cd /runner

sed -e "s#--gitea--#$GITEA_URL#" \
    -e "s#--token--#$RUNNER_TOKEN#" \
    -e "s#--rname--#$RUNNER_NAME#" \
    -i config.yaml

docker compose up -d
