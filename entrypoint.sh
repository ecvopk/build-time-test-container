#!/bin/sh
set -e

# ожидаем, что эти переменные заданы при запуске контейнера
: "${BOT_TOKEN?Need BOT_TOKEN environment variable}"
: "${CHAT_ID?Need CHAT_ID environment variable}"

text="Build time: ${BUILD_TIME}"
echo "Sending: $text"

curl -G "https://api.icq.net/bot/v1/messages/sendText" \
  --data-urlencode "token=${BOT_TOKEN}" \
  --data-urlencode "chatId=${CHAT_ID}" \
  --data-urlencode "text=${text}"

tail -f /dev/null # prevent from stop
