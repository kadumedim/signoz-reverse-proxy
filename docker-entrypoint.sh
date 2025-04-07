#!/bin/sh
set -e

# Replace environment variables in the config template
envsubst < /usr/local/etc/haproxy/haproxy.cfg.template > /usr/local/etc/haproxy/haproxy.cfg

# Execute the CMD
exec "$@"