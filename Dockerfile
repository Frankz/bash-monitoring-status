FROM bash:5.0
ADD src /opt/src
RUN apk add ca-certificates nghttp2-libs libcurl curl-7.69.1-r0
#ENTRYPOINT ["bash", "/opt/src/main.sh"]