FROM docker:dind

WORKDIR /runner

COPY * .

RUN docker pull gitea:act_runner:0.2.13 && \
    mkdir data && \
    chmod +x entrypoint.sh

EXPOSE 2376

CMD [""]
ENTRYPOINT ["/runner/entrypoint.sh"]
