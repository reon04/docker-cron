FROM alpine:3.22

RUN apk add --no-cache coreutils bash jq curl docker-cli
COPY --chmod=744 sendmail /usr/bin/sendmail
RUN rm -f /usr/sbin/sendmail && ln -s /usr/bin/sendmail /usr/sbin/sendmail

CMD ["crond", "-f", "-l", "0"]