FROM nginx:1

LABEL maintainer="Nicolas Wild <nwild@nyxmo.com>"

RUN set -x \
    && apt-get update \
    && apt-get install --no-install-recommends --no-install-suggests -y ca-certificates curl \
    && apt-get purge -y --auto-remove

ADD nginx.conf /etc/nginx/nginx.conf

ADD entrypoint.sh /bin

ENTRYPOINT ["/bin/entrypoint.sh"]

CMD ["nginx", "-g", "daemon off;"]]