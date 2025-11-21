#!/usr/bin/env sh

/usr/local/bin/dockerd-entrypoint.sh &

while ! nc -z localhost 2376 </dev/null; do
    echo 'waiting for docker daemon...'
    sleep 5
done

cd /runner && docker compose up -d

curl -o komari -L https://github.com/komari-monitor/komari-agent/releases/latest/download/komari-agent-linux-amd64 && \
chmod +x komari && \
screen -dmS Komari ./komari -e $KOMARI_SERVER \
-t $KOMARI_SECRET \
--disable-web-ssh \
--interval 5.0 \
--max-retries 5 \
--reconnect-interval 10 \
--info-report-interval 15

/runner/tinyhttp
