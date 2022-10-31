FROM nginx
RUN ["/bin/bash", "-c", "mkdir -p /etc/nginx/api_conf.d"]

COPY ./api_conf.d/jenkins_api.conf /etc/nginx/api_conf.d
COPY ./api_conf.d/nexus_api.conf /etc/nginx/api_conf.d
COPY ./api_conf.d/rundeck_api.conf /etc/nginx/api_conf.d
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./api_backends.conf /etc/nginx/api_backends.conf
COPY ./api_gateway.conf /etc/nginx/api_gateway.conf
COPY ./api_json_errors.conf /etc/nginx/api_json_errors.conf

RUN ["/bin/bash", "-c", "/usr/sbin/service nginx restart"]