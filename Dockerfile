FROM haproxy:2.8-alpine

# Install envsubst for environment variable substitution
RUN apk add --no-cache gettext

# Create a simple config template
COPY haproxy.cfg.template /

# Create startup script
COPY start.sh /
RUN chmod +x /start.sh

# Run the startup script
CMD ["/start.sh"]