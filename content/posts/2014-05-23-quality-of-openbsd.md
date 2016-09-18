---
date: 2014-05-23T00:00:00Z
title: Обеспечение качества в проекте OpenBSD
url: /2014/05/23/quality-of-openbsd.html
tags: ["openbsd", "softwaretesting"]
---

Так как я давно слежу за проектом OpenBSD и даже [немного участвую](http://openports.se/search.php?stype=maintainer&so=estetus) в нём,
то мне стало интересно: чем обеспечивается качество в этом проекте?

Я попробовал проанализировать процессы и собрать воедино все те вещи, которые способствуют
повышению качества этой ОС.

## Юнит-тесты

В базовой системе есть простой фреймворк для написания тестов
[bsd.regress.mk(5)](http://www.openbsd.org/cgi-bin/man.cgi?query=bsd.regress.mk&apropos=0&sektion=0&manpath=OpenBSD+Current&arch=i386&format=html).
Разработчики по возможности пишут тесты в
[src/regress](http://www.openbsd.org/cgi-bin/cvsweb/src/regress/).
Правда в основной своей массе они представляют собой достаточно простые тесты,
и, как следствие, не покрывают сложные конфигурации и не требуют
настройки сложного окружения для запуска теста.
Для Xenocara есть свои [небольшие тесты](http://www.openbsd.org/cgi-bin/cvsweb/X11/test/),
унаследованные от [X.org](http://www.x.org/wiki/).

## Использование встроенных тестов в портах

Для 3rd party ПО в OpenBSD существуют так называемые порты. Если приложение,
для которого делается порт, содержит тесты, то эти тесты используются
при создании порта для нового приложения, при обновлениях порта на новую версию приложения и т.д.
Новые порты принимаются только при успешном прохождении тестов.
Я посчитал, что в -current OpenBSD около 8700 портов, и только в 2444 из них нет регресионных тестов.
Таким образом гарантируется, что прохождение тестов гарантирует успешную работу ПО на новой платформе.

Механизм запуска тестов интегрирован в [bsd.port.mk(5)](http://www.openbsd.org/cgi-bin/man.cgi?query=bsd.port.mk&apropos=0&sektion=0&manpath=OpenBSD+Current&arch=i386&format=html).

## Call for testing

Добавление нового функционала сопровождается тестированием среди самих разработчиков,
а также так называемыми *call for testing*, целью которых является призвать как можно большее количество
пользователей для тестирования. Например
[keydisk-based softraid crypto volumes](http://undeadly.org/cgi?action=article&sid=20131112031806)
или [PF internals redesign](http://www.undeadly.org/cgi?action=article&sid=20080526060209).

## [Eating your own dog food](https://en.wikipedia.org/wiki/Eating_your_own_dog_food)

На всех машинах, составляющих инфраструктуру проекта, используется OpenBSD
и это само по себе является тестированием ОС.
Вот комментарий на эту тему от [espie@](http://marc.info/?l=openbsd-misc&m=139012690903249&w=2):

 «You guys got to realize that   actual builds, on real hardware, find _a lot
 of bugs_. In particular, missing dependencies in Makefiles and variations of
 these.   These bugs are often _highly_ timing-dependent.  Having fast machines
 with slow disks, slow machines with fast disks, single processor oldies,
 multi-processor new things, 32 bit machines, 64 bit machines... every single
 new combination  will exercise the build in a different way, and find new bugs.»

## Ревью кода

Сложно переоценить значение ревью кода в открытых проектах.
К тому же ревью кода увеличивает «bus factor».

Вот какие доводы  приводит Danese Cooper в своей презентации
[Open Source Development In Practice](http://r0.unctad.org/ecommerce/event_docs/fossem/cooper.pdf) (pdf):

* «Massive peer review = more QA staff than you can hire»
* «Massive peer review also promotes higher quality check-ins»
* «Massive peer review means feedback is truly random»
<br>

## Избавление от устаревшего кода

Разработчики стараются избавляться от устаревшего кода.
Так, например, случилось с [Kerberos](http://undeadly.org/cgi?action=article&sid=20140425065910),
Bluetooth, [altq](http://undeadly.org/cgi?action=article&sid=20140419151959), [Apache](http://undeadly.org/cgi?action=article&sid=20140314080734).
Обычно это случается, когда нет активного ментейнера для этого кода
или есть альтернатива с более простой реализацией (как c altq или apache).

## Обязательное тестирование на нескольких архитектурах

Платформозависимый код обязательно тестируется на нескольких архитектурах.
В OpenBSD не используется кросскомпиляция кода вообще, в отличие, например,
от [NetBSD](https://www.netbsd.org/docs/guide/en/chap-build.html).

 «You should try to test the driver as much as possible.
 Both Coherent/Incoherent DMA (ie i386/sparc64);
 Strict Memory Alignment architecture (ie sparc64/alpha);
 32/64 bit clean (ie i386/amd64); Big/Little Endian (ie sparc64/i386).»
- [Driver Architecture and Implementation in OpenBSD](http://openbsd.org/papers/opencon06-drivers/mgp00018.html):

## Ежедневные снапшоты

Для выявления регрессий в процессе разработки собираются снапшоты для каждой архитектуры.

Полезные презентации:

* [The OpenBSD Culture](http://www.openbsd.org/papers/opencon06-culture.pdf) (pdf) David Gwynne
* [OpenBSD as a Development Environment](http://www.openbsd.org/papers/asiabsdcon07-development/index.html) Ryan McBride
* [The OpenBSD release process](http://www.openbsd.org/papers/asiabsdcon2009-release_engineering) Theo de Raadt
* [How OpenBSD is made](http://undeadly.org/cgi?action=article&sid=20080911114306&mode=expanded)

<br>
