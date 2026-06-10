
export $(grep -v '^#' .env | xargs)

cd "${WORK_DIR}"
git switch main
git pull
docker build --no-cache --build-arg BUILD_TIME="$(date -u +%Y-%m-%dT%H:%M:%SZ)" -t build-time-sender .
#docker run --rm -e BOT_TOKEN="${BOT_TOKEN}" -e CHAT_ID="${CHAT_ID}" build-time-sender
docker run -d --name build-time-sender -e BOT_TOKEN="${BOT_TOKEN}" -e CHAT_ID="${CHAT_ID}" build-time-sender
