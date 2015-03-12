---
layout: post
title: Дефекты в закрытом ПО
---

{{ page.title }}
================

<p class="meta">25 февраля 2015 - Москва</p>

<img src="http://blog.bronevichok.ru/images/beets.png" width="600" alt="Баги, очень много багов">

Все мы используем программы и время от времени обнаруживаем в них ошибки.
Обнаружив проблему пользователь может вести себя по разному и на мой взгляд
каждый вариант поведения зависит от продвинутости пользователя,
серьёзности проблемы и проактивности человека:

- закрыть глаза на проблему и жить дальше не замечая её
- каждый раз возмущаться натыкаясь на проблему (не важно как: устно или в социальных сетях)
- отрепортить ошибку производителю (это высший пилотаж)

Но даже если пользователь сообщил о проблеме производителю напрямую,
то нет никакой гарантии, что проблема будет исправлена в ближайших обновлениях.
И, так как это закрытое программное обеспечение, то и помочь пользователю
никто кроме производителя не может и он остаётся наедине со своими страданиями.

Вот к примеру проблемы, которые я недавно репортил:
[проблемы](http://blog.bronevichok.ru/2015/02/06/bookmate-bugs.html) в приложении Bookmate,
баги в ПО от Microsoft [1](https://social.technet.microsoft.com/Forums/windowsserver/en-US/8882442e-4d16-437f-9930-8aa0ac25ad73/typo-in-error-message-from-microsoft-remote-desktop-for-mac?forum=winRDc#8882442e-4d16-437f-9930-8aa0ac25ad73), [2](https://social.technet.microsoft.com/Forums/windowsserver/en-US/55e7f73b-d7e6-4c79-985c-21aaf70b304a/remote-desktop-for- mac-decryption-using-standard-rdp-security-mechanisms-failed-code-4498?forum=winRDc#8f1e9870-7f33-4c66-8358-7c5bf0fa3023) (кстати сообщить о проблеме в MS это то ещё приключение) и несколько других.
Все проблемы производители считают несущественными и обновлений с их исправлениями не выпускали.

<!--
Помимо моих есть ещё много примеров описания дефектов закрытого ПО в блогах:
[Mac OS panic](https://medium.com/@oleavr/diy-kernel-panic-os-x-and-ios-in-10-loc-c250d9649159)
- insecure Evernote <http://www.gigpeppers.com/if-you-are-storing-important-info-in-evernote-think-twice/>
- <http://talater.com/chrome-is-listening/>
- <http://robert.ocallahan.org/2014/09/vmware-cpuid-conditional-branch.html>
- <https://vk.com/wall-56751744_52571>
<blockquote class="twitter-tweet" lang="en"><p>Вынужден констатировать что Parallels Desktop доебал своими вылетами и зависаниями. И у них еще хватает наглости просить денег за апдейты?!!</p>&mdash; Dmytro Oleksiuk (@d_olex) <a href="https://twitter.com/d_olex/status/420207010571755520">January 6, 2014</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>
- <http://www.macrumors.com/2015/01/23/ios-8-gmt-calendar-bug/>
-->

<!--
- <https://www.gnu.org/philosophy/free-doc.html>
- <https://www.gnu.org/philosophy/free-software-even-more-important.html>
- <https://www.gnu.org/philosophy/who-does-that-server-really-serve.html>
-->

То ли дело в случае свободного программного обеспечения: вы можете сами
исправить проблему в исходном коде (если у вас хватит квалификации) или
<s>нанять</s> попросить разработчика. Но, к сожалению, использование
свободного ПО не всегда возможно. Очень трудно противостоять давлению
окружающих людей (как например со Skype: закрытый, неудобный, доступный не под всеми
платформами, но тем не менее все им пользуются из-за отсутствия хороших и популярных альтернатив).

А что делаете вы, если нашли баг в закрытом ПО?
