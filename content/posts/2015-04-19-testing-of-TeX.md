---
date: 2015-04-19T00:00:00Z
title: Тестирование системы компьютерной вёрстки TeX
tags: ["opensource", "softwaretesting"]
url: /2015/04/19/testing-of-TeX.html
---

Нет, мне пока не удалось сделать интервью с Дональдом Кнутом
о тестировании TeX. Да в этом и не было неоходимости, потому что он
описал (и сверстал в TeX) тестирование системы компьютерной вёрстки
в двух документах:
«[Пыточное тестирование TeX](http://texdoc.net/texmf-dist/doc/generic/knuth/tex/tripman.pdf)»
и «[Ошибки TeX](http://texdoc.net/texmf-dist/doc/generic/knuth/errata/errorlog.pdf)».

[Первый документ](http://texdoc.net/texmf-dist/doc/generic/knuth/tex/tripman.pdf)
описывает как проводилось тестирование компилятора TeX. Ключевая мысль использованного подхода:

<!--
ftp://tug.ctan.org/pub/tex-archive/systems/knuth/dist/tex/tripman.tex
ftp://tug.ctan.org/pub/tex-archive/systems/knuth/dist/tex/trip.tex
ftp://tug.ctan.org/pub/tex-archive/systems/knuth/dist/errata/tex82.bug
-->

> Идея состоит в том, чтобы составить такой тестовый файл,
> который будет настолько сильно отличаться от типичного документа
> пользователя насколько только можно себе представить.

> ...

> Вместо того, чтобы проверять компилятор правильно оформленными документами,
> нужно, чтобы он мог обрабатывать некорректно оформленные документы.

Вместе с TeX поставляется файл
[TRIP.TEX](ftp://tug.ctan.org/pub/tex-archive/systems/knuth/dist/tex/trip.tex),
созданный в соответствии с этим принципом.

<!--
> The contents of this test file are so remote from what people actually do with TEX,
> I feel apologetic if I have to explain the correct translation of TRIP.TEX;
> nobody really cares about most of the nitty-gritty rules
> that are involved. Yet I believe TRIP exemplifies the sort of test program
> that has outstanding diagnosticability, as explained above.
-->

<!--
> Содержание этого тестового файла настолько далеко от того,
> что люди на самом деле делать с TEX, я чувствую, извинялся,
> если я должен объяснить правильный перевод TRIP.TEX;
> никто не заботится о большинстве мельчайших правил, которые участвуют.
> Тем не менее, я считаю, TRIP примером рода тестовую программу,
> которая имеет выдающуюся диагностического способности, как описано выше.
-->

<!--
> I have been having good luck with a somewhat different approach,
> first used in 1960 to debug an ALGOL compiler. The idea is to construct
> a test file that is about as different from a typical user application as could be
> imagined. Instead of testing things that people normally want to do,
> the file tests complicated things that people would never dare to think of,
> and it embeds these complexities in still more arcane constructions.
> Instead of trying to make the compiler do the right thing, the goal
> is to make it fail (until the bugs have all been found).
> To write such a fiendish test routine, one simply gets into a nasty
> frame of mind and tries to do everythingin the unexpected way.
> Parameters that are normally positive are set negative or zero;
> borderline cases arepushed to the limit; deliberate errors are made
> in hopes that the compiler will not be able to recover properly from them.
-->

[Второй документ](http://texdoc.net/texmf-dist/doc/generic/knuth/errata/errorlog.pdf)
содержит подробное описание всех дефектов TeX, о которых сообщали Дональду Кнуту с 1978 года.
После создания TeX Дональд Кнут объявил, что будет выплачивать $2.56 каждому
нашедшему проблему в его программе и каждый год сумма будет увеличиваться,
пока не достигнет суммы в $327.68. За всё время существования программы
было найдено 947 дефектов и последний был исправлен 6 января 2014 года.
Утверждается, что несмотря на достаточно большое количество багов Кнут
потратил не так много денег из-за того, что люди не обналичивали выписанные им чеки
и оставляли себе на память как подтверждение того, что они нашли один из багов.
То есть он организовал что-то наподобие программы [bug bounty](https://en.wikipedia.org/wiki/Bug_bounty_program).

<a href="https://en.wikipedia.org/wiki/Knuth_reward_check"><image src="https://upload.wikimedia.org/wikipedia/commons/6/63/Knuth_cod.JPG"></a>

<!--
https://www.tug.org/whatis.html

> Knuth has kept a very detailed log of all the bugs he has corrected
> and changes he has made in the program since 1982; as of 2008,
> the list contains 427 entries, not including the version modification
> that should be done after his death as the final change in TeX.
> Donald Knuth offers monetary awards to people who find and report a bug in TeX.
> The award per bug started at $2.56 (one "hexadecimal dollar"]) and doubled
> every year until it was frozen at its current value of $327.68.
> Knuth has lost relatively little money as there have been very few bugs claimed.
> In addition, recipients have been known to frame their check as proof that
> they found a bug in TeX rather than cashing it. Due to scammers finding
> scanned copies of his checks on the internet and using them to try to
> drain his bank account, Knuth no longer sends out real checks,
> but those who submit bug reports can get credit at The Bank of San Serriffe instead.
-->

Fin
