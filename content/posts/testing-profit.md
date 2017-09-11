---
date: 2017-08-11T00:00:00Z
title: Как найти больше багов?
draft: true
tags: ["testing"]
---

Тут можно сделать вступительное слово о том, что сложность программного
обеспечения растет и есть множество примеров того, как ошибки в ПО приводили к
человеческим смертям.  Но я не буду. Если вы делаете программы, то вы знаете,
что их нужно тестировать.  Как именно тестировать это вопрос который обычно
зависит от квалификации инженера и доступных ресурсов (времени и денег).
Что-то тестируют руками и этого достаточно. Для других программ пишут сложные тесты.
Для третьих пишут спецификации.

Ни одна техника не поможет вам найти все дефекты.

Я уже давно хочу найти таблицу со всеми современными техниками тестирования ПО и
показателями их эффективности. Чтобы можно было наглядно видеть полезность
каждой техники. Чтобы можно было улучшать качество ПО внедряя наиболее полезные
техники. Чтобы инженеры маленькой компании, у которой нет денег на хороших
тестировщиков, могли использовать самые урожайные на баги инструменты.  Такой
таблицы я не нашел и сделал ее сам. Данные для таблицы я не сам придумал, а
взял из научных статей.

Применять ли эти техники у себя в проекте вы решаете сами, но знать об их
эффективности вы должны.

### Эффективность техник тестирования ПО

* Простое тестирование
  - https://www.usenix.org/system/files/conference/osdi14/osdi14-paper-yuan.pdf	
* Мутационное тестирование
  - http://www0.cs.ucl.ac.uk/staff/mharman/tse-mutation-survey.pdf
  - https://homes.cs.washington.edu/%7Emernst/pubs/mutation-effectiveness-fse2014.pdf
* Property-based
  - https://dl.acm.org/citation.cfm?id=263267
  - http://publications.lib.chalmers.se/records/fulltext/232550/local_232550.pdf
* Fuzzing
  - https://www.cs.ucsb.edu/~chris/teaching/cs290/doc/fuzzing-ndss08.pdf
* Статический анализ
  - https://www.computer.org/cms/csmediacenter/docs/1-MET_MaurizioMorisio_Effectiveness.pdf
  - http://www.cs.colostate.edu/~bieman/Pubs/WedyanAlrumnyBieman.icst09.pdf
* Контрактное программирование
  - в MS https://sergeyteplyakov.blogspot.ru/2015/08/should-i-use-code-contracts.html
* Тестирование на основе моделей
* Юнит тестирование
  - https://dl.acm.org/citation.cfm?id=267590
  - MSDN статья Write Maintainable Unit Tests That Will Save You Time And Tears
* Формальная верификация

| Техника тестирования ПО | Сложность внедрения  |  Эффективность  |
|-------------------------|:--------------------:|:---------------:|
| Простое тестирование | Low | 50% |
| Мутационное тестирование | Low | 43% |
| Property-based | Low | 43% |
| Fuzzing	| Low-Medium | 43% |
| Статический анализ кода | Low | 50% |
| Тестирование на основе моделей | Low | 50% |
| Юнит тестирование | Low | 50% |
| Контрактное програмирование | Low | 50% |
| Формальная верификация | Low | 50% |


<!--
### Эффективность практик тестирования ПО

| Процесс 				| Сложность внедрения | Эффективность |
|-----------------------|:-------------------:|:-------------:|
| Непрерывная интеграция | Low | 10% |
| Роли людей в проекте 	| Low | 11% |
| Cпецификация и требования | Low | 13% |

* [Survey on software testing practices](http://salab.kaist.ac.kr/old/publications/IET2012.pdf)
-->

### См. также

* [A Review of Software Testing Techniques](https://www.ripublication.com/irph/ijeee_spl/ijeeev7n5_05.pdf)
* [A Survey of Effective and Efficient Software Testing](http://www.micsymposium.org/mics2015/ProceedingsMICS_2015/Mailewa_2D1_41.pdf)
* https://cs.stanford.edu/people/saswat/research/ASTJSS.pdf
* https://habrahabr.ru/company/npo-comp/blog/223833/
* https://github.com/polarnik/TypesOfTesting
* http://www.micsymposium.org/mics2015/ProceedingsMICS_2015/Mailewa_2D1_41.pdf
* https://pastebin.com/xZ6m4T8Z
* [Some things that might help you make better software](http://www.drmaciver.com/2016/10/some-things-that-might-help-you-write-better-software/)
