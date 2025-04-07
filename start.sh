#!/bin/sh
# Generate config with environment variables
envsubst < /haproxy.cfg.template > /tmp/haproxy.cfg

# Start HAProxy with the generated config
exec haproxy -f /tmp/haproxy.cfg -db