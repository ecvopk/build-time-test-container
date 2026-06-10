
cd "${WORK_DIR}"
git switch main
git pull
BUILD_TIME="$(date -u +%Y-%m-%dT%H:%M:%SZ)" docker compose build --no-cache
docker compose up -d
