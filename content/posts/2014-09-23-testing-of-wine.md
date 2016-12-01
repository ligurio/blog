---
date: 2014-09-23T00:00:00Z
title: Тестирование Wine
tags: ["opensource", "interview", "softwaretesting"]
url: /2014/09/23/testing-of-wine.html
---

<img src="/images/logo-winehq.png" alt="Wine" style="float:left">

[Wine](https://www.winehq.org/about/) — это свободное программное обеспечение,
позволяющее пользователям UNIX-подобных систем архитектуры x86 исполнять
16-, 32- и 64- битные приложения Microsoft Windows.
Название Wine является рекурсивным акронимом и расшифровывается
«Wine Is Not an Emulator» — «Wine — не эмулятор».

Ментейнер этого проекта Alexandre Julliard согласился ответить на
мои вопросы о разработке и тестировании Wine.

**Please introduce yourself.**

I've been the maintainer of the Wine project for the past 20
years. Surprisingly, I still enjoy doing it ;-)
In my daytime job, I'm CTO of CodeWeavers.

**How much developers involved in development?
How development process of Wine looks like?**

There are probably around 30-40 active developers at any given time,
though of course people come and go regularly. Similarly to the Linux
kernel, we use the benevolent dictator model, so I'm the only one with
commit access to the main tree.

**How testing process looks like?**

We have automated unit tests for most of the code, that are run on every
change. For application testing, we have a large user community that
complains loudly everytime we break their favorite application ;-)

**What tools, tests and testing frameworks do you use?**

There is an extensive unit testing framework in the Wine tree, which we
developed ourselves. Basically it consists of a set of small programs
that exercise features of the Windows APIs and check the results. By
running the tests both on Wine and on actual Windows sytems, we can make
sure that Wine is compatible with all the quirks of the corresponding
Windows APIs.

Test runs are submitted to a central server that gathers statistics of
results across plaforms and across code revisions. Results can be seen
at <https://test.winehq.org>.

We also have a tesbot system (<https://testbot.winehq.org>) that allows
developers to submit new tests and have them run across a range of
Windows systems, since it's not possible for every developer to have
access to every Windows version locally.

**I know Wine project has a tool 'wineoops' for gathering crash statistics.
How it works and how it helps in development?**

It's a very experimental tool, we don't really use it all that much. The
idea is that it would crawl the web looking for crash reports, to allow
us to spot common crashes and solve them in priority. But it only works
well for specific categories of crashes, like unimplemented functions,
that have a well-known crash signature.  Otherwise we mostly rely on
individual bug reports to gather crash logs.

**Do you create tests to cover new features and found bugs?**

Most changes come with their own test, to prove that the change conforms
to the Windows behavior. The Windows APIs often behave in mysterious
ways, so I usually require tests even for changes that look
straightforward.

**What kind of testing do you use (performance, functional,
compatibility, stability, unit testing etc)?
Is it automated testing or manual testing?**

Unit testing is all automated. The unit test suite is run daily on
Windows, and after every commit on Wine, and any discrepancy indicates a
bug. It's all compatibility and functional testing, we don't do
performance testing at the unit level.

Application testing is done manually by users. Any regression is
reported, and once bisected it's logged into the regression tracker (aka
Hall of Shame) at <https://source.winehq.org/regressions>.

**Do you use negative testing techniques (like fuzz testing, fault injection etc)?**

Not explicitly, but running actual Windows applications is actually a
pretty good exercise in negative testing. Windows applications very
often pass wrong info or outright garbage to our APIs. There is a lot of
very bad code out there...

**Do you measure code coverage? How often?**

Code coverage isn't very meaningful in our case. Since the tests are
meant to exercise Windows APIs, we would need to measure the coverage of
our test suite against the Windows code, which of course we don't have
access to.

**Do you use Continuous Integration in development process?**

Yes, all proposed changes are run automatically run through the test
suite by the Testbot server. The full suite is also run before the
patches become part of the mainline tree. Once they have passed the
tests, updates to the mainline are made available once a day.

**Do you involve volunteers to testing? I mean thing like 'crowd sourcing'.**

For application testing, yes, it's all done by users. There's no way
that Wine developers could possibly test the thousands of Windows
applications out there, but the users community is very large and
provides good coverage of most applications.

**Let's imagine someone wants to help with testing. How to start?**

The best way is to find an application that interests you, test it
regularly and report any problems. In particular, doing a git bisect
when a new problem is found is extremely helpful.

**What tool do you use for tracking open bugs? Who is responsible in
tracking of open bugs?**

We use Bugzilla (<https://bugs.winehq.org>). It's managed by volunteers
from our community. We have a good team of bugzilla volunteers who do a
great job of massaging the bug reports to make them useful for
developers. This is especially important since in most cases developers
do not have access to the original Windows application, so they cannot
reproduce the bug themselves.

**Do you use regular security audit of code?**

No, we haven't really focused on security at this point. Our view is
that since the goal of Wine is to run arbitrary Windows code anyway,
security is better enforced outside of it, i.e. with Unix user
separation and permissions, various sandbox mechanisms, etc.

**Do you use static or dynamic code analysis tools or services like Coverity?
Or maybe another techniques directed to improving quality of code?**

We use Coverity and Valgrind extensively, as well as other diagnostic
tools. There's over a thousand fixes in our code base that are directly
attributable to code analysis tools.

**Who is responsible for releasing of new version?
What are the release criterias?**

Development snapshots are released every two weeks. These are only
snapshots so there are no release criteria.

Stable releases happen every year or two. The criteria are mostly that
there is some interesting new feature, with as few regressions as
possible (ideally zero, but that's usually not realistic). I'm
responsible for making the releases.

**What was the most interesting bug in your practice? :)**

The most interesting bugs usually happen in the applications. Wine is
actually a very good tool for finding bugs in Windows applications ;-)

I fondly remember the bug where an application would start crashing once
the tick counter returned a negative number. It's a 32-bit milliseconds
counter, so that would happen after about 25 days of uptime. This was in
the Windows 95 days, so of course there was no such thing as a Windows
box with 25 days of uptime, so the crash only happened on Wine ;-)

---------------------------------------
<br><br>

## Дополнительная информация о тестировании Wine

- «Application Testing» [OGV](http://ia600603.us.archive.org/21/items/Wineconf2009/pilkaapptest2009-small.ogv)
- «wineoops – A statistical approach to Wine crashes» [PDF](https://people.redhat.com/mstefani/wineoops/wineoops-wineconf2009.pdf) [OGV](http://www.archive.org/download/Wineconf2009/stefaniucwineoops2009.ogv)
- «WineTestBot - A Wine gatekeeper and test farm for Wine developers» [PDF](https://wiki.winehq.org/images/6/6c/WineConf2013-WTB.pdf)

<br>

<!--
https://newtestbot.winehq.org/
https://code.google.com/p/win16test/
-->
