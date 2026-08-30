#!/bin/bash

REPO_DIR="$HOME/orbital-failure"
TMP_DIR="$(mktemp -d /tmp/orbital-failure.XXXXXX)"
trap 'rm -rf "$TMP_DIR"' EXIT

if ! cp -R "$REPO_DIR" "$TMP_DIR/repo" 2>/dev/null; then
    echo "6. Не удалось подготовить временную копию репозитория."
    exit 1
fi

cd "$TMP_DIR/repo" || exit 1


if ! git log -1 >/dev/null 2>&1; then
    echo "6. Не удалось получить историю коммитов."
    exit 1
fi


if git show HEAD:include/constants.h | grep -q "6\.6743015e-11"; then
    echo "6. Изменения констант зафиксированы в коммите."
    exit 0
else
    echo "6. Убедитесь, что вы закоммитили исправленные константы."
    exit 1
fi

