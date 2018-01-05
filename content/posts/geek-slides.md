---
date: 2016-05-17T00:00:00Z
title: Форматирование слайдов презентаций с помощью roff
tags: ["opensource", "openvz"]
---

Есть разные инструменты для создания слайдов презентации: PowerPoint, Keynote,
LaTeX, популярные в последнее время фреймворки типа
[reveal.js](http://lab.hakim.se/reveal-js/#/). Я раньше для создания слайдов
пользовался системой форматирования текстов LaTeX, а точнее её расширением -
Beamer. C LaTeX и Beamer мне нравится, что исходный файл презентации это обычный
текстовый файл, размеченный специальным образом, и, как следствие, его можно
положить в систему контроля версий и отслеживать историю изменений. В отличие от
презентаций, сделанных в Keynote или даже Powerpoint. Но c LaTeX есть один
недостаток - пакет имеет размер около 500 Mb и везде, где нужно собрать слайды
из исходников, нужно устанавливать LaTeX, а это не всегда удобно. Но недавно я
вспомнил про предшественника LaTeX - roff, а точнее runoff (почему так
называется позднее скажу).

Система форматирования текстов roff это один из ключевых компонентов любой Unix
системы - с его помощью форматируются man страницы. Первая версия программы была
[написана](http://manpages.bsd.lv/history.html) ещё в 1964 году. Потом roff
расширяли и переписывали, но назначение программы не поменялось.

Помимо форматирования man страниц roff используют для [вёрстки
книг](http://www.troff.org/pubs.html). Кто-то на StackOverflow даже
[утверждает](https://stackoverflow.com/a/336921/3665613), что чуть ли не все
книги издательства O'Reilly форматируются с помощью troff.

Классический язык форматирования roff документирован в
[руководстве](http://www.troff.org/54.pdf). Он представляет собой полноценный
язык программирования, имеющий запросы, определения макросов,
эскейп-последовательности, строковые переменные, цифровые или размерные регистры
и управление потоком исполнения. Сейчас в основном используется версия roff
переписанная проектом GNU - [groff](https://www.gnu.org/software/groff/). С
помощью groff я и попробовал сверстать свои [старые
слайды](https://speakerdeck.com/sergeyb/containers-in-the-upstream-kernel-as-compared-to-vz-kernel)
на языке разметки roff и посмотреть насколько это подходящий инструмент для
таких задач.

Для облегчения вёрстки можно использовать наборы макросов. В базовой поставке groff
есть предопределённые наборы макросов:

* [man](https://linux.die.net/man/7/groff_man) для оформления man страниц
* [ms](https://linux.die.net/man/7/groff_ms) для оформления писем, книг, техдокументации
* [me](https://linux.die.net/man/7/groff_me) для оформления техдокументации

Слайды можно верстать и на чистом языке разметки, но проще взять макрос
[gpresent](https://staff.fnwi.uva.nl/b.diertens/useful/gpresent/), который
добавляет поддержку порядкового номера слайда, название слайдов и т.д. и отчасти
упрощает вёрстку.

Пример текста, форматированный roff:

<!--
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
-->

```
.nr Pi 3

.DEFCOLOR ovz 0 0.8 0.48
.DEFCOLOR ovz 0 0.5 0.3
.TITLECOLOR ovz
.SUBTITLEFORMAT C
.SUBTITLECOLOR ovz
.FOOTERSIZE 2

.\" --- define some gpresent extension macros --------------------------
.de GPE_MULB
.nr gpe_colwr \\n(.l-\\$1-1n
.ie \\n[.$]>1 .ds gpe_vsp \\$2
.el .ds gpe_vsp 0.5v
.sp -\\*[gpe_vsp]
.MULB \\$1 1n \\n[gpe_colwr]u
.sp \\*[gpe_vsp]
..
.\" --- title page -----------------------------------------------------
.TITLE Containers in the upstream kernel
.sp -2v
.TITLE (as compared to VZ kernel)
.SUBTITLE "Kir Kolyshkin, Sergey Bronnikov"
.sp -0.5v
.SUBTITLE "Linux Plumbers 2015, Seattle"
.\".PSPIC openvz-logo.eps 13c
.ce
.GPE_SM ""
.GPE_SECTION INTRO
.SK
.de GPE_NEXT
.SK
..
.\" ====================================================================
.TITLE "Who we are?"
.BVL 1c
.LI "OpenVZ is an opensource implementation of Linux containers"
.BL
.LI
Kir Kolyshkin - leading OpenVZ for 10 years
.LI
Sergey Bronnikov - community manager of OpenVZ
.LE
.\" --------------------------------------------------------------------
.GPE_NEXT
.TITLE "OpenVZ contribution to the Linux kernel"
.\".ce
.\"Classic = literally half a century of history!
.\" --------------------------------------------------------------------
.GPE_NEXT
.TITLE "Is OpenVZ kernel upstreamed yet?"
.\" --------------------------------------------------------------------
.GPE_NEXT
.TITLE "Virtuozzo kernel changes"
.\" --------------------------------------------------------------------
.GPE_NEXT
.TITLE "Things we (still) need to add 1/2"
.BVL 1c
.LI "- Ploop and related ext4 changes"
.LI "- Memory mangement and accounting"
.BL
.LI
Backport of kmemcg
.LI
idle memory tracking (for vcmmd)
.LI
network buffers memory accounting
.LI
OOM killer virtualization
.LI "/sys and /proc virtualization"
.LE
.\" --------------------------------------------------------------------
.GPE_NEXT
.TITLE "Things we (still) need to add 2/2"
.BVL 1c
.LI "- Misc legacy (vziolimit, vzlist, vzredir, vznetstat, beancounters...)"
.LI "- Network: venet, iptables (marks)"
.LI "- FUSE upstream backports"
.LI "- Printk virtualization"
.LI "- /dev/console virtualization"
.LI "- Time namespace (for monotonic timers wrt migration)"
.LI "- Misc legacy (vziolimit, vzlist, vzredir, vznetstat, beancounters...)"
.BL
.LI
Beancounters: numiptent, numfile, numproc
.LE
.\" --------------------------------------------------------------------
.GPE_NEXT
.TITLE "Any patches? Questions?"
.BVL 1c
.ce
.P
.LI "Kir Kolyshkin <kir@openvz.org>, @kolyshkin"
.LI "Sergey Bronnikov <sergeyb@openvz.org>, @estet"
.LE
```

Собрать слайды можно например так:

	groff -mm -mpresent -p openvz.roff > openvz.pps
	presentps -l < openvz.pps > openvz.ps
	ps2pdf openvz.ps


## Резюме:

Использовать groff для вёрстки красивых, хороших слайдов не так тривиально, как
показалось на первый взгляд. Но подкупает доступность это утилиты на любой
системе с Linux/BSD. Поэтому если у вас слайды состоят из списков и картинок, то
groff вполне себе подойдет для этой задачи.

Для тех, кто дочитал до конца: roff это акроним от типографского термина
«runoff» — «печатать тираж».
