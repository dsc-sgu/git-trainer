#!/bin/bash
cd /home/student/where-am-i

if git reflog | grep -qi "checkout: moving from"; then
    echo "3. Ага! Кто-то использовал git checkout! Это запрещено в данном задании. Вам нужно было использовать другую команду. Начните задание заново (клавиша 'r')."
    exit 1
else
  echo "3. Отличная работа! Вы использовали безопасные методы чтения истории."
  exit 0
fi

