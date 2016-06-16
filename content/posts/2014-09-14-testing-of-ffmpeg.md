---
date: 2014-09-14T00:00:00Z
title: Тестирование в проекте FFmpeg
url: /2014/09/14/testing-of-ffmpeg.html
---

<!--
http://samples.mplayerhq.hu
FATE http://www.opennet.ru/opennews/art.shtml?num=38832
https://github.com/vivienschilis/ffmpeg/blob/master/doc/fate.txt
http://cybersip.googlecode.com/git/ffmpeg/doc/fate.html
-->

<img src="/images/logo-ffmpeg.png" alt="FFmpeg" style="float:left">

[FFmpeg](https://www.ffmpeg.org) - набор свободных библиотек
с открытым исходным кодом, которые позволяют записывать,
конвертировать и передавать цифровые аудио- и видеозаписи в различных форматах.

Разработчик FFmpeg согласился ответить на мои вопросы
о разработке и тестировании в этом проекте.

**Please introduce yourself.**

My name is Stefano Sabatini, and I am an animal belonging to the homo
sapiens species. I have a M.S. in computer science/informatics, and
I've been working on several areas of FFmpeg (documentation, API
design, ffprobe, libavfilter) since 2007.

**How does development process of FFmpeg look like?**

There are many formal and informal rules which apply to the FFmpeg
development process. A contributor usually sends a patch to the
mailing-list (<ffmpeg-devel@ffmpeg.org>), then the patch is discussed
and is eventually applied or rejected. Some contributors act as
maintainers and have the last word on their maintainance area. Also
most core developers have commit rights and can push patches on the
main git repository. Trivial patches or hot-fixes can be pushed with
no review. Michael Niedermayer is the general maintainer, and he has
the last word on design decisions.

Discussions also happens informally on the IRC development channel,
and sometimes in real-life meetings (typically VDD and Linuxtage), but
only a few developers attend these meetings.

**How many developers involved in development?**

There is a core group of about 10 people working almost daily on the
project, and ~ 200 occasional contributors per year. Complete
updated statistics can be seen here:
[https://www.openhub.net/p/ffmpeg](https://www.openhub.net/p/ffmpeg)

**How does testing process look? Do you have automated regular testing?**

The contributor is supposed to test a new feature/defect fix/change
manually, and to run the complete testing suite on her machine.

We have a testing framework called [FATE](https://www.ffmpeg.org/fate.html)
(FFmpeg Automated Test Environment), see: [http://fate.ffmpeg.org/](http://fate.ffmpeg.org/).

**What is the process for testing new features or significant changes in FFmpeg?**

Features are tested locally. The developers is requested to run the
complete FATE test suite before pushing significant features/changes.

There is also a coverity instance which sends updates about found
critical issues.

**What kind of testing do you use (performance, functional, stability, unit etc)?
Do you use some kind of manual testing?**

Manual testing is required to test features which are not covered by
the FATE tests. FATE performs functional and stability testing,
ensuring that the issued output is not erroneously changed. Most tests
are related to a single module, so they can be considered as unit
tests. Performace testing is not currently automated, although we have
performance statistics shown in the tests.

**Do you use negative testing techniques (like fuzz testing, fault injection etc)?**

Fuzz testing is performed by third parties to detect security
issues. AFAIK fault injection is not performed at the moment.

**What tools, tests and testing frameworks do you use? Do you use
Continuous Integration in development?**

We have our custom FATE environment, which is an FFmpeg-custom CI
environment. FATE clients update their FFmpeg source code and run the
suite of tests, and record regressions and failures which are then
notified to the FATE server. FATE also comprises also several valgrind
tests.

To detect regressions we compare the reference output hash with the
newly computed hash for each single test, for each new build.

**Do you measure code coverage? How often do you measure it?**

We have this: [http://coverage.ffmpeg.org/](http://coverage.ffmpeg.org/)

I'm not sure about how often the statistics are updated.

**What tool do you use for tracking open bugs?**

We use trac since 2011:
[https://trac.ffmpeg.org/](https://trac.ffmpeg.org/)

**Who is responsible for releasing of new version?
What are the release criterias?**

Michael Niedermayer (general maintainer) is also the maintainer of all
the supported releases. We have no specific criteria, we just cut a
new release from the master development repository from time to time
at semi-regular intervals, which span from 3 to 6 months. Then
critical and security fixes are back-ported to the supported releases.

Typically we only actively maintain a few releases, for details see:
[http://ffmpeg.org/download.html](http://ffmpeg.org/download.html)

**Do you make security audit of code? Do you have a process to fix
security vulnerability?**

There are some third parties contributors (e.g. from Google) who
perform security audits and notify in case of security issues.
See also: [http://ffmpeg.org/security.html](http://ffmpeg.org/security.html)

*Interviewer's note: Google told about it in
[their blog](http://googleonlinesecurity.blogspot.ru/2014/01/ffmpeg-and-thousand-fixes.html).*

**Do you use static or dynamic code analysis?**

Coverity and valgrind (the latter being integrated in FATE).

**Do you involve volunteers to testing? I mean things like 'crowd sourcing'.**

We have no active crowd sourcing campaign at the moment. Most testers
are active developers or contributors running/using FFmpeg for their
own purposes.

**What was the most interesting bug in your practice?**

Can't really say, also I'm more a documentation/API geek so I'm not
the most active on interesting bug fixes resolution.

Compatibility bugs are interesting:
[Ticket #2672](http://trac.ffmpeg.org/ticket/2672)

Also integer overflows are subtle and cool:

    commit 64be0d1edad630f5bc0f287022f5880de07915b2
    Author: Stefano Sabatini <stefano.sabatini-lala@poste.it>
    Date:   Wed May 18 00:43:25 2011 +0200

    id3v2: prevent unsigned integer overflow in ff_id3v2_parse()

    In ff_id3v2_parse(), prevent unsigned integer overflow if data length
    indicator is skipped and tlen is < 4.

    Fix crash decoding file Allaby_cut.mp3, fix trac issue #182.

_

    commit 4a745b41770893116405c22f832192510f9bcc9b
    Author: Stefano Sabatini <stefano.sabatini-lala@poste.it>
    Date:   Sun May 8 00:47:14 2011 +0200

    pnmdec: add support for mono images with non-space-separated pixel digits

    When the file to decode contains a sequence of binary values like
    "1101110...", decode_frame() was reading the sequence of digits like a
    unique integer value, which was resulting in integer overflows.

    The change add support for parsing non-space-separated pixel digits
    for mono formats, in particular fix decoding of file battrace.pbm, and
    fix trac issue #154.

**Thanks for answers!**

HTH, bye.
