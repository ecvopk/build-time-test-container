
export $(grep -v '^#' .env | xargs)

git switch main
git pull
docker run --rm -e BOT_TOKEN="${BOT_TOKEN}" -e CHAT_ID="${CHAT_ID}" build-time-sender
docker build --build-arg BUILD_TIME="$(date -u +%Y-%m-%dT%H:%M:%SZ)" -t build-time-sender .
