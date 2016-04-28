---
date: 2016-04-20T00:00:00Z
title: Форматирование слайдов презентаций
draft: true
url: /2016/04/20/geek-slides/
---

Есть много инструментов для создания слайдов презентации. Я обычно для этих
целей использую систему форматирования текстов LaTeX, а точнее расширение для
LaTeX - Beamer. C LaTeX и Beamer мне нравится, что исходный файл презентации
это обычный текстовый файл и, как следствие, его можно положить в систему
контроля версий и отслеживать историю изменений в отличие от презентаций,
сделанных в Keynote или даже Powerpoint. Но c LaTeX есть один недостаток - пакет
имеет размер около 500 Mb и везде, где нужно собрать слайды из исходников, нужно
устанавливать LaTeX. Но недавно я вспомнил про предшественника LaTeX - roff.

Система форматирования текстов roff это один из ключевых компонентов любой Unix
системы - с его помощью форматируются man страницы, первая версия программы была
написана ещё в 60-x годах. Потом roff расширяли и переписывали, но назначение
программы не поменялось.

Как и в LaTeX исходные файлы roff представляют собой текст, размеченный
макросами:

```
.ce
.sp 1.5v
.PSPIC "openvz-logo.eps"
.TITLE "OpenVZ on the way to the Linux kernel upstream"
.sp -1.5v
.SUBTITLE "Sergey Bronnikov"
.SUBTITLE "sergeyb@openvz.org"
.SUBTITLE "Linux Plumbers, 2015, Seattle, WA"
.SK
```

Благодаря поддержке макросов, регистров

https://staff.fnwi.uva.nl/b.diertens/useful/gpresent/
https://www.bsdcan.org/2014/schedule/attachments/276_NewTrendsInMandoc.roff
http://www.troff.org/54.pdf
http://www.antipope.org/charlie/old/linux/shopper/159.typesetting.html

troff или его аналоги использовались для [написания
книг](http://www.troff.org/pubs.html), кто-то на StackOverflow
[написал](http://stackoverflow.com/a/336921/3665613), что чуть ли не все книги
издательства O'Reilly форматируются с помощью troff.

Бонус для тех, кто дочитал ло конца: roff это акроним от типографского термина
«runoff» — «печатать тираж».
