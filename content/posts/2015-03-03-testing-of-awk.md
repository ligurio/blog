---
date: 2015-03-03T00:00:00Z
title: Тестирование утилиты awk
tags: ["opensource", "softwaretesting"]
url: /2015/03/03/testing-of-awk.html
---

Организация [Usenix](https://www.usenix.org/) издаёт журнал ;login:
о системном администрировании, разработке ПО и т.д.
Помимо этих тем иногда публикуют статьи о тестировании ПО.
Например была опубликована [статья Брайана Кернигана](https://www.usenix.org/publications/login/april-2006-volume-31-number-2/code-testing-and-its-role-teaching)
о том, как он с другими авторами утилиты awk тестировал эту утилиту.
Брайан приводит статистику: код awk состоит из примерно 6000 строк кода,
тогда как количество тестов из порядка 7000 строк кода в более чем 350 файлах.
В конце он приводит советы по тестированию. Статья написана в 2006 году,
но актуальности не потеряла до сих пор - все приведённые советы по тестированию
можно использовать и в других проектах.

P.S. Большинство статей журнала после публикации [выкладываются на сайте](https://www.usenix.org/publications/login)
в свободный доступ, поэтому если интересно, то можете сами покопаться в архиве.
Я для себя нашёл ещё несколько интересных статей. Забавно, что практически
в каждом номере есть статья о Perl. <s>Забавно потому, что Perl мёртв.</s>
