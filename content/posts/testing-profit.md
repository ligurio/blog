---
date: 2017-09-13T00:00:00Z
title: Эффективное тестирование
draft: true
tags: ["testing"]
---

- тестирование должно быть в виде пирамиды
- все техники тестирования выявляют разные баги, поэтому их надо комбинировать

Если вы разрабатываете ПО, то вы знаете, что его нужно тестировать. Как именно
это делать зависит от доступных ресурсов и квалификации
инженеров-тестировщиков.

Я попробовал связать два показателя: эффективность техники или подхода
тестирования и его сложность.

Применять ли эти техники у себя в проекте вы решаете сами, но знать об их
эффективности вы должны.

### "Простое" тестирование

- https://www.usenix.org/system/files/conference/osdi14/osdi14-paper-yuan.pdf	
- http://neverworkintheory.org/2014/10/08/simple-testing-can-prevent-most-critical-failures.html

### Комбинаторное тестирование

see http://csrc.nist.gov/groups/SNS/acts/documents/kuhn-cmu.pdf
Pairwise testing finds about 50% to 90% of flaws
• Cohen, Dalal, Parelius, Patton, 1995 
– 90% coverage with pairwise, all errors in small modules found 
• Dalal, et al.  1999
– effectiveness of pairwise testing, no higher degree interactions
• Smith, Feather, Muscetolla, 2000 
– 88% and 50% of flaws for 2 subsystem

- http://csrc.nist.gov/groups/SNS/acts/index.html
- https://beta.csrc.nist.gov/Projects/Automated-Combinatorial-Testing-for-Software
- http://www.pairwise.org/

Введение на шесть страниц - http://csrc.nist.gov/groups/SNS/acts/documents/ieee-rs-atr.pdf
Руководство - http://nvlpubs.nist.gov/nistpubs/Legacy/SP/nistspecialpublication800-142.pdf 

### Мутационное тестирование

- http://www0.cs.ucl.ac.uk/staff/mharman/tse-mutation-survey.pdf
- https://homes.cs.washington.edu/%7Emernst/pubs/mutation-effectiveness-fse2014.pdf

### Property-based

- https://dl.acm.org/citation.cfm?id=263267
- http://publications.lib.chalmers.se/records/fulltext/232550/local_232550.pdf

### Fuzzing

- https://www.cs.ucsb.edu/~chris/teaching/cs290/doc/fuzzing-ndss08.pdf

### Тестирование на основе моделей

- [A Case Study on the Efficiency of Model-Based Testing at the European Space Agency](https://www.researchgate.net/profile/Michael_Felderer/publication/280948823_A_Case_Study_on_the_Efficiency_of_Model-Based_Testing_at_the_European_Space_Agency/links/55ce4e1f08aee19936fc5a92/A-Case-Study-on-the-Efficiency-of-Model-Based-Testing-at-the-European-Space-Agency.pdf)

- On average, respondents report MBT reduced escaped bugs by 59%.
- On average, respondents report MBT reduced testing costs by 17%.
- On average, respondents report MBT reduced testing duration by 25%.


### Юнит тестирование

- https://dl.acm.org/citation.cfm?id=267590
- MSDN статья Write Maintainable Unit Tests That Will Save You Time And Tears

### Формальная верификация

- ???


### Статический анализ кода

- "lightweight formal methods"
- https://www.computer.org/cms/csmediacenter/docs/1-MET_MaurizioMorisio_Effectiveness.pdf
- http://www.cs.colostate.edu/~bieman/Pubs/WedyanAlrumnyBieman.icst09.pdf

### Контрактное программирование

- в MS https://sergeyteplyakov.blogspot.ru/2015/08/should-i-use-code-contracts.html

Interface errors themselves posed something like 80+% of problems. This was
noted as far back as the 60's in Apollo project when Margaret Hamilton invented
software engineering, fault-tolerance, and specification techniques to fight
it. Dijkstra and Hoare pushed for pre- and post-conditions plus specific
invariants to document the assumptions of code during procedure calls. Modern
version is called Design by Contract in Eiffel, Ada, and numerous other
languages (even asserts in C). Many deployments and tests showed such interface
checks caught many issues, esp assumption violations when new code extended or
modified legacy.

### Ревью кода

Fagan ran empirical studies at IBM that showed a regular, systematic, code
review process caught many problems, even what tests missed. Turned that into
formal inspections with the periodicity and prioritizing tuned per organization
for right cost-benefit. Was generalized to whole SDLC by others in high
robustness areas. Improved every project that used it from then on. Exactly
what parameters to use is still open-ended but periodically looking for
well-known flaws with reference sheet always works.

### Непрерывная интеграция

почему-то у все непрерывная интеграция ассоциируется с тулзами.  Если CI, то
дженкинс. Но вообще CI это процесс и тулзы здесь второстепенны. Вот автор Redis
использует самописный скрипт на Tcl, просто потому что ему так удобнее и скрипт
решает задачу постоянного выполнения сборки.


| Тип тестирования ПО | Сложность использования |  Эффективность  |
|-------------------------|:--------------------:|:---------------:|
| "Простое" тестирование | ★☆☆☆☆ | 50% |
| Мутационное тестирование | ★★☆☆☆ | 43% |
| Комбинаторное тестирование | ★★☆☆☆ | 43% |
| Property-based | ★★☆☆☆ | 43% |
| Fuzzing	| ★★★☆☆ | 43% |
| Тестирование на основе моделей | ★★★☆☆ | 50% |
| Юнит тестирование | ★★☆☆☆ | 50% |
| Контрактное програмирование | ★★☆☆☆ | 50% |
| Формальная верификация | ★★★★★ | 50% |
| Контрактное программирование | ★☆☆☆☆ | 50% |
| Статический анализ кода | ★☆☆☆☆ | 50% |

<!--
### Эффективность практик тестирования ПО

| Процесс 				| Сложность внедрения | Эффективность |
|-----------------------|:-------------------:|:-------------:|
| Непрерывная интеграция | Low | 10% |
| Роли людей в проекте 	| Low | 11% |
| Cпецификация и требования | Low | 13% |

* [Survey on software testing practices](http://salab.kaist.ac.kr/old/publications/IET2012.pdf)
-->

### См. также статьи по этой теме:

* [A Review of Software Testing Techniques](https://www.ripublication.com/irph/ijeee_spl/ijeeev7n5_05.pdf)
* [A Survey of Effective and Efficient Software Testing](http://www.micsymposium.org/mics2015/ProceedingsMICS_2015/Mailewa_2D1_41.pdf)
* https://cs.stanford.edu/people/saswat/research/ASTJSS.pdf
* http://www.micsymposium.org/mics2015/ProceedingsMICS_2015/Mailewa_2D1_41.pdf
* https://pastebin.com/xZ6m4T8Z
* [Some things that might help you make better software](http://www.drmaciver.com/2016/10/some-things-that-might-help-you-write-better-software/)
