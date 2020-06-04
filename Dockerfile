FROM bash:5.0
ADD src /opt/src
ADD crontab /opt/crontab
RUN apk add jq=1.6-r1 \
            ca-certificates=20191127-r3 \
            nghttp2-libs=1.40.0-r0 \
            libcurl=7.69.1-r0 \
            curl=7.69.1-r0
RUN /usr/bin/crontab /opt/crontab/crontab.txt
CMD ["/opt/crontab/entry.sh"]