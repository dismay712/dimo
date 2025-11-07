FROM docker:dind

WORKDIR /runner

COPY * .

RUN mkdir data && \
    chmod +x start.sh

EXPOSE 2375

CMD ["sh","/runner/start.sh"]
