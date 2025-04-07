FROM haproxy:latest

COPY haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg.template

# Create a simpler entrypoint script that doesn't require chmod
RUN echo '#!/bin/sh\nenvsubst < /usr/local/etc/haproxy/haproxy.cfg.template > /usr/local/etc/haproxy/haproxy.cfg\nexec "$@"' > /docker-entrypoint.sh \
    && chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["haproxy", "-f", "/usr/local/etc/haproxy/haproxy.cfg"]