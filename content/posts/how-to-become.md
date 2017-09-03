---
date: 2017-09-01T00:00:00Z
title: Как стать тестировщиком
tags: ["softwaretesting"]
draft: true
---

<img="https://habrastorage.org/getpro/habr/post_images/5e3/b8c/361/5e3b8c3617ce9d549ca9225b6ec95946.png">

Мир IT стремительно меняется. Появляются новые технологии и зачастую один
инструмент может олицетворять всю технологию: JMeter, PyTest. И самое
продуктивное изучение это чтение документации, но документация бывает скучной,
поэтому в некоторых случаях стоит ссылка на видео или даже слайды для понимания
самой сути без погружения в большое количество деталей.

Список будет полезен будущим тестировщикам ПО: изучив все предлагаемые
материалы у него будет хорошая теоретическая база и с ней он будет готов пройти
серьезное собеседование на позицию инженера по тестированию ПО. Список включает
большое количество бесплатных курсов и книг, поэтому доступен даже тем, у кого
не так много денег на самообразование. Но бесплатность была не единственным
критерием для выбора источника знаний. В первую очередь оценивался формат
подачи информации и основательность. Лучше на старте карьеры разобраться с
принципами нагрузочного тестирования и самому разобраться с инструментами с
помощью документаии, чем овладеть одним инструментом и не понимать сути.

Список будет полезен менеджерам и тимлидам: дайте список кандидату и попросите
отметить темы, в которых он хорошо разбирается и книги, которые он прочел.

- не фокусироваться на инструментах
- первый шаг - изучить приведенные источники, если нужно более глубокое
  погружение, то каждый из источников содержит ссылки на другие по этой теме.
Выбирайте и изучайте дальше.

Буду благодарен за распространение этого списка среди ваших знакомых
тестировщиков. Я считаю что в наших силах повысить технический уровень
начинающих коллег за счёт рекомендаций хороших источников профессиональных
знаний.

Самая главная полезность курсов (еси эти курсы действительно для обучения, а не
для стрижки «капусты») — это возможность получить фидбек от выполненных
заданий. Если на курсах обещается только «теория» — можно смело забивать на
такие курсы.  Но для того, чтобы этот фидбек получить и вынести из него
максимально информации — требуется огромная работа и изучение материалов вне
курсов.  При необходимости курсы можно заменить: желанием + невероятной
усидчивостью + наличием работающего знакомого (который может провести ревью и
дать обратную связь).  Конечно компаний много и требования разные, но имхо
кроме Савина и 30 минутного урока по БД — нужно потратить значительноевремя на
то, чтобы разобраться — как работают те же веб (мобайл) — приложения. Чтобы не
было потом ситуации, когда джуниор/трейни с горящими глазами наизусть
рассказывает весь словарь ISQTB терминов (порой не понимая и половины), а потом
сыпется на вопросе — что такое IP адрес. (молчу уже про навыки
программирования).  Вывод: попасть в тестирование можно — но курсы — это только
20% от того, что нужно знать. 

А что дальше?

* тестирование opensource
  * Бартунов Олег, Карьера в Open Source https://www.youtube.com/watch?v=J9izn9LTbHo
  * https://www.libreoffice.org/community/qa/
  * Как стать участником опенсорс-проекта, даже если не умеешь писать код? https://xakep.ru/2015/12/29/open-source-career/
* ментор

До конца лета осталось два месяца, пусть этот список будет вашим списком на
лето. Чтобы к осени у вас была прочная база знания для работы в тестировании
ПО.


### Общие знания о тестировании

* Книга [Тестирование программного обеспечения](https://www.ozon.ru/context/detail/id/1280560/) - Сэм Канер
* [?] Книга [Тестирование Дот Ком, или Пособие по жестокому обращению с багами в интернет-стартапах](https://www.ozon.ru/context/detail/id/3128208/) - Роман Савин
* Книга [A Practitioner's Guide to Software Test Design](https://www.amazon.com/Practitioners-Guide-Software-Test-Design/dp/158053791X) - Lee Copeland
* Книга [How We Test Software at Microsoft](https://www.amazon.com/How-We-Test-Software-Microsoft/dp/0735624259) - Alan Page, Ken Johnston, Bj Rollison
* Книга [How Google tests software](https://www.amazon.com/gp/product/0321803027/)
* Книга [Тестирование программного обеспечения. Базовый курс.](http://svyatoslav.biz/software_testing_book/)
* Видео [Основы тестирования программного обеспечения](http://universarium.org/course/526) - А.Б. Петров
* Курс [Основы тестирования программного обеспечения](http://www.intuit.ru/studies/courses/48/48/info)
* Видео [Как тестировать карандаш?](https://www.youtube.com/watch?v=Erctsy6i0zo)
* Книга [Гибкое тестирование. Практическое руководство для тестировщиков ПО и гибких команд](https://www.ozon.ru/context/detail/id/4954578/) - Лиза Криспин, Джанет Грегори
* Книга [Ключевые процессы тестирования. Планирование, подготовка, проведение, совершенствование](https://www.ozon.ru/context/detail/id/2816263/) - Рекс Блэк

### Техники тестирования ПО

* Видеокурс [Мутационное тестирование](https://alison.com/course/software-testing-condition-coverage-and-mutation-testing-strategies)
* Видеокурс [Тестирование чёрного и белого ящика](https://alison.com/course/software-testing-black-box-strategies-and-white-box-testing)
* Доклад [An Introduction to Property Based Testing](https://www.infoq.com/presentations/property-based-testing-2016)
* Видеокурс [Тестирование на основе моделей (UniTESK)](https://www.lektorium.tv/course/22774)
* Книга [The Evolving Art of Fuzzing](https://www.vdalabs.com/tools/The_Evolving_Art_of_Fuzzing.pdf)
* Книга [Exploratory Software Testing](https://www.amazon.com/Exploratory-Software-Testing-Tricks-Techniques/dp/0321636414)
* Книга [PropEr Testing](http://propertesting.com/)
* [Комбинаторное тестирование](https://pdfs.semanticscholar.org/3f55/e2f645df06ad72b15d2fe1ef86630fa0ab52.pdf)

### Общие знания о разработке ПО

* Книга [Software Engineering Body of Knowledge (SWEBOOK)](https://www.computer.org/web/swebok)
* Видеокурс [Основы программной инженерии](https://compscicenter.ru/courses/seintro/2012-spring/?tab=about)
* Книга [Гибкие методологии разработки](http://adm-lib.ru/books/10/Gibkie-metodologii.pdf) - Вольфсон Борис
* http://xpinjection.com/resources/cat11/
* Манифест Agile-тестировщика [Часть 1](http://www.luxoft-training.ru/blog/veni_vidi_vickie/558.html) [Часть 2](http://www.luxoft-training.ru/blog/veni_vidi_vickie/561.html)
* [Agile Testing: A Practical Guide for Testers and Agile Teams](https://www.amazon.com/Agile-Testing-Practical-Guide-Testers/dp/0321534468/)
* Книга [Continuous Integration: Improving Software Quality and Reducing Risk](https://www.amazon.com/Continuous-Integration-Improving-Software-Reducing/dp/0321336380)
* Книга [Мифический человеко-месяц](https://www.ozon.ru/context/detail/id/83760/) - Фредерик Брукс

### Операционные системы

#### Windows

* Книга [Windows Internals](https://technet.microsoft.com/en-us/sysinternals/bb963901.aspx)

#### Linux

* [Linux Inside](https://www.gitbook.com/book/0xax/linux-insides/details)
* [Введение в Linux](https://stepik.org/course/%D0%92%D0%B2%D0%B5%D0%B4%D0%B5%D0%BD%D0%B8%D0%B5-%D0%B2-Linux-73/)
* Видеокурс [Introduction to Linux](https://www.edx.org/course/introduction-linux-linuxfoundationx-lfs101x-1)
* Книга ["UNIX. Руководство Системного Администратора"](https://www.ozon.ru/context/detail/id/7607778/) - Эви Немет

#### Mac OS

* [Mac OS X Internals](http://osxbook.com/)

#### Unix

* Книга [The Design and Implementation of the 4.4BSD Operating System](https://www.freebsd.org/doc/en_US.ISO8859-1/books/design-44bsd/) - Marshall Kirk McKusick
* [The Unix Programming Environment](https://www.amazon.com/Unix-Programming-Environment-Prentice-Hall-Software/dp/013937681X/)
* [The Practice of Programming](https://www.amazon.com/Practice-Programming-Addison-Wesley-Professional-Computing/dp/020161586X)

### Компьютерные сети

* Серия статей [Сети для самых маленьких](https://habrahabr.ru/search/?q=%5B%D1%81%D0%B5%D1%82%D0%B8%20%D0%B4%D0%BB%D1%8F%20%D1%81%D0%B0%D0%BC%D1%8B%D1%85%20%D0%BC%D0%B0%D0%BB%D0%B5%D0%BD%D1%8C%D0%BA%D0%B8%D1%85%5D&target_type=posts)
* Книга [Компьютерные сети. Принципы, технологии, протоколы](https://www.ozon.ru/context/detail/id/34377072/) - В.Г. Олифер
* Книга [Компьютерные сети. Первый шаг.](https://www.ozon.ru/context/detail/id/2573153/) - Уэнделл Одом
* Книга [Компьютерные сети](https://www.ozon.ru/context/detail/id/7309924/) - Э. Таненбаум
* Книга [TCP/IP Illustrated](https://www.amazon.com/TCP-IP-Illustrated-3-Set/dp/0201776316) - W. Richard Stevens

### Автоматизированное тестирование

* Основы автоматизированного тестирования
* [PyTest: Rapid Simple Testing](https://www.youtube.com/watch?v=rCBHkQ_LVIs)
* https://pragprog.com/book/bopytest/python-testing-with-pytest
* Видеокурс [Школа автоматизации процессов разработки](https://academy.yandex.ru/events/testing/spb-2014/)
* [Всё, что вам нужно знать о форматах отчётов в тестировании ПО](https://gist.github.com/ligurio/6efa8576e175fa0fb5d04cfe5c85a2a5)
* McConnell S. Code Complete

### Тестирование Web приложений

* [?] [Selenium 2.0: Using the Webdriver API to Create Robust User Acceptance Tests](https://dzone.com/refcardz/getting-started-selenium-20#refcard-download-social-buttons-display)

### Базы данных

* Видеокурс [Try SQL](https://www.codeschool.com/courses/try-sql/)
* [SQL Tutorial](https://www.w3schools.com/sql/)
* [Язык SQL. Базовый курс](https://postgrespro.ru/media/2017/06/16/sqlprimer.pdf)
* Книга [Понимание SQL](http://www.sql.ru/docs/sql/u_sql/) - Мартин Грабер
* Видеокурс [Базы данных](https://www.youtube.com/playlist?list=PLrCZzMib1e9obOz5K695ugYuiOOCBciEi)
* Видеокурс [15-721 Advanced Database Systems (Spring 2016)](https://www.youtube.com/playlist?list=PLSE8ODhjZXjbisIGOepfnlbfxeH7TW-8O)
* [?] https://github.com/rxin/db-readings
* [?] http://webdam.inria.fr/Alice/
* Видеокурс [Базы данных: какие они бывают, что такое реляционная алгебра, SQL, нормальная форма и зачем нужна система управления БД](https://events.yandex.ru/lib/talks/2321/)
* Видеокурс https://lagunita.stanford.edu/courses/DB/2014/SelfPaced/about

### Тестирование мобильных приложений

* Книга [Android Internals: A Confectioner's Cookbook](http://newandroidbook.com/)

### Языки программирования

* [POSIX Shell](http://man.openbsd.org/ksh)
* [?] PowerShell
* [Python Starter](https://itvdn.com/ru/video/python-starter), [Python Essential](https://itvdn.com/ru/video/python-essential)

### Нагрузочное тестирование

* [?] Основы тестирования производительности
* Книга [Performance Testing Guidance for Web Applications](https://perftestingguide.codeplex.com/) - J.D. Meier, Carlos Farre, Prashant Bansode, Scott Barber, and Dennis Rea
* [?] https://www.youtube.com/watch?v=bGhoLPCnUIY
* [?] https://www.youtube.com/watch?v=JdcfZZKuxvg
* [?] Molyneaux, I. The Art of Application Performance Testing: Help for Programmers and Quality Assurance.

### Тестирование безопасности

* Видеокурс [Software Security](https://ru.coursera.org/learn/software-security)

### DevOps

* [?] Книга [Проект Феникс](https://www.ozon.ru/context/detail/id/32211144/)
* [?] https://www.ansiblefordevops.com/
* [Infrastructure as Code: Managing Servers in the Cloud](https://www.amazon.com/Infrastructure-Code-Managing-Servers-Cloud/dp/1491924357/)
* Книга [Site Reliability Engineering](https://landing.google.com/sre/book.html)
* Книга [Handbook of Software Reliability Engineering](http://www.cse.cuhk.edu.hk/~lyu/book/reliability/)
* Книга The Practice of Cloud System Administration: Designing and Operating Large Distributed Systems - Том Лимончелли
* [?] Книга [Практики и инструменты DevOps](https://itvdn.com/ru/video/devops)
* [DevOps Learning Resources](https://news.ycombinator.com/item?id=14652993)

## Больше:

* Бесплатные книги [на
  русском](https://github.com/ligurio/free-software-testing-books/blob/master/free-software-testing-books-ru.md),
[на
английском](https://github.com/ligurio/free-software-testing-books/blob/master/free-software-testing-books.md)
* [Бесплатные курсы](https://github.com/ligurio/free-software-testing-books/blob/master/free-software-testing-courses.md)


- [Суровая реальность начинающих тестировщиков. Пособие: что и как учить](https://dou.ua/lenta/articles/testing-newbie-guide-0/)
- [Советы сеньоров: как прокачать знания junior QA](https://dou.ua/lenta/articles/senior-qa-tips/)
- [I am a Software Tester](https://www.xmind.net/m/s3Nt/)
