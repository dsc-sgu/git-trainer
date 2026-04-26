#!/bin/bash

cd /home/student/where-am-i

rm -f sim
g++ src/main.cpp src/physics.cpp -o sim 2>/dev/null

if [ $? -ne 0 ]; then
    echo "1. Ошибка компиляции! Вы точно вернули константу и правильно её назвали?"
    exit 1
fi



OUTPUT=$(./sim)
if echo "$OUTPUT" | grep -q "0.0066743"; then
    echo "1. Компиляция успешна! Чиселки сходятся."
    exit 0
else
    echo "1. Код компилируется, но расчеты неверны. Убедитесь точное ли значение нужной константы вы нашли?"
    exit 1
fi