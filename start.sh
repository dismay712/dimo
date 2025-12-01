#!/usr/bin/env sh

/usr/local/bin/dockerd-entrypoint.sh &

while ! nc -z localhost 2376 </dev/null; do
    echo 'waiting for docker daemon...'
    sleep 5
done

cd /runner && docker compose up -d

curl -o komari -L https://github.com/komari-monitor/komari-agent/releases/latest/download/komari-agent-linux-amd64 && \
chmod +x komari

mkdir -p /etc/supervisor.d && cp /runner/apps.ini /etc/supervisor.d/apps.ini

supervisord -c /etc/supervisord.conf
