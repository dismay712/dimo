FROM docker:dind

WORKDIR /runner

COPY * .

RUN apk add --no-cache curl screen && \
    mkdir data && \
    chmod +x start.sh

EXPOSE 8080

ENTRYPOINT ["/runner/start.sh"]
