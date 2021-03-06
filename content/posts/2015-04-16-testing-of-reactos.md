---
date: 2015-04-16T00:00:00Z
title: "Интервью: тестирование ReactOS"
tags: ["opensource", "softwaretesting", "interview"]
url: /2015/04/16/testing-of-reactos.html
---

<img src="/images/logo-reactos.png" height="110" alt="ReactOS" style="float:left">

[ReactOS](https://www.reactos.org) - это современная, свободная и открытая операционная система,
основанная на лучших принципах архитектуры Windows NT. Система была разработана с нуля,
и таким образом не основана на Linux и не имеет ничего общего с архитектурой UNIX.

Проект ставит своей целью создание операционной системы бинарно-совместимой с Windows.
Такая система позволит выполнять Windows-совместимые приложения и драйвера так,
как если бы они выполнялись в самой Windows. Координатор проекта ReactOS -
Алексей Брагин - рассказал о том, как они достигают эту цель, ответив на вопросы
о разработке и тестировании в проекте.

Кстати, благодаря своим знаниям о Windows, Алексей успел и поработать и над нашим продуктом
[Containers for Windows](https://www.odin.com/uk/support/virtualization-suite/pvc/).

**Пожалуйста представьтесь.**

[Алексей Брагин](https://www.linkedin.com/in/alekseybragin),
координатор проекта ReactOS, преподаватель в МГТУ им. Н.Э.Баумана.

**Как вы попали в проект ReactOS? Расскажите о вашем первом патче.**

Мой первый патч в ReactOS (его закоммитил итальянский разработчик в ревизии
*[4417](https://code.reactos.org/changelog/reactos?cs=4417)* 24 марта 2003 года)
- это работа над функцией *NtQuerySystemInformation*.
Т.к. графического режима в ReactOS тогда ещё не было, я сделал его
консольный вариант - Console Task Manager. Под Windows он прекрасно работал,
но в ReactOS он затрагивал многие участки кода, которые либо были не реализованы,
либо реализованы с ошибками. Этот CTM можно найти в дереве исходников до сих пор,
он лежит в модуле [rosapps (applications/sysutils/ctm)](https://svn.reactos.org/reactos/trunk/rosapps/).

**Как выглядит процесс разработки? Используете ли вы систему непрерывной интеграции?**

У нас есть разработчики с правом записи в основную ветку (trunk commit access),
а есть разработчики, которые имеют право записи только в ветки, либо просто
разработчики, отправляющие патчи. Патчи принимаются, отслеживаются и тестируются
с помощью системы [JIRA](https://jira.reactos.org/). Я большой поклонник этой системы, как пользователь
(но не как администратор :-)). Ещё у нас есть Patchbot, который по запросу
может автоматически скомпилировать весь ReactOS с патчем из JIRA, и прогнать
получившуюся систему через набор тестов. Это очень полезно, сразу понять -
правильно ли применяется патч, не ломает ли он что-то очевидное. После этого
уже за дело берётся разработчик, знакомый с той предметной областью, которую затрагивает патч.

**Как выглядит процесс тестирования? Насколько регулярно используется тестирование?**

Процесс тестирования полностью автоматизирован. После каждого коммита в SVN
собираются DEBUG и RELEASE билды, затем они поступают на Testbot, который
их тестирует с помощью большого набора тестов. Мы используем тесты Wine
для пользовательских библиотек, собственные тесты для Native API, Win32k API,
и высокоуровневые тесты на основе AHK (когда проверяется, скажем, устанавливается
ли какое-то приложение, типа Firefox).

**Сколько тестировщиков в проекте?**

И конечно же, люди-тестировщики тоже есть. Их число измеряется сотнями,
т.к. подавляющее большинство багов в JIRA создаётся не разработчиками,
а сторонними людьми, которых мы вообще часто первый раз видим.

**Какие инструменты, тесты и тестовые фреймворки вы используете? Как часто разработчики
пишут новые тесты?**

Я написал выше, отчасти. Фреймворки - все собственной разработки.
Работает всё при помощи Buildbot, и собственной тулзы под названием [Testman](https://reactos.org/testman)
(менеджер тестирования). Это легковесная штуковина, по сравнению с существующими опенсорс решениями.

**Если что-то наподобие валидационного теста для новых сборок?**

Да, у нас есть так называемый "золотой набор" софта (golden apps),
который обязан работать в каждом релизе. Если что-то из него не работает,
то релиз не случится. Вообще, я скажу, что наша команда даже излишне много
усилий тратит на подготовку релизов, которые всё-равно не являются production-ready,
это всего-лишь более отточеные, но тем не менее экспериментальные сборки.

**Какой процесс для тестирование нового функционала или значительных изменений?**

Строго определённого процесса нет, но де-факто принят следующий путь.
Если изменения существенные, т.е. переписывается часть кода, которая уже работает,
то это переписывание должно происходить вначале в ветке (бранче),
потом должно пройти тестирование, и только потом (если ничего сильно не сломалось)
происходит слияние (merge) в основную ветку - trunk. Так происходило, например,
с загрузчиком PE-файлов в ntdll.dll. Вместе с Alex Ionscu я сначала переписал
его в бранче, привёл к совместимому с Windows состоянию. Это выявило
массу ошибок в других частях операционной системы. Их я исправлял сразу в trunk'е,
и делал обратный merge в свою ветку. Затем, когда всё стало более-менее работать,
смержил свой код в trunk, и тогда он подвергся уже намного более тщательному тестированию,
и нашлись новые ошибки. Откатывать уже не стал, просто сообща стали искать и устранять.

**Какие виды тестирования вы используете (тестирование производительности,
функциональное тестирование, тестирование совместимости, стабильности, юнит тестирование)?**

Иногда мы делаем бенчмарк-тесты, в специфичным случаях. Например,
когда я разработал альтернативную реализацию Win-подсистемы Arwinss,
и мне было очень интересно сравнить её производительность с родной подсистемой, и с Windows.
Тогда написал относительно простенький бенчмарк, вывел значения, сравнил.
И действительно оказалось интересно, т.к. все предполагали, что у меня
будет медленнее (в силу того, что я не занимался оптимизацией, а наоборот писал
- чем проще, тем лучше), но в реальности вышло так же, а местами даже лучше
(т.к. в моей подсистеме много работы выполняется в user mode, без переключений контекста).
В остальном это тестирование всевозможных API. Ручное тестирование конечно присутствует,
но мы постарались по максимуму всё автоматизировать. Если ещё что-то можно автоматизировать,
то мы это сделаем в ближайшее время.

**Насколько регулярно регулярно проводится аудит безопасности кода?**

Нет, пока мы этого не может себе позволить. Исправляем только то, на что "наткнёмся"
в процессе работы над тем или иным участком кода.

**Используете ли вы техники негативного тестирования ([fuzz тестирование](https://en.wikipedia.org/wiki/Fuzz_testing), [fault injection](https://en.wikipedia.org/wiki/Fault_injection) и т.д.)?**

Нет, такого не используем. Надо будет посмотреть, поговорить с командой,
возможно у нас есть специалисты по этим технологиями, и у них
возникнет желание попробовать их применить.

**Вы используете инструменты для статического анализа кода или сервисы наподобие Coverity?
Или может быть другие техники, направленные на улучшение качества кода?**

Используем Coverity [уже давно](https://scan.coverity.com/projects/205).
Это очень хороший продукт, мы нашли множество
ошибок в исходном коде - причём не только в своём, а в коде Wine и других проектов,
которые мы используем. Мы им всем отправили патчи, которые были быстро приняты.
Ещё есть отечественный продукт PVS Studio, они нам несколько раз делали анализ кода,
находили новые ошибки, которые Coverity не обнаружил. Но части наших разработчиков
не понравился агрессивный маркетинг PVS Studio - после анализа кода они делают
отчёты на хабре, в которых всё это описывается. Но некоторым не понравился тот факт,
что там преподносятся все ошибки, как ошибки кода ReactOS, когда на самом деле 99% ошибок
было в коде сторонних проектов (FreeType, Wine, различные библиотеки вроде libxml, libpng и прочее).
Лично я отношусь в PVS Studio с большим уважением, т.к. это специализированный инструмент,
который достаточно тяжело разработать, и надо ещё и конкурировать фактически с лидером - Coverity.
Ещё пользуемся встроенным анализатором MS Visual Studio, размечаем исходный код.
Это тоже внесло очень большой вклад в поиске различных хитрых ошибок.

**Измеряете ли вы покрытие кода? Как часто вы это делаете?
Какая часть кода покрыта автотестами?**

Нет, покрытие кода мы не измеряем.

**Кто является ответственным за работу с дефектами? Какие критерии для триажа дефектов?**

Каждый разработчик забирает те баги, которые ему хочется. Полная свобода действий.
Triage решается на ежемесячном собрании всех разработчиков. Если возникают разногласия
- проводим голосование, и простым большинством принимаем решения.

**Как вы привлекаете людей из сообщества ReactOS в тестирование проекта?
Представим что кто-то хочет улучшить качество ReactOS. Что вы ему посоветуете?**

Часто это очень интуитивный процесс. Вот, совсем свежий пример.
На занятиях в Бауманке мы используем ReactOS и NetBSD для отработки простых
практических навыков - пересобрать ядро, написать драйвер. Студенты же
не работали раньше в ReactOS, и они подразумевают, что всё должно работать.
И сразу выявляется всё то, что мы недотестировали (т.к. у нашей команды
часто "глаз замыливается"). Некоторые особо продвинутые студенты даже присылают
патчи для исправления ошибок - а это для нас самое ценное.

**Какие критерии для выпуска новой версии ReactOS?**

Критерии определяем в JIRA. Как только для target 0.4.0 необходимые
фичи реализованы, а баги пофиксены - то будет релиз 0.4. И так далее
вплоть до 1.0, всё в JIRA есть, всё открыто.

**Расскажите о наиболее интересном дефекте в ReactOS.**

О, да в ReactOS что ни баг, то чёрная или белая магия :). А, вот, вспомнил
один интересный пример. Была такая ошибка: на первой стадии установки системы
с компакт-диска, иногда, система падала в BSOD при копировании файлов,
где-то на 40 - 50%, в совершенно непонятном месте. Этот баг пытались решить
лучшие разработчики нашего проекта в течение полугода. Никак не получалось.
Лишь потом, Alex Ionescu, используя свой пытливый ум нашёл причину. А ведь
некоторые тестировщики немножко догадались - когда они нажимали любую кнопку
на клавиатуре в процессе копирования, то вероятность появления бага была выше.
Но обосновать было нечем, т.к. система падала именно внутри копирования файлов.
А оказалось, что драйвер i8042prt освобождал выделенную память, но сохраняя указатель,
потом снова в некоторых случаях в неё писал. А эта память уже перевыделялась для структур ядра
(что-то из кэш-менеджера, если не ошибаюсь), поэтому обычная проверка на выход
за границы буфера не работала: память-то правильно использовалась, а потом debug-аллокатор
пула выделял эту память ядру, и в неё успешно писали и драйвер i8042prt и само ядро,
которое потом и падало. Решить правильно можно было бы только усложнением
debug-аллокатора пула, чтобы он не делал reuse освобождённой памяти,
и подольше держал её в резерве.

**Действительно ли экраны BSOD для ReactOS и Windows идентичны? :)**

Напомнило: "У нас дыра в безопасности! Ох, ну хоть что-то у нас в безопасности!".
Так и тут, можно с уверенностью сказать, что BSOD у нас 100% совместимый :-)

----

P.S. Несмотря на то, что сейчас ReactOS находится в состоянии альфа,
что означает отсутствие некоторых функциональных возможностей, её можно
попробовать уже сейчас. Для ознакомления [доступны](https://www.reactos.org/ru/download-reactos)
как установочный образ, так и Live CD.

Демонстрация работы [Steam](https://ru.wikipedia.org/wiki/Steam) в ReactOS:
<a href="/images/reactos-screenshot.jpg"><img src="/images/reactos-screenshot.jpg" height="500" alt="Steam в ReactOS" style="float:left"></a><br><br>
