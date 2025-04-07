FROM alpine:latest

RUN apk add --no-cache socat bind-tools

ARG $PORT
ARG $TARGET_HOST
ARG $TARGET_PORT

# Use hostname with debugging enabled
CMD echo "Starting SOCAT proxy on port 9000" && \
    echo "Targeting host: ${TARGET_HOST} port: ${TARGET_PORT}" && \
    socat -d -d TCP4-LISTEN:9000,fork,reuseaddr TCP:${TARGET_HOST}:${TARGET_PORT}