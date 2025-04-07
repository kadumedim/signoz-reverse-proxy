FROM alpine:latest

RUN apk add --no-cache socat

ARG $PORT
ARG $TARGET_HOST
ARG $TARGET_PORT

# Explicitly listen on IPv4 and connect to IPv6
CMD socat TCP4-LISTEN:$PORT,fork,reuseaddr TCP6:[$TARGET_HOST]:$TARGET_PORT