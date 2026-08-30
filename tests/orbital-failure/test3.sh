#!/bin/bash

REPO_DIR="$HOME/orbital-failure"
TMP_DIR="$(mktemp -d /tmp/orbital-failure.XXXXXX)"
trap 'rm -rf "$TMP_DIR"' EXIT

if ! cp -R "$REPO_DIR" "$TMP_DIR/repo" 2>/dev/null; then
    echo "3. Не удалось подготовить временную копию репозитория."
    exit 1
fi

cd "$TMP_DIR/repo" || exit 1
rm -rf build

if OUT="$(./maker.sh 2>&1)"; then
    echo "3. Проект успешно собирается и запускается."
    exit 0
else
    echo "3. Проект не собрался или не запустился. Последние строки вывода:"
    echo "$OUT" | tail -n 15
    exit 1
fi
