FROM caddy:2.7.5-alpine

# Create directory for Caddyfile
WORKDIR /etc/caddy

# Copy in the Caddyfile
COPY Caddyfile /etc/caddy/Caddyfile

# Run Caddy with the Caddyfile
CMD ["caddy", "run", "--config", "/etc/caddy/Caddyfile"]