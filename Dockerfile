FROM haproxy:latest

COPY haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg.template

# Use a shell command directly as the entrypoint
ENTRYPOINT ["/bin/sh", "-c", "envsubst < /usr/local/etc/haproxy/haproxy.cfg.template > /usr/local/etc/haproxy/haproxy.cfg && exec haproxy -f /usr/local/etc/haproxy/haproxy.cfg"]