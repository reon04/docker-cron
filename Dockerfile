FROM alpine:3.22

RUN apk add --no-cache docker-cli

CMD ["crond", "-f", "-l", "0"]