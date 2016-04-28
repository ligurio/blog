---
date: 2014-04-22T00:00:00Z
published: false
title: Разница в подходах
url: /2014/04/22/over-engineering-as-a-service/
---

Простой пример, демонстрирующий разницу в подходах к реализации получения *random seed*
на раннем старте операционной системы.

### Как это сделали в Canonical для Ubuntu

На стадии загрузки запускается специальный сервис pollinate,
который обращается к https://entropy.ubuntu.com (в браузере не работает),
получает *random seeds* и записывает его в */dev/urandom*.

В [презентации](http://blog.dustinkirkland.com/2014/02/random-seeds-in-ubuntu-1404-lts-cloud.html)
описываются детали реализации:

* сервис написан на языке Go и содержит всего 50 строк кода
* сервис в ОС запускается с помощью Upstart джоба
* сервис в ОС это всего лишь обёртка для *curl*

<br>
### Как это сделали в проекте OpenBSD

Энтропия получается из загрузочного блока на старте операционной системы.

[Анонс в рассылке tech@openbsd.org](http://marc.info/?l=openbsd-tech&m=138829898720574&w=4)
и [отчёт с хакатона n2k14](http://undeadly.org/cgi?action=article&sid=20140127083112)

Наверняка у обоих решений решений есть как и плюсы так и минусы.
Но очевидно, что решение Canonical это классический пример
[over engineered software](https://en.wikipedia.org/wiki/Overengineering).
