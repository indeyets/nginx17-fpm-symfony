FROM nginx:1.7
MAINTAINER Alexey Zakhlestin <indeyets@gmail.com>

ADD nginx-init.sh symfony-fpm.conf /
ENV NGINX_HOST localhost
ENV NGINX_DATA_ROOT /usr/local/nginx/html

CMD ["/nginx-init.sh"]