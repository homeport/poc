FROM ubuntu:xenial

RUN apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 573BFD6B3D8FBC641079A6ABABF5BD827BD9BF62 \
	&& echo "deb http://nginx.org/packages/mainline/ubuntu xenial nginx" >> /etc/apt/sources.list \
	&& apt-get update \
	&& apt-get install --no-install-recommends \
                           --no-install-suggests -y \
                            ca-certificates \
                            nginx=1.11.3-1~xenial \
                            nginx-module-xslt \
                            nginx-module-geoip \
                            nginx-module-image-filter \
                            nginx-module-perl \
                            nginx-module-njs \
                            gettext-base \
	&& rm -rf /var/lib/apt/lists/* \
        && rm -rf /etc/nginx/* 

COPY etc /etc/nginx

CMD ["nginx", "-g", "daemon off;"]
