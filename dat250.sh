#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

CMD="$1"

case "$CMD" in
  start)
    docker compose up --build
    ;;
  stop)
    docker compose down
    ;;
  reset)
    docker compose down -v
    docker compose up --build
    ;;
  rebuild)
    docker compose pull --ignore-pull-failures
    docker compose build --no-cache
    docker compose up -d --force-recreate --remove-orphans
    echo "Stack running in the background: http://localhost:18181"
    ;;
  logs)
    docker compose logs -f
    ;;
  *)
    echo "Usage: ./dat250.sh {start|stop|reset|rebuild|logs}"
    echo "  start   — foreground: compose up --build"
    echo "  stop    — compose down"
    echo "  reset   — remove volumes (fresh DB), then up --build (foreground)"
    echo "  rebuild — pull bases, rebuild backend image (--no-cache), recreate containers (-d)"
    echo "  logs    — follow compose logs"
    exit 1
    ;;
esac
