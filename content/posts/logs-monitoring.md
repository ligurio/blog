---
date: 2016-09-03T00:00:00Z
title: Не оставляем сервер без присмотра
---

Есть у меня один небольшой сервер, который работает круглосуточно, на отлично
выполняет все возложенные на него задачи и не требует к себе внимания.

Но, чтобы моя душа была спокойна, сервер присылает отчёты от
[security(8)](http://man.openbsd.org/OpenBSD-current/man8/security.8) и
нотификации от monit. И то и другое, к сожалению, не покрывает мониторинг
событий из логов и я озадачился поисков штуки, которая бы мониторила логи и
присылала отчёты.

В ответ на мой вопрос в твиттере мне предложили вариант со связкой
[filebeat](https://www.elastic.co/products/beats/filebeat) и
[logstash](https://www.elastic.co/products/logstash): на целевую машину
устанавливается filebeat и все логи отправляются в него, а он уже отправляет их
в logstash, где их можно анализировать.

<blockquote class="twitter-tweet" data-lang="ru"><p lang="en" dir="ltr"><a
href="https://twitter.com/estet">@estet</a> <a
href="https://twitter.com/AFresh1">@AFresh1</a> shipping them off with filebeat
to a logstash instance with kibana on top works pretty good for me</p>&mdash;
Jasper (@jasper_la) <a
href="https://twitter.com/jasper_la/status/750923234720251904">7 июля 2016
г.</a></blockquote> <script async src="//platform.twitter.com/widgets.js"
charset="utf-8"></script>

Всё бы хорошо, но поднимать где-то logstash только из-за логов очень не
хотелось. Я верил, что должно быть уже готовое и более легковесное решение.  И
оно нашлось. Возможно вы знаете про tmux - это утилита, предоставляющая
пользователю доступ к нескольким терминалам в рамках одного экрана, её написал
Nicholas Marriott. Этот же автор написал [logfmon](https://github.com/nicm/logfmon).
Это простенький демон, который мониторит логи и присылает нотификации на почту
при появлении новых сообщений. Неинтересные сообщения можно игнорировать, если
описать их регулярным выражением в конфиге.

_Добавлено (4 сентября, 00:02):_ строго говоря, есть ещё один простой способ
мониторить логи - syslogd позволяет отправлять сообщения другим приложениям
через pipe. Это стандартная функциональность syslogd, но нашёл я её не в мане, а
в этой [статье](http://www.brettglass.com/logmonitors/paper.html).
