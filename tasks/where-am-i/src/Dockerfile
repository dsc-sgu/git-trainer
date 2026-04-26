FROM git-trainer:base-task-image

ARG USERNAME=student
ARG GIT_USERNAME=student
ARG GIT_EMAIL=student@alivetech.com
ENV DESCRIPTION="Программа для физических расчетов (src/physics.cpp) не компилируется: кто-то удалил из кода точное значение важной константы, которая участвует в рассчетах. Известно, что недавно эту константу добавляли, но в каком именно коммите никто не знает. Сейчас в проекте 7 коммитов. Ваша задача: Найти коммит, в котором присутствует эта константа. Скопируйте точное значение константы из вывода, вставьте его в physics.cpp и сделайте новый коммит с правильно работающей программой. ВАЖНО: в этом задании нельзя использовать git checkout <hash коммита>. Вам нужно просто заглянуть в прошлое — найти команду Git, которая позволяет ПОКАЗАТЬ содержимое коммита и изменения в нем прямо в терминале"

RUN echo -n $DESCRIPTION > /etc/git-trainer/description
COPY ./tasks/where-am-i/src/repo /home/${USERNAME}/where-am-i


RUN sudo chown -R ${USERNAME}:${USERNAME} /home/${USERNAME}/where-am-i
USER $USERNAME
RUN git config --global --add safe.directory /home/${USERNAME}/where-am-i
WORKDIR /home/${USERNAME}/where-am-i