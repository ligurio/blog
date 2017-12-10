---
date: 2017-09-18T00:00:00Z
title: Анализ данных с Jupyter Notebooks
tags: ["opensource", "openbsd"]
---

Недавно открыл для себя такую штуку, как Jupyter Notebooks. Это такой
инструмент для интерактивных вычислений.

Вот например я делал [анализ
статистики](https://github.com/ligurio/openbsd-tests/wiki/OpenBSD-errata-statistics)
корректирующих патчей для OpenBSD. Собрал общедоступные данные о
[патчах](https://www.openbsd.org/errata.html) в таблицу, построил графики и
скриншоты этих графиков выложил на гитхаб. И хотя я опубликовал
[скрипт](https://github.com/ligurio/openbsd-tests/blob/master/tools/errata_stat)
для сбора этой статистики, но вряд ли кто-то захочет проверить эти графики и
даже мне нужно будет потратить некоторое время чтобы обновить их для новых
выпусков OpenBSD. C Jupyter Notebook мы получаем *воспроизводимость для анализа
данных*, все необходимые *куски кода, данных и комментарии к ним находятся в
одном месте* - в ноутбуке.

То же самое с расчётами #RaceTheTube для Московского метро - всё источники
данных, манипуляции над ними я [опубликовал](/2015/11/19/racethetube.html), но
всё это разрозненно и нужно потратить время, чтобы повторить расчёты. С Jupyter
Notebook у вас не будет этой проблемы.

Чтобы попробовать Jupyter Notebook в деле я [сделал
анализ](https://github.com/ligurio/running-analytics/blob/master/moscow-hm-2017.ipynb)
результатов полумарафона "Лужники", в котором сам участвовал в прошлом месяце.
Комментарий к этому анализу я написал [отдельным постом в
ФБ](https://www.facebook.com/thebronevichok/posts/1866481423363720?pnref=story).

Ещё начал делать анализ статистики о разработке в проектах
[CRIU](https://github.com/ligurio/criu-metrics/blob/master/criu-review.ipynb) и
[OpenBSD](https://github.com/ligurio/openbsd-metrics/blob/master/openbsd-review.ipynb),
но там я пока сделал не все, что хотел.
