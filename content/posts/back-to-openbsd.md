---
date: 2017-07-02T00:00:00Z
title: Обратно на OpenBSD
tags: ["opensource", "openbsd", "personal"]
---

Поскольку мой основной ноутбук стал совсем старым (шутка ли MBP Mid 2010), то я
стал раздумывать над его заменой. После исследования наиболее актуальных
моделей на Яндекс.Маркете в финал вышли: MacBook Air, Dell Latitude, Lenovo X1
Carbon. MBA у меня был пару лет во время работы в Virtuozzo и вцелом показался
очень удобным за исключением того, что у него был глянцевый экран и не было
трекпойнта, который мне после ThinkPadов очень полюбился. Серия Dell Latitude
понравилась своей такой же строгостью стиля как старые ThinkPadы. И выбирая
между Latitude и X1 Carbon я всё-таки остановил свой выбор на X1.

С операционной системой долго выбирать не пришлось - я знал, что раз уж
прийдется переезжать с одного ноутбука на другой, то это мой шанс опять
вернуться на OpenBSD, по которой я успел сильно соскучиться за несколько лет
использования Mac OS. У одного из разработчиков OpenBSD Reyk Floeter тоже X1 и
он [описал](https://gist.github.com/reyk/80dca43c8bcfa76d2a7ff147ea64d442)
проблемы OpenBSD на X1. Поэтому я заранее знал к чему нужно быть готовым. Но
после покупки мне всё равно пришлось повозиться с установкой.

Во-первых, на ноутбуке стояла чистая лицензионная Windows и перед
форматированием диска хотелось её сохранить. Я знаю про CloneZilla, g4u,
SystemRescueCD и другие инструменты, с помощью которых можно загрузиться и
сделать полный бэкап диска. Но для g4u нужен CDROM, которого нет в X1, для
SystemRescueCD не получилось сделать загрузочную флешку, а c CloneZilla что-то
тоже не получилось. И тут выяснилось, что кроме установочной флешки OpenBSD мне
больше ничего не надо - в установочном образе есть dd и ядро прекрасно
определяет мой внешний USB HDD.

Во-вторых сразу после начала загрузки в EFI режиме гас экран :)
Проблема решилась включением опции CSM в BIOS.

И в третьих были проблемы с настройкой сети во время установки. Дело в том, что
установочный образ содержит только ядро и скрипты для установки, а необходимые
архивы с установочными файлами загружаются перед самой установкой с ближайшего
зеркала. Проблема заключалась в том, что беспроводной сетевой адаптер требует
загрузки несвободной прошивки, которую можно загрузить только после установки,
а встроенный проводной адаптер не работал с настройками BIOS по умолчанию:

> em0 at pci0 dev 31 function 6 "Intel I219-V" rev 0x21: msi
> em0: Hardware Initialization Failed
> em0: Unable to initialize the hardware 

Потом я конечно разобрался, что проблема была из-за включенной опции 'Wake on
Lan' в BIOS и позже нашел обсуждение этого бага в
[рассылке](http://openbsd-archive.7691.n7.nabble.com/Hardware-Initialization-Failed-with-Intel-I219-V-td309347.html).

Кстати пока выбирал себе ноутбук я
[собрал](http://dmesgd.nycbug.org/index.cgi?do=index&fts=Sergey+Bronnikov) с
них dmesg. Если выбираете Latitude, то можно заранее посмотреть что из железа
не работает.
