ARG NGINX

FROM nginx:$NGINX

# to get nginx_more_headers
RUN apt-get update && apt-get install -y nginx-extras && \
    rm /etc/nginx/conf.d/default.conf

COPY nginx.conf /etc/nginx

VOLUME /var/log/nginx

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
        CMD dig +norecurse +retry=0 @192.168.178.1 || exit 1

RUN ["nginx", "-v"]
