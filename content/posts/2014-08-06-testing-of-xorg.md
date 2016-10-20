---
date: 2014-08-06T00:00:00Z
title: Тестирование X.Org
tags: ["opensource", "openbsd", "interview", "softwaretesting", "openbsd-en"]
url: /2014/08/06/testing-of-xorg.html
---

<img src="/images/logo-xorg.png" alt="Xorg" style="float:left">

В этом году Xorg, свободной реализации [X Window System](https://en.wikipedia.org/wiki/X11),
[исполняется 30 лет](https://plus.google.com/102057777074369211973/posts/2M3jfkL2gNJ).
Несмотря на существование и развитие [альтернатив](https://bbs.archlinux.org/viewtopic.php?id=87281)
Xorg остаётся живее всех живых.

По случаю юбилея я задал несколько вопросов человеку, который 23(!) года работает
над развитием этого проекта. Зовут его [Matthieu Herrb](http://homepages.laas.fr/matthieu/).
Помимо своего участия в проекте X.Org он также стоит у истоков создания отдельной версии Xorg
для проекта OpenBSD - [Xenocara](http://xenocara.org/).

Также доступен [перевод интервью](http://habrahabr.ru/post/234291/).


**Xorg (the X-server) is a big and complex beast.
How does development process of it look like?**

It's not that big compared to many more recent projects (like firefox,
chrome or even Gnome/KDE)

The development process is a bit different between actively
developed components (the X server itself, a few supporting
libraries and the drivers for recent hardware) and legacy components
like libXt and all applications based on it.   

Also there is a constant interaction with 2 other groups: the Mesa and
Linux kernel drm modules developers.

Ideas are discussed during developers meetings (once a year,
alternatively in Europe and North-America, with the next one being
this September in Bordeaux - France) or on the Xorg-devel mailing
list.

Since a few years, we've adopted a development model which is close to
the Linux kernel development model: patches (git format-patch) are
sent to the mailing list for review, get some discussion, and if a
consensus is reached, are integrated by the maintainer.

There is one maintainer for the X server (currently Keith Packard is
holding that position). For other components, commits are more open
and it's generally the author of a patch that pushes it once it has
been reviewed positively.

And to be complete, nowadays development of the active drivers almost
completely driven by the companies (Intel, AMD, VMWare), so it's
engineers from those companies who do most of the commits and pushes.

**How many developers involved in the development?**

If we include the Mesa, Linux kernel graphics stack and X people there
are around 50-60 people who commit on a regular basis to one of the
repositories.

**How does testing process look like? Do you use regular testing
(for example for each commit) or it is time from time testing?**

We have some tools to do regular, automated testing in place, but they
are not as efficient as we'd like them to be.

**What tools, tests and testing frameworks do you use?
I have found a lot of tests (like XTS, rendercheck, glean, piglit etc)
in [repository](http://cgit.freedesktop.org/)
but some of them looks outdated. Do developers create tests on regular basis
for new functionality and bugfixes?**

In addition to all those existing test suites, which are usually quite
cumbersome to set up and run on a regular basis, Peter Hutterer has
developed a relatively new, integrated test suite for the X server
that is supposed to be run automatically from the X build system (make
test) and on our tinderbox server. The build.sh script used by many
developers also runs this tests by default

But given the huge spectrum of supported systems (even though since
the switch from XFree86 to X.Org, this number has been constantly
shrinking) only a small subset of them gets actual regular testing.

Most of the tests are done downstream by people who integrate the
X.Org suite on their systems and distributions.

This is my case among others. I maintain X.Org on OpenBSD (and have
been helping with NetBSD before), so I test configurations that are
not handled by the main X developers and often find bugs that slipped
through the testing process, either because they are platform specific
(for instance OpenBSD is one of the few systems to still run on some
exotic architectures like VAX, m88k or even sparc32), or just because
our system's malloc() is able to catch errors that escape other tools
used on Linux.

**What kind of testing do they use (performance, functional,
compatibility, stability, unit testing etc)?**

The new X server test framework is mostly a unit and functional
testing framework to make sure that the X servers components behave
the way they are supposed to in a driver independent manner.

**In case of using tests do you measure code coverage?**

Not really. Since the people who wrote the code and the test are often
the same, they have some notion of the coverage of their tests, but
there is no formal tool used AFAIK.

**How often do you use it: time from time or on regular basis?**

Again, the tinderbox platform is supposed to run the tests as often as
possible, but much of the other tests are run manually from time to
time.

**How new features tested?**

New features, in X, you're kidding, right ? More seriously they have
been a number of new features mostly at the Mesa (OpenGL)
level and at the input driver level. Either new tests for the features
are added to the test suite at the same time of the code, or, for the
OpenGL case, external compliance tests are used.

**Do you use Continuous Integration in development process?**

Yes, I've mentioned the tinderbox system a number of times already,
even if it's far from perfect.

**What tool do you use for tracking open bugs? Who is responsible in
tracking of open bugs?**

We have a Bugzilla hosted at [freedesktop.org](http://freedesktop.org)
([bugs.freedesktop.org](http://bugs.freedesktop.org)),
completed by a patch tracking system (patchwork) that tries to ensure
that no submitted patch gets forgotten or unhandled.

**Sometimes X.Org has [security flaws](http://www.x.org/wiki/Development/Security/)
Do you use regular security audit of code?**

No and yes :) AFAIK X.Org has no one explicitly dedicated to do code
audits on a regular basis. But some distributions (for example
Oracle/Solaris in the person of Alan Coopersmith) are using security
oriented auditing tools regularly and contributing fixes back to the
project. On occasion, when a specific new kind of vulnerability is put
into light (like format strings or integer overflow about 10 years
ago) we do extensive sweep on the existing code base to try to fix
them.

We also get external help from independent security researchers who
are always looking for interesting vulnerabilities to exploit, and with
the X server still being setuid root on many systems, it's still a
worthwhile target.

Last year Ilja Van Sprundel reported quite a large number of
vulnerabilities in both X libraries and in the X server, mainly
rotating around the lack of enough validation of the X protocol
messages.

**Do you use static code analysis?**

The answer is similar to my previous one. The tinderbox system is not
running any specific static code analyzer beside gcc with -Wall plus a
number of extra warnings activated. But some people (including again
Alan for Oracle) have access to powerful static analysis tools and run
them from time to time.

Coverity has a program to do analysis for free software
organizations. X.Org has been part of this program and they helped us
to find a fix a number of issues.

**X.Org supports all more or less popular operating systems:
Linux, FreeBSD, NetBSD, OpenBSD, Solaris, Microsoft Windows.
How you provide confidence in stable work for all these OSes?**

As I explained above this is handled by volunteers (or paid employees
in some cases) from the various projects. The main developers mostly
focus on Linux which has become the main development platform for the
last 10 years. Personally  I'd say that its a bit unfortunate that
those (great) people don't get involved a bit more in the support of
the other systems. From my experience there is a lot to learn in
developing with more than one system in mind, and from the security
point of view diversity has a great value (even if it has some cost on
the development process)

**Who is responsible for releasing of new version? What are the release
criterias?**

There is a maintainer for the X server who also is in charge of doing
the release. We currently work on a 6 month cycle with a new X server
release being released every 6 months. Previous release get a -stable
maintainer and are generally maintained for 12 more months.

In addition to the X server releases we still do "katamari" releases
with a full consistent set of libraries and utilities in addition to
the X server. This is done more or less yearly. (current katamari is
7.7, based on X server 1.14). But the need for katamari releases is
often questioned, since system distributors are generally maintaining
their own katamaries (with more frequent merges of upstream packages),
independently of the official X.Org ones.

The times where the XFree86 project was providing binary distributions for
most of its supported systems (from SVR4 to Linux, including NetBSD,
OS/2 and a few others) is definitely over.

**What was the most interesting bug in your practice? :)**

Working with code that was designed and implemented while security
didn't matter is always "interesting". X was initially a really
permissive system (do you remember the "xhost +" times ?). People
didn't care about buffer overflows or other malicious ways to exploit
coding errors. Features like the X-SHM  extension have
been broken from the start. (SHM has been fixed by using a new API,
based on file descriptor passing recently).

But the most interesting issue from my point of view is the paper by
Loic Dufflot at CanSecWest 2006 where he showed that even with the
privilege separation code I had added to OpenBSD, the fact that the X
server had direct access to hardware registers made it
possible for a "simple" code injection bug to get control of the
kernel.

This is something that has always been known (and I even talked about
it in a talk at RMLL in 2003) but lacking and actual implementation of
a PoC let many developers ignore the issue.

Even if this was of lower impact on Linux than on OpenBSD (because the
root/kernel frontier is not as strong on Linux unless you've SELinux
or similar hardening features active, which wasn't the default at
those times). It came right when other people started to think
about how to run X with less privileges. This has lead to the
development of Kernel Mode Settings and other techniques that now make
it possible to run X server 1.16 without any privilege.

But this can't always be enough. A small (but which could have had a
high impact if it has gone unnoticed for a few more months) example is
the CVE-2014-4910 in the Intel driver: a new setuid helper is needed
to handle the screen back light now that X doesn't have the required
privileges to change it; and this daemon was written without any care
for security, allowing ".." escapes in a path passed directly to
open(O_RDWR) as root. The problem was thankfully spotted before an
official release of the Intel driver by Adam Sampson by end of June.

**Thanks for answers and wish you less bugs in your code!**

Thank you.

In conclusion, Yes X.Org is far from perfect from the testing point of
view. We are trying to make things better, but since this is not the
sexiest thing to contribute on, things are not moving very fast, as
most developers still prefer get more attractive things.
