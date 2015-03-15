---
layout: post
title: Открытые базы данных дефектов в закрытом ПО
---

{{ page.title }}
================

<p class="meta">13 марта 2015 - Москва</p>

В [предыдущем посте](http://blog.bronevichok.ru/2015/03/12/bugs-in-closed-software-1.html)
я описал открытые списки проблем в безопасности в закрытом ПО. Другие два проекта,
о которых я расскажу ниже, ориентированы на пользовательские проблемы и дефекты от разработчиков.

## Open Radar

[Apple Radar](http://siliconrus.com/2015/02/apple-test/) -
это закрытый багтрекер компании Apple, в котором внешние разработчики
могут видеть только те баги, о которых они сами сообщили. И такая закрытость
со стороны Apple является причиной многих споров в сообществе разработчиков для экосистемы Apple.

<blockquote class="twitter-tweet" lang="en"><p>I&#39;d love to make a public rdar database. I&#39;ve got some ideas on how to implement it. Anyone else interested?</p>&mdash; Dave Dribin (@ddribin) <a href="https://twitter.com/ddribin/status/1007346215">November 15, 2008</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

Проект [OpenRadar](http://openradar.me) - это попытка собрать в одном месте все ошибки,
которые сообщают другие разработчики. Он использует те же идентификационные номера,
что и Apple Radar, поэтому легко установить соответствие между дефектами в Apple Radar и OpenRadar.
Проект был анонсирован на [Ars Technica](http://arstechnica.com/news/open-radar-using-social-networking-to-squash-apple-bugs.ars) в 2008 году и активен до сих пор. В Open Radar есть строгое правило
- обнаруженная проблема должна быть добавлена в Apple Radar в первую очередь.
И только потом в OpenRadar.

Dave Dribin, один из инициаторов создания проекта,
[пишет](http://www.dribin.org/dave/blog/archives/2008/11/16/open_radar/), что
в багтрекер было добавлено 85 дефектов в первые 24 часа существования проекта.

В своём блоге [он описывает](http://www.dribin.org/dave/blog/archives/2008/11/16/open_radar/)
основные цели проекта:

Проект никак не избавляет вас от Это не заменяет сообщить об ошибке с Apple.
Вы должны сообщить все проблемы, которые обнаружите, в том числе те, о которых
уже сообщали. Инженеры компании уже неоднократно упоминали, что чем больше дубликатов,
тем более высокий приоритет получает проблема. Это что-то наподобие системы голосования -
Apple исправит ошибки, влияющие на большинство людей.

Tim Burks, ментейнер проекта немного рассказал о деталях проекта OpenRadar:

> Как проект рекламировался среди разработчиков?
> Кто-то модерирует появление новых дефектов в проекте?

> > В основном люди узнают об OpenRadar из твиттера, кроме сообщений в твиттере
> > больше ничего не предпринимается для раскрутки проекта. В проекте отсутствует модерация,
> > но иногда люди указывает мне на проблемы и я разбираюсь с ними или связываюсь с автором.

<!--
People usually find out about OpenRadar on Twitter - that's generally
all that we do to promote it. There's no moderation other than
occasionally someone points out a problem post to me and I take it
down or contact the poster.
-->

> Какая статистика посещений OpenRadar и есть ли информация о посещениях
> OpenRadar с внутренних адресов компании Apple?

> > Я не слежу внимательно за статистикой посещений, но судя по данным App Engine
> > главная страница имеет около ста посещений в день. Я знаю многих людей в Apple, которые
> > знают об OpenRadar, но я думаю, что они в основном используют официальный багтрекер, как
> > официальный источник о проблемах.

<!--
I don't watch traffic closely but App Engine reports a few hundred
hits a day on the main page. I know many people in Apple who are aware
of Open Radar, but I think they use the official Radar as their
official source of problem reports.
-->

Планировалось сделать приложение, которое будет заводить дефекты в обоих багтрекерах,
но воз и ныне там:

<blockquote class="twitter-tweet" lang="en"><p><a href="https://twitter.com/sanmarcos">@sanmarcos</a> <a href="https://twitter.com/rentzsch">@rentzsch</a> has started work on a Cocoa app that submits to both sites. And you could always s/get/write :)</p>&mdash; openradar (@openradar) <a href="https://twitter.com/openradar/status/2159197189">June 13, 2009</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

Но зато есть приложение под Mac OS - [QuickRadar](https://github.com/amyworrall/QuickRadar).
<!-- <https://github.com/rentzsch/OpenRadarApp -->

Немного статистики и технических деталей:
По состоянию на 2009-й год было добавлено 862 дефектов 244 пользователями.
Багтрекер [написан](https://github.com/timburks/openradar) с нуля на Python
и работает на платформе Google Apps. Багтрекер имеет [API](http://openradar.appspot.com/api/radars),
что позволяет интегрировать его с другими проектами. Изначально планировалось сделать
трансляцию всех новых дефектов в Twitter, но оба твиттера давно не обновлялись:
ни [@openradarstream](https://twitter.com/openradarstream), ни [@openradar](https://twitter.com/openradar).

<!-- старый вариант багтрекера http://open-radar.lighthouseapp.com/ -->

## Google bugs

[Unofficial Google bugs](https://code.google.com/p/googlebugs/) - неофициальный багтрекер
продуктов и сервисов Google. По состоянию на 2015 год [добавлено 646 различных проблем](https://code.google.com/p/googlebugs/issues/list). Идея о создании проекта родилась на
[Google Blogoscoped](http://blogoscoped.com/forum/77995.html).
Проект имеет пять модераторов, которые следят за отсутствием спама в багтрекере и конструктивностью
в описании дефектов. Но актуальность дефектов оставляет желать лучшего -
до сих пор открыты проблемы [Google Reader](https://www.google.com/reader/about/),
который компания Google закрыла ещё в 2013 году.

----

P.S. Для меня удивительно, что оба проекта используют закрытые платформы других компаний -
Google Code и Google Apps. Я бы для таких проектов выбирал что-то более независимое :)

<!--
## Панбагон

- <http://habrahabr.ru/post/63430/>
- <http://software-testing.ru/community/blog/panbugon/>
- <http://habrahabr.ru/post/81390/#comment_3815233>

## Is there a problem?

- <http://IsThereAProblemHere.com>

А вы знаете ещё подобные примеры?
## «Билайн»: народный контроль

Мой обзор не ограничивается багтрекерами для программного обеспечения.
Отличный пример подала компания Билайн - они [сделали](http://habrahabr.ru/company/beeline/blog/250387/)
свободно доступной карту, на которой отмечены места с плохим покрытием связи.

## Геоинформационный портал «Наш город»

Портал Наш город создан для <http://gorod.mos.ru/?show=problem>
-->
