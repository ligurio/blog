---
date: 2017-03-05T00:00:00Z
title: mandoc не только для документации
tags: ["opensource", "openbsd"]
---

Ранее я [рассказывал](/2016/05/17/geek-slides/) о своих тщетных попытках
использования roff для форматирования слайдов презентаций, чтобы избавиться на
своих машинах от монструозного LaTeX. Тщетных потому что дальше экспериментов
дело не пошло - для слайдов удобнее beamer.

Для резюме я тоже использую LaTeX, но там форматирование проще, чем для слайдов
и для него разметка [mdoc](http://man.openbsd.org/mdoc.7) мне показалась
удобнее. Так же как и с LaTeX можно сделать один файл и с помощью
[mandoc](http://man.openbsd.org/mandoc.1) сконвертировать в HTML, PDF и [другие
форматы](http://man.openbsd.org/mandoc.1#Output_Formats). Недавно
[добавили](http://undeadly.org/cgi?action=article&sid=20170304230520) ещё и
популярный markdown. Качество на выходе вполне приличное, чтобы было не стыдно
показать незнакомым людям.

Для примера оформил резюме в виде страницы документации:

```
.Dd 2017-02-28
.Dt BRONNIKOV \ SERGEY 7
.Os
.Sh NAME
.Nm Sergey Bronnikov
.Nd software engineer
.Sh SYNOPSIS
.Bl -bullet -width 1n
.It
Software engineer with experience on BSD, POSIX and Linux systems.
.It
Active contributor to a broad range of Open Source projects.
.It
Strong focus on quality of software.
.It
Deep background in Unix administration, operations and management.
.El
.Sh WORK HISTORY
.Bl -tag -width 2n
.Bl -bullet -width 1n
.El
.It Postgres Professional (Sep 2016 - Present) - SQA engineer
.Bl -bullet -width 1n
.El
.It Virtuozzo (Mar 2015 - Sep 2016) - OpenVZ community manager
.Bl -bullet -width 1n
.El
.It Parallels Inc. (Sep 2011 - Mar 2015) - SQA manager
.Bl -bullet -width 1n
.El
.It Parallels Inc. (Apr 2005 - Sep 2011) - SQA engineer
.Bl -bullet -width 1n
.El
.El
.Sh EXAMPLES
.Bl -bullet -width 1n
.It
OpenBSD developer maintaining various ports
.It
Multitenancy support in Docker
.Lk https://github.com/ligurio/docker/compare/docker-multitenancy
.It
Software testing results analysis tool
.Lk https://github.com/ligurio/recidive
.It
PostgreSQL microbenchmarks
.Lk https://github.com/ligurio/postgresql-atomics
.It
PostgreSQL extension
.Lk https://github.com/ligurio/pg_feedback
.It
LibVirt driver with OpenBSD hypervisor support
.Lk https://github.com/ligurio/libvirt/compare/openbsd
.El
.Sh SEE ALSO
.Bl -bullet -width 1n
.It
.Lk https://bronevichok.ru/ "Homepage"
.El
```

На выходе получается вот такая [HTML страница](https://bronevichok.ru/trash/resume-mdoc.html).
