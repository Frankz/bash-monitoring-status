FROM bash:5.0
ADD src /opt/src
ADD crontab /opt/crontab
RUN apk add jq=1.6-r1 \
            ca-certificates=20191127-r3 \
            nghttp2-libs=1.41.0-r0 \
            libcurl \
            curl
RUN /usr/bin/crontab /opt/crontab/crontab.txt
CMD ["/opt/crontab/entry.sh"]
