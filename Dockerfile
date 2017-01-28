# --------------------------------------------------------------------------
# This is a Dockerfile to run an openresty / Lua development container.
# develop your application in the app folder
# --------------------------------------------------------------------------

FROM openresty/openresty:centos-rpm

MAINTAINER MAINTAINER  Tim Birkett <tim@birkett-bros.com> (@pysysops)

RUN mkdir -p /src/app /src/conf /src/static

ADD ./src/conf/nginx.conf /src/conf/nginx.conf
ADD ./src/app/app.conf /src/app/app.conf
ADD ./src/app/handler.lua /src/app/handler.lua

VOLUME /src

EXPOSE 3000

ENTRYPOINT ["/usr/bin/openresty", "-c", "/src/conf/nginx.conf" ]
