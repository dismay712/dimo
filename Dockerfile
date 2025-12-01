FROM docker:dind

WORKDIR /runner

COPY * .

RUN apk add --no-cache curl openrc supervisor && \
    apk cache clean && \
    mkdir data && mkdir -p /run/openrc && \
    touch /run/openrc/softlevel && \
    chmod +x start.sh

EXPOSE 8080

ENTRYPOINT ["/runner/start.sh"]
