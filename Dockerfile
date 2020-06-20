FROM nginx

# to get nginx_more_headers
RUN apt-get update && apt-get install -y nginx-extras && \
    rm /etc/nginx/conf.d/default.conf

COPY nginx.conf /etc/nginx

VOLUME /var/log/nginx
