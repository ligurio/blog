---
date: 2016-07-14T00:00:00Z
title: Поддержка pledge(2) в языках программирования
tags: ["opensource", "openbsd"]
---

Одним из новшеств релиза OpenBSD 5.9 было добавление системного вызова
[pledge(2)](http://man.openbsd.org/OpenBSD-current/man2/pledge.2).

Pledge похож на множество других механизмов ограничения доступа к системным
вызовам, таких как seccomp, capsicum и systrace, но в отличие от них разработан
с оглядкой на максимальное упрощение применения.

Pledge требует внесения в приложения специальных аннотаций, определяющих уровень
привилегий на текущем этапе выполнения приложения. Вместо детализации на уровне
отдельных системных вызовов, Pledge манипулирует классами доступа. Аннотации
выставляются через указание функции pledge(), первым аргументом которой является
список разрешённых классов системных вызовов, а вторым - массив файловых путей,
куда разрешён доступ. После сборки и запуска модифицированного приложения, ядро
берёт на себя работу по контролю соблюдения заданных правил. При этом вместо
традиционной блокировки доступа к неразрешённым системным вызовов применён иной
подход - в случае выявления несанкционированного поведения приложение
принудительно завершается. По замыслу разработчиков подобный подход заметно
усложняет исследование возможных путей обхода ограничений в процессе атаки.

Больше узнать про механизм можно из доклада Тео:
[видео](http://www.thedotpost.com/2016/05/theo-de-raadt-privilege-separation-and-pledge)
и [слайды](http://www.openbsd.org/papers/dot2016.pdf).

Естественно, что разработчики добавили возможность использования pledge(2)
только для C. Поэтому я очень удивился когда обнаружил, что разные
заинтересованные люди из сообщества самостоятельно сделали поддержку pledge(2) для
других языков программирования: [Javascript](https://www.npmjs.com/package/node-pledge),
[Perl](http://cvsweb.openbsd.org/cgi-bin/cvsweb/src/gnu/usr.bin/perl/cpan/OpenBSD-Pledge/), [Rust](http://pastebin.com/P89kV6uR),
[Python](https://github.com/jarmani/py-openbsd-pledge), [Golang](https://github.com/ylih/extrasys),
[Lua](https://github.com/n0la/lua-openbsd), [Haskell](http://openbsd-archive.7691.n7.nabble.com/pledge-2-binding-for-Haskell-td287889.html), [.NET (C#, F# and VB)](https://github.com/NattyNarwhal/pledge.cs), [ksh](https://github.com/netzbasis/openbsd-src/compare/master...hf-ksh_builtin_pledge), [Erlang](https://github.com/msantos/prx/wiki/prx#pledge-3), [Scheme](http://wiki.call-cc.org/eggref/4/pledge),
[Nim](https://github.com/euantorano/pledge.nim).
