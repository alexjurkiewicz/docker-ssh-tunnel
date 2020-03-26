FROM alpine:3

EXPOSE 10000

RUN apk add openssh

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
