---
layout: post
title: Тестирование продуктов Mozilla
---

<p class="meta">11 февраля 2015 - Москва</p>

Один из разработчиков продуктов Mozilla Foundation ответил на вопросы о тестировании
этих продуктов.

<img src="{{ site.baseurl }}/images/logo-mozilla.png" height="130" alt="Mozilla Firefox logo" style="float:left; margin-right: 40px;">

**Please introduce yourself.**

Will Lachance, automation & tools developer. I work on automated systems
for testing performance and correctness in Mozilla software
(chiefly: Firefox, Firefox for Android, and FirefoxOS).

You can find out more about my group [here](https://wiki.mozilla.org/Auto-tools).

**How does development process look like? Do you have the same process
for all Mozilla products or it is can be different?**

It varies by project and group. In general our group has no formal process.
People work on things that are priorities, checking in with other stakeholders
(management, other groups, etc) regularly.

**How many developers involved in the development of Firefox and Thunderbird?**

Not sure what the current stat is. My guess would be a few hundred, directly and indirectly.

**How does testing process look? Do you use regular testing?**

Yes, we have a [QA department](https://wiki.mozilla.org/QA).

**What kind of testing do they use (performance, functional,
compatibility, stability, unit testing etc)?**

Yes, all of the above. :) I only work on automated performance
and unit testing, so don't know the specific details of what others are doing.
 
**Do you test manually? Please tell more about each kind of testing.**

Yes, we do manual testing but as I said I'm not completely familiar with how they work exactly.

**What tests and testing frameworks do you use? Do developers
create tests on regular basis for new functionality and bug fixes?**

Yes, we have a large set of testing frameworks and a large number
of tests that are running on every commit/change:

The most important ones are mochitest, reftest, and talos.

{% comment %}
**Mozilla projects has many self-made infrastructure tools:
[MozTrap](https://github.com/mozilla/moztrap/), [Perf-O-Matic](http://graphs.mozilla.org/graph.html),
[MozPool](https://github.com/mozilla/mozpool), [Crash Stats](https://crash-stats.mozilla.com),
[Minion and Peach](http://www.opennet.ru/opennews/art.shtml?num=37551), [FuzzDB](https://code.google.com/p/fuzzdb/),
[MozHarness](https://github.com/mozilla/build-mozharness) etc. Could you tell about them?**

I'm only familiar with some of those and I'm not really sure what
I could add over and above what's on their project pages, etc.
Could you try googling for more information and let me know if
you have specific questions? You could also try emailing the authors
directly if you have specific questions.
{% endcomment %}

**I heared you use instances in AWS for development and testing. Could
you tell more?**

Yup, we do. AWS is useful because we can scale our testing capacity
up and down depending on demand. There's many more things that need
to be tested in the middle of the day when developers are busy.

**Do you have own hardware servers?**

Yes, for some types of testing (e.g. performance) we want to use
real hardware with known performance characteristics.

**What is the process for testing new features or significant changes?**

We try to add automated tests to cover the new functionality.
QA will generally do some manual testing as well.

**Do you measure code coverage for Mozilla products? How often do you measure it?
How much of code covered by auto tests?**

I think so, but I am not sure of the details.

**How do use Continuous Integration in development process?**

We run tests on every commit. See [treeherder.mozilla.org](http://treeherder.mozilla.org).

{% comment %}
**What tool do you use for tracking open bugs? Who is responsible in
tracking of open bugs?**

[bugzilla.mozilla.orgi](http://bugzilla.mozilla.org)

**Do you have triage process?**

Yes, details depend on specific project.

**Do you use regular security audit of code?
Do you have a "Bug bounty" program?**

Yes, don't know many details. Google can tell you more.
{% endcomment %}

**What is the process for releasing update with security fix?**

Not sure of exact details. Googling for ["chemspill mozila"](http://www.aosabook.org/en/ffreleng.html)
may tell you something.

**Mozilla has big testing community.
Please tell about  involving volunteers in testing of Mozilla projects.**

I can only speak for my team, but you can find some info
[here](https://wiki.mozilla.org/Auto-tools#Want_to_Help.3F).

{% comment %}
**Do you use negative testing techniques (like fuzz testing, fault injection etc)?
Do you use static code analysis tools or services like Coverity? Or
maybe another techniques directed to improving quality of code?**

I believe the answer to all of these is "yes" but I don't know the details.
Google may be able to tell you more.
{% endcomment %}

**Who is responsible for releasing of new version?
What are the release criterias?**

Release engineering does the builds. Various parts of the
organization do sign-off before it actually happens.

**What was the most interesting bug in your practice?**

I think the craziest one was tracking down why our Android test
devices were rebooting after 15-20 minutes of run time.
Turns out there was some long-forgotten code in the test agent
app we used to communicate which was trying to ping some unreachable server.
When they weren't able to, they would assume that they had lost
network connectivity and rebooted themselves. This was pretty deeply
buried and not very well understood, took a while to go figure it out.

# Дополнительные ссылки:<br><br>

- [MozTrap](https://github.com/mozilla/moztrap/)
- [Perf-O-Matic](http://graphs.mozilla.org/graph.html)
- [MozPool](https://github.com/mozilla/mozpool)
- [Crash Stats](https://crash-stats.mozilla.com)
- [Minion and Peach](http://www.opennet.ru/opennews/art.shtml?num=37551)
- [FuzzDB](https://code.google.com/p/fuzzdb/)
- [MozHarness](https://github.com/mozilla/build-mozharness)
- [Firefox Release Engineering](http://aosabook.org/en/ffreleng.html)
