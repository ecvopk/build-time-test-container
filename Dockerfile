FROM alpine:3.18

# нужен curl
RUN apk add --no-cache curl

# аргумент для времени сборки; при отсутствии — "unknown"
ARG BUILD_TIME
ENV BUILD_TIME=${BUILD_TIME:-unknown02}

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
