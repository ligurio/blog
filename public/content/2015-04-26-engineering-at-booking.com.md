---
layout: post
title: Как устроен инжиниринг в Booking.com
---

[Алексей Махоткин](https://plus.google.com/events/cjqb4f10bgifntgol64120ue3p0)
рассказал как устроен инжиниринг в Booking.com.

_Орфография, пунктуация и стилистика автора сохранены._

[Booking.com](Booking.com) — одна из крупнейших компаний на рынке
онлайн-тревела. Бизнес-модель очень простая — отели выставляют предложения,
пользователи выбирают подходящие и платят отелям, которые раз в месяц
выплачивают Букингу комиссию.

## Технологии

### Главный принцип выливаний

Много лет назад на высшем уровне компании приняли решение: **„Мы движемся очень
быстро и иногда что-то ломаем. При этом не тратим время на классическую
деятельность, как тестирование и строгий релиз-менеджмент.“**

Т.к. множество проблем напрямую не связаны с багами, а с роутерами, датацентрами
и прочими вещами, то мониторинг необходим. Раз уж его сделали, то давайте
считать систему единым целым, которая может ломаться по разнообразным причинам,
одной из которых являются ошибки в коде, и использовать мониторинг вместо
тестирования.

Самый главный график — bookings per minute. Время реакции на проблемы с ним: 3–4
минуты. После решения проблемы составляется формальный отчёт с разбором событий
до минуты, и оценка пропавших букингов (по логам или оценка за прошую неделю).

На этом графике присутствуют различные паттерны: люди на спор отличают день
недели[a], чётко видны сезоны, даже голы на чемпионате мира.

Потерянные букинги называются Innovation Costs — стоимость быстрого развития.
Если отведённый на это бюджет превышается, СЕО пишет письмо «ребята, давайте
поаккуратнее, тестируйте более консервативно», а когда несколько месяцев не
выбирается — «что-то мы застаиваемся, давайте больше рисковать и пробовать новые
штуки».

### Тестирование: не получилось, и ладно

Нет stage-сайта, на котором изменения маринуются в течение нескольких недель,
нет тестирования командой QA, нет аппрувов на выкладку. Если ты сделал что-то,
поставил под этим свою подпись фактом коммита, и выразил готовность к тому, то
код в какой-то момент выедет в продакшн.

Все коммитят в мастер, когда считают, что код production-ready. Своих бранчей
можно создавать сколько угодно для любых целей. Деплой на продакшн из мастера.
Как именно ты обновляешь свои ветки, чтобы в какой-то момент выложить новый код
на мастер — твое дело.

Процесс тестирования устроен с точки зрения многих адски. Ты как девелопер
отвечаешь за свой коммит. Тестируешь его так, как считаешь нужным, у себя, на
виртуалках. Показываешь коллегам, отправляешь на рассылку.

В определённый момент начинается тестирование на живых юзерах (на определённом
проценте). Если нужно, делаешь дашборд с нужными показателями, выносишь сперва
собирающий его скрипт, затем основной коммит. Если график падает — откатываешь и
начинаешь разбираться.  Нормальный QA есть только в мобильных аппликухах, в
которых нельзя выкатить ерунду на весь аппстор.

Иногда страшновато, но со временем я осознал, что тебе за это и платят.
Непередаваемое чувство внутри, когда ты сейчас нажмёшь git deploy, и всё
улучшится[b]. Или нет. Релиз-инжиниринг весь на тебе.

Новичок должен деплоить в течение своей первой недели. Я держался до последнего
и выкатил ровно через 7 дней.

Роллбеков больше, чем ревертов из мастера. Иногда ты успеваешь откатить,
написать фикс и накатить его.

Unit-tests используются только одной командой, разрабатывающий здоровенный XML
API.  Рекомендации от старших товарищей:

* Быть более консервативным.
* Следить за всем[c], даже не связанным с выкаченным кодом.
* Если возникают проблемы, сначала откатываешь, потом разбираешься[d].

Несколько раз откатив, понимаешь, что это совершенно естественно и никто в
компании за это не ругает. Раз в пару дней кто-то обязательно откатывает.

Коммиты из мастера ревертятся — это тоже стандартная технология.

### Deployment

Для него разработали и выложили в open source утилиту
[git-deploy](https://github.com/git-deploy/git-deploy#DESCRIPTION). Она
позволяет не только надёжно выкатывать, но и надёжно откатывать. Также в
выливании участвует Puppet — репозиторий открыт для всех, но принято
согласовывать действия с админами.

Утилита тегирует изменения в мастере и запускает хуки, которые переводят все
сервера на нужный тег, перезапускают веб-сервера, пишут в конференцию,
отправляют письма etc.

Надёжная комбинация палок и верёвок :-)

База данных и код полностью отвязаны. Сначала создаются таблицы, после
выкатывают код, ими пользующийся.  Не допускаются деплои, блокирующие откат, ты
должен спроектировать его откатываемым до состояния «на вчера».

Деплои разрешены, когда в офисе есть достаточное количество людей, которые
следят за происходящим и смотрят на графики: пн–чт 10–17, пт 10–15. Запрещены во
время больших внутренних коференций и хакатонов.

Перед деплоем нужно прийти на jabber-конференцию deploy, прочитать на пару часов
назад, всё ли в порядке и сообщить о своих планах.

Сейчас неизвестны способы, которыми можно надёжно положить роль из-за ошибки в
деплое.

### Codebase и мониторинг

~3.2M LOC на Perl.  Server roles: www, secure.booking.com, book, xml (всего
порядка 25 и постоянно добавляются).  За раз выкатывается одна роль, хотя на
всех серверах полностью развёрнут весь репозиторий.

Кроме перла, используется Go для генерации уникальных id (миллионы запросов в
минуту), Javascript для фронтенда, Java + Hadoop для хранения внутренних ивентов
(логи разработчиков для собственых нужд).

Последних набирается ~4 TB/day, сотни крон-скриптов для анализа, примерно 30%
ивентов скорее всего никогда не используются.

Одна из самых больших в мире инсталляция mySQL,
[своя тулза для репликации](http://blog.booking.com/mysql_slave_scaling_and_more.html)
(open source). В продакшне стоковые дистрибутивы, немного MariaDB. 50+ баз
данных. Случаются data traps. На внутреннем выступлении чувак из ответственной
команды извинялся за неудобство, когда таблица называется ufi, но в ней хранится
что-то другое, а для работы с ufi необходимо пользоваться тремя другими
таблицами. Переименовать же нельзя, т.к. эта таблица тоже используется.
Nagios, Graphite, ElasticSearch. Git. Redis для очередей.

Memcached — система должна работать надёжно, если все memcached отключены или
упали. Не допускается торможения при разогреве кеша[e]. Т.е. если с кешем
страница генерируется за 50 мс, а без — за 500 мс, то худшим случаем остаётся
генерация за 500 мс.

### Виртуализация

У каждого разработчика есть свой набор виртуалок с каждой из ролей. Всё очень
быстро взлетает, садится, удаляется и создаётся заново.

В продакшн внешние облака не используются.

### Поддержка legacy

Изменения, ломающие старый код, не допускаются. Если хочешь убрать метод,
который вроде как никто не вызывает, добавляешь в него warn, ждёшь пару месяцев,
если он ни разу не сработал — можно удалять.

Аккуратно удалять старьё всё же нужно, т.к. если я потратил время, чтобы
разобраться, что внутри всё не так, как кажется снаружи, то не нужно снова
тратить время того, кто придёт в это место следующим.

## Культура и HR

### Фокусы компании

**Мы не технологическая компания, мы бизнес-компания с сильной технологией.**

~700 программистов, из них голландцев около 10%, затем американцы и русские.
Берут тех, кто готов работать в Букинге, а не писать на Перле (допускается
переход с других языков).  Вопросы как больше заработать? как лучше
конвертировать пользователей? отодвигают вопросы _почему перл_? на задний план.

Деньги всё сильно выравнивают. Есть пользователи, взаимоотношения и деньги.
Большинство спорных решений проецируются на эти ценности и решаются с оглядкой
на них.

В компании работают релиз-менеджеры перла, официально спонсируют комьюнити и
разработку, предоставляли хостинг Perl.

Опыт — очень важная вещь, внутри компании собрано множество знаний про перл,
тревел, поведение пользователей. Поэтому внешний вид сайта редко меняется
радикально.

В начале карьеры рассказывают Worst stories — 5–6 раз сайт лежал сутки и никто
не знал, почему он лежит.  Сильная инженерная команда, готовая ко многому. Все
понимают, что да, будет следующий факап, который будет очень сложно починить.
Пока он не случился, все расслаблены и с удовольствием работают.

Q: Почему не поставить noSQL, Cassandra?

A: На таких масштабах упадёт всё, но из-за имеющегося огромного опыта с
mySQL[f][g], будет понятный процесс подъёма его обратно.

### Эксперименты

В Introduction book говорится: **Milk your cows every day**.  Более половины
сотрудников заняты экспериментами, в каждый момент времени на сайте активны
порядка 300 А/Б тестов[h].

Непрерывный майнинг возможностей, успешные из которых приносят +0.3% букингов,
помогает компании постоянно расти.

### Офисы и найм

Офис разработки полностью в Амстердаме, немного исторических сотрудников
работают удалённо. Админы в Кембридже, Сиэттле, Амстере и Сингапуре,
обеспечивают поддержку 24/7.

Технических специалистов находят как на [отдельном
сайте](https://workingatbooking.com/), так и внутри своего:

<img src="{{ site.baseurl }}/images/hiring-at-booking.png">


### Как устроился

Отправил резюме в середине декабря.  Позвонили в середине января, договорились
об интервью.  В конце января скайп-интервью на час с написанием кода в
онлайн-редакторе. В середине февраля личное собеседование в Амстердаме и оффер
на собеседовании. 1,5 месяца на визовые вопросы.

Рекомендация внутри Букинга уходит на fast-track.

На собеседовании обсуждают общую computer science, пишут код. Отдельный разговор
про бизнес, напр. какую ещё модель стоит сделать Букингу.

### Хакатоны

2 дня в месяц можно заниматься чем-угодно. Желательно работать по профилю
Букинга и в другом месте от основной работы. Для хакатона подключаю к Букингу
Яндекс.Карты, что оказалось весьма нетривиально из-за сложной структуры
шаблонов.

### Коллектив

Делится на тимы 3–6 человек, девелоперы, тимлид, продакт-оунер. PO не руководит
программистами. То, что сказал РО, не является основанием немедленно бежать и
что-то делать, если ты не согласен.  Не обязательно переходить из разработки в
менеджеры (что традиционно происходит в других компаниях), существуют

*Technical Track*: developer → senior developer → team lead → senior team lead →
principal developer (5 человек) и *Management Track*.

Работаю в команде без РО, поэтому про них сложно рассказать.

Команда занимается сообщениями: email, факсы и sms. Крупнейший отправитель
факсов (порядка 200 тысяч из подключенных отелей пользуются факсом), это самый
юридически надёжный способ передать данные карточки отелю для списания денег.

Отделу необходимо отставаться очень консервативными. Если бы мы сказали, что мы
не будем внедрять ничего нового, только смотреть, чтобы всё работало, нам бы
сказали „окей“. Ну, не окей, но что-то близкое.

Коллега говорит, что последний раз открывал сайт месяц назад.

Используем scrum, но скрам недостаточно agile для нас, поэтому мы делаем его
более agile.  Каждая команда решает сама, как ей работать, нет ничего единого.
Канбан-доски, Jira, jabber-конференции, Slack, общая wiki (Сonfluence тормозит и
регулярно падает), рассылки с архивами.

Нет гонки за дедлайнами, поэтому нет централизованной оценки средней скорости
тикета. Недавний сервис Villas выкатывали понемногу.

Жёсткие дедлайны только в юридической области, например в Канаде 21 июля ввели
дополнительный налог на туризм, значит калькуляторы нужно обновить до 21 июля.
За этим следят РО соответствующей команд.

Первые задачи взял с канбан-доски Mini, чтобы разобраться с кодобазой.

Задачи для команды придумываются сами, поступают на рассылку от заинтересованных
лиц. Задачу можно выбрать. Есть задачи, которые никто не хочет делать, и на них
можно подняться в репутационном плане.

У тимлидов и синьор-тимлидов есть представление про всех сотрудников под ними.
Assessment-документ сотрудника содержит пункты personal, team, company-wide.

Коммуникации только внутри команды недостаточно, тебя должны знать снаружи:
плюсами будут работать с другими командами, писать в рассылки, делиться идеями с
продакт оунерами других команд, советовать штуки.

Внешние достижения мапятся в бонусы, основные в переход на следующий уровень →
следующий шаг зарплаты.

### Пиво

Большую роль в культуре компании играет пиво. Возле предыдущего офиса был бар
Mankind, который остался придворным баром после переезда и зарабатывает около
трети выручки с сотрудников.  Freaky Friday — последняя пятница месяца, до 20:00
наливают за конторский счёт.

Адреса Mankind-а добавлены в файрволл как офисные.

----

[a] Отличный образ! Показатель того, что команда правда использует метрики в
работе.

[b] Вот это и есть то ощущение в голове разработчика, которого стоит добиваться!
Причем, для этого в общем-то не обязательно делать именно такой цикл работы, как
в Booking.

[c] Хорошо, но требует большой квалификации и опыта от каждого разработчика (что
плохо масштабируемо и невыгодно экономически).

[d] Тоже полезное правило. В Почте Mail.Ru именно так и жили всегда.

[e] Это требование звучит странно. Скорее всего, оно говорит о том, что проект
имеет сильно избыточную инфраструктуру и мог бы эксплуатироваться заметно
дешевле. В целом ситуация, что проект не влезает "с нуля" и требует "прогрева"
кэшей – нормальная, и означает лишь, что в случае полного падения проект будет
подниматься 5-15 минут (в течение которых автоматика будет постепенно повышать
нагрузку).

[f] Любовь к mysql, как и perl, и другие ремарки в тексте, говорит о любви к
олдскульным технологиям и в целом "админском" подходе к развитию проекта
("работает – не трогай"). Этот подход и позволяет поддерживать описанную
культуру разработки. Из-за этого Booking, на мой взгляд является очень приятным
местом для технарей, но медленно (и спорно) развивается, как продукт.

[g] Ваше интерпретация не верна на мой взгляд. Любовь или не любовь не играет ни
какой роли. Суть заключается в том что у компании есть колоссальный опыт и
понимание как работают perl и mysql и что делать если что-то идет не так. Так же
есть хорошо отлаженные тулзы мониторинга, профайлинга и т.д. Естественно, что
для задач которые могут быть решены с их помощью они и будут выбраны. Здесь
стоит заметить что верно для многих случаев. Однако это совершенно не означает
что все будет решаться с их помощью. Есть задачи для которых используется
кластеры Hadoop, Cassandra, Redis, Riak есть демоны на С, Go, Java.

[h] Вот это очень интересно "как". Расскажите, если не сложно. Как вы делаете на
единой кодовой базе / data storage 300 AB тестов?

Fin