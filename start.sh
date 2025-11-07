#!/usr/bin/env sh

docker pull gitea:act_runner:0.2.13

cd /runner

sed -e "s#--gitea--#$GITEA_URL#" \
    -e "s#--token--#$RUNNER_TOKEN#" \
    -e "s#--rname--#$RUNNER_NAME#" \
    -i config.yaml

docker compose up -d
