---
date: 2015-01-23T00:00:00Z
title: Фильтры для почты в GMail
url: /2015/01/23/gmail-filters.html
tags: ["productivity", "personal"]
---

Если вы активный пользователь GMail, то вам пригодятся знания
об автоматической генерации правил для фильтров.

Как вы возможно знаете, GMail позволяет [гибко](https://support.google.com/mail/answer/7190?hl=en)
настраивать [фильтры для писем](https://mail.google.com/mail/u/0/?shva=1#settings/filters).

Такие правила можно настраивать вручную с помощью Gmail UI:

<img src="/images/gmail-filters.png" alt="Фильтры GMail">

Но кроме ручного создания правил есть ещё один способ -
GMail позволяет импортировать готовый XML файл с вашими правилами
и не возиться с их кропотливым созданием через UI.
Это очень удобно когда правил [много](https://twitter.com/antifuchs/status/283753876807614464)
или, например, у вас не один почтовый ящик на GMail или вам лень тыкать мышкой в UI.

Для создания XML можно использовать проект [GMail-britta](https://github.com/antifuchs/gmail-britta),
который предоставляет возможность описания правил на Ruby DSL
и последующей генерации XML на основе этих правил.

Формат правил примерно такой:

```
  # OpenBSD
  filter {
    has [{:or => [
      'misc@openbsd.org',
      'bugs@openbsd.org',
      'ports@openbsd.org',
      'dmesg@openbsd.org',
    ].map{|email| "from:#{email}"}}]
    label 'OpenBSD'
  }
```
<br>
далее устанавливаем [gmail-britta](https://github.com/antifuchs/gmail-britta):

	gem install gmail-britta

<br>
генерируем XML:

	ruby filters.rb

<br>
и загружаем полученный XML файл в [настройках GMail](https://mail.google.com/mail/u/0/?shva=1#settings/filters).

У меня пока [не очень развесистый файл с правилами](https://github.com/ligurio/gmail-filters),
но его можно использовать в качестве отправной точки. Ещё есть
[пример](https://github.com/antifuchs/gmail-britta/blob/master/examples/asf.rb)
в репозитории gmail-britta.

Fin
