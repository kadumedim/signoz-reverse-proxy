FROM haproxy:2.8-alpine

# Copy in the config file
COPY haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg

# Set environment variables with default values
ENV PORT=8000
ENV CLICKHOUSE_HOST=localhost
ENV CLICKHOUSE_PORT=9000

# Start HAProxy with environment variable support
CMD sh -c "sed -i \"s/\\\${PORT}/$PORT/g; s/\\\${CLICKHOUSE_HOST}/$CLICKHOUSE_HOST/g; s/\\\${CLICKHOUSE_PORT}/$CLICKHOUSE_PORT/g\" /usr/local/etc/haproxy/haproxy.cfg && haproxy -f /usr/local/etc/haproxy/haproxy.cfg"