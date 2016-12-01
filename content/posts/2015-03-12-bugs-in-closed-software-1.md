---
date: 2015-03-12T00:00:00Z
title: Примеры открытых баз данных дефектов в закрытом ПО
url: /2015/03/12/bugs-in-closed-software-1.html
tags: ["softwaretesting"]
---

После публикации поста про
[дефекты в закрытом ПО](/2015/02/25/bugs-in-closed-software.html)
я получил несколько отзывов и решил продолжить эту тему.

Несмотря на то, что компании-производители закрытого ПО не публикуют
список дефектов в своём ПО, есть проекты, которые делают это за них.
О наиболее удачных таких проектах я и расскажу.

Первые два проекта касаются только проблем в безопасности ПО:

Первый проект - это CVE (Common Vulnerabilities and Exposures),
список уязвимостей информационной безопасности и рисков, целью которого
является предоставление названий для общеизвестных проблем. Все проблемы в безопасности
ПО (открытом и закрытом) получившие идентификатор CVE, становятся
[публично доступными](https://cve.mitre.org/cve/index.html).
А что такое уязвимость? Это всё тот же дефект в ПО, который может быть напрямую
использован для получения доступа к системе или сети злоумышленником.
Более подробно почитать про CVE можно [здесь](https://cve.mitre.org/about/faqs.html).

Второй проект менее известен - инициатива Google по поиску уязвимостей в закрытом ПО -
проект [Project Zero](https://code.google.com/p/google-security-research/).
Проект направлен на выявление проблем в безопасности ПО и найденные проблемы
чаще всего получают отдельный идентификатор CVE. На данный момент проектом
выявлено [145 проблем](https://code.google.com/p/google-security-research/issues/list?can=1&q=&colspec=ID+Type+Status+Priority+Milestone+Owner+Summary&cells=tiles) из которых только две проблемы
на данный момент не исправлены.

<!--
Каждый проект выявляет проблемы в безопасности ПО, которые могут повлечь
потери для компаний, использующих такое ПО. Обычно разглашение используется в
целях оказания давления на производителей ПО.

- [Rebooting Responsible Disclosure: a focus on protecting end users](https://googleonlinesecurity.blogspot.ru/2010/07/rebooting-responsible-disclosure-focus.html)
- [Schneier: Full Disclosure of Security Vulnerabilities a 'Damned Good Idea'](https://www.schneier.com/essays/archives/2007/01/schneier_full_disclo.html)
- [Coordinated Vulnerability Disclosure](https://technet.microsoft.com/en-us/security/dn467923.aspx)
- [A Call for Better Coordinated Vulnerability Disclosure](https://blogs.technet.com/b/msrc/archive/2015/01/11/a-call-for-better-coordinated-vulnerability-disclosure.aspx)
-->
