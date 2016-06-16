---
date: 2014-08-21T00:00:00Z
title: Тестирование ClamAV
url: /2014/08/21/testing-of-clamav.html
---

<img src="/images/logo-clamav.jpg" alt="ClamAV" style="float:left">

[ClamAV](http://www.clamav.net/lang/en/about/) -
это антивирусный инструмент для UNIX с открытым исходным кодом (GPL).
Он предоставляет несколько утилит, включая гибкий и
масштабируемый многопоточный демон, сканер для командной строки
и расширенные средства для автоматического обновления баз.

Один из разработчиков ClamAV согласился ответить на мои вопросы о разработке и тестировании ClamAV.

**Please present yourself.**

Steven Morgan, Development tech lead for ClamAV

**How does development process of ClamAV look like?**

Agile, modified scrum.

**How many developers involved in the development?**

Three full time developers, several part time developers,
plus developments from the ClamAV community.

**How does testing process look?**

Developer testing, unit testing, buildbot (fourteen platforms),
regression testing (>315 M test samples), testing by the QA, beta testing, release candidate testing.

**What kind of testing do you use (unit, performance, functional, stability etc)?**

See above, plus performance testing using code instrumentation and external tools (top, gprof, etc.)

<!--
**Do you use regular testing or it is time from time testing?**

Not sure what is meant by regular testing vs. time from time testing.
-->

**What tools, tests and testing frameworks
do you use? Do you use Continuous Integration in development?**

Libcheck for unit testing, valgrind for detecting memory usage flaws,
buildbot for continuous integration testing.

**Do you measure code coverage of ClamAV components?**

No. Note taken.

**Do you use static code analysis?**

Yes, [Coverity](https://scan.coverity.com/).

**Sometimes ClamAV has security flaws. Do you use regular security audit of code?**

We use secure coding practices and code review,
in addition to the previously mentioned tools,  to minimize
the occurrence of security flaws. When a security flaw is identified,
it is handled with the highest priority. Incidents of security flaws
in final releases has been very small.

**ClamAV supports most popular operating systems:
Linux, BSD, Microsoft Windows and even commercial Unix distributives like Solaris,
AIX and HP-UX. How do you provide confidence in stable work for all these OSes?**

Buildbot/unit tests on 14 platforms plus community participation
is beta and release candidate testing.

**What tool do you use for tracking open bugs?**

Bugzilla

**What it the process for testing new features or significant changes in ClamAV?**

Developer testing, buildbot, valgrind and coverity analysis,
testing by the QA, beta testing, release candidate testing.

**Who is responsible for releasing of new version? What are the release criterias?**

Development manager and development lead working in conjunction
with the open source community manager and the operations team are responsible
for releasing new versions. We have a release engineering process conducted
by the development team. Release criteria is successful completion
of the said testing and no security or crash bugs.

**How to help with testing to ClamAV project? I have about 1Gb of viruses (yes, really).
Do you need them to add to signatures?**

Please participate in our beta testing. If you have samples to share,
please post on clamav-devel and the appropriate team will contact you.
There is also the clamav-community signature effort where members
of the community may submit detection for us to ship:
[http://www.clamav.net/lang/en/sendvirus/](http://www.clamav.net/lang/en/sendvirus/).

**I see a long list of ClamAV users on [site](http://www.clamav.net/lang/en/about/who-use-clamav/).
Do they contribute to project quality?**

They do or did. Recently, we’re giving creds to contributors on a release by release basis.

**Do you involve volunteers to testing? I mean thing like 'crowd sourcing'.**

Yes, mostly during beta and release candidate phases, but it is pretty much on going.
If you are interested, please watch the clamav mailing list
for beta and release candidate announcements. Bugs may be opened
by community members at [http://bugzilla.clamav.net](http://bugzilla.clamav.net).
Patches to fix bugs may be submitted as well.

**I remember an [incident](https://archive.fosdem.org/2006/2006/index/interviews/interviews_kojm.html)
when signature for COPYING file got into the virus database.
Who decide what files got into the virus database?**

There are other, much larger teams of security intelligence analysts
and signature authors feeding the virus data base.

**ClamAV FAQ tell about [gathering anonymous statistics](http://www.stats.clamav.net/).
How it helps in development?**

This mostly assists in security intelligence and operation procedures.

**What was the most interesting bug in your practice? :)**

Fixing the pattern matcher.

**Thanks for answers and wish low number of false positive reports to ClamAV :)**

And thank you for your interest and thought provoking questions
and for volunteering towards the testing effort!
