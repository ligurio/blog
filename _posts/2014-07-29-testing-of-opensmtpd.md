---
layout: post
title: Тестирование OpenSMTPD
---

<p class="meta">29 июля 2014 - Москва</p>

Я нахожу интересным узнавать о том, как тестируются открытые проекты.
Частично это можно узнать из слайдов конференций (таких как [FOSDEM](https://fosdem.org)),
про некоторые можно узнать только пообщавшись с непосредственными участниками проекта.
Я решил начать публикации интервью с разработчиками открытых проектов
о тестировании. Пилотное интервью будет с разработчиком OpenSMTPD - Gilles Chehade.

<img align="center" src="{{ site.baseurl }}/images/logo-opensmtpd.jpg" alt="OpenSMTPD">

[OpenSMTPD](https://www.opensmtpd.org/) - это проект, начатый в 2002 году
в рамках создания нового открытого SMTP сервера.
В 2013 году он полностью заменил Sendmail в [OpenBSD 5.3](http://www.openbsd.org/53.html).
Больше информации можно узнать из слайдов Éric Faurot на
[asiabsdcon 2013](https://www.opensmtpd.org/presentations/asiabsdcon2013-smtpd).

Итак.

**Hi, Gilles.
How does development process of opensmtpd look like? How many developers involved in the development?**

Actually we have a fairly simple development process.

There's a development "master" branch in which all new code is committed.
It is then merged in a "portable" branch which is really "master" + autotools and some compat glue.

Every once in a while, we tag both "master" and "portable" and generate snapshots that we announce
on our mailing list. The snapshots are tarballs of the repositories at that exact moment so that
people can give a try at the latest features in progress.

When we are happy with the new features and consider them fairly stable, we branch from master and
portable and we start stress testing the branches until completely satistified at which point we
tag and publish releases.

When a bug is found in master that affects a former release, we create branches from the release
tag and only backport fixes so that no invasive changes happen between two minors or a stable release.

Every now and then we backport our master code to the OpenBSD tree when we know it is fairly stable
and is not going to blow up.

All this work is essentially done by Eric Faurot, Charles Longeau and I.
Charles is our portability guy, he sometimes contribute to master but most of his contributions
are to portable. Eric and I work mostly on master but rely on portable for work so we tend to
work in both areas.

Besides us, there are a number of power users who contribute code, features and bug-fixes.
Some of the features we provide were entirely written by outsiders, some others were started
by us and we gave up to let others write them and put a first foot in our project.

**How does testing process look? Do you use regular testing (for example for each commit)
or it is time from time testing?**

We do continuous testing through various means.

First, whenever a new feature is added, we test it locally on our workstations with a specific
configuration that triggers the feature. This is simply one developer mailing another and
both checking that whatever was supposed to happen did.

When we pass these basic tests, we deploy on the server that handles our private mails and the
OpenSMTPD mailing list so that it runs there for a while. This can last a few hours or days
depending on how much confidence we have in the changes and how invasive they are. That server
has a configuration that goes through various of the mechanisms we want to test.

When the changes affect the outgoing code path, we deploy on production servers at work that
cope with massive trafic. SMTP is fault-tolerant and therefore we don't take much risk doing
so, in case of a crash or hang we can either deploy a fixed version right away or rollback
to investigate while trafic resumes and people experience very slight delays. Given the
volume of mails, bugs are usually triggered and fixed very fast.

Finally, we have some power users testing every snapshot we generate and reporting issues as
they run into them, which covers the incoming code path for the most part. The snapshots are
also packaged for some other systems and distributions easing report from regular users.

**What it the process for testing new features or significant changes in OpenSMTPd?**

Usually, a developer proposes a general idea: "we want to be able to do X".

If developers agree that this is the way to go, the developer branches from master and
implements the feature before showing the branch to at least another developer for
feedback. The branch either goes through another round of changes, or it is okayed and
merged back into master.

Once it is in master, we go through the round of testing I described previously.

**What kind of testing you use (performance, functional, stability etc)?**

Our main concern is functionality and stability above all, performance comes next.

When adding code, we want to make sure that it does what it is supposed to do and that
it doesn't introduce regressions or instabilities. Performances don't really matter if
the code is buggy and does not do what we want it to do. Therefore most of our testing
focuses on validating the functionality and robustness.

Now performance is also important but we deal with it separately.

We have built real-time profiling in the daemon and are able to get precise timing of
pretty much every operation. Whenever we feel that something is suboptimal or that we
are hitting contention somehwere which is observable, we enable profiling on a busy
system and extract timings to analyze and compare with our expectations.

This doesn't happen very often because a lot of work has already been poured in the
performance area and having APIs that limit the risk of creating bottlenecks. As of
today, we fixed all known bottlenecks on very very busy systems so performance is
unlikely to be an issue for 99% of our users.

**Eric Faurot said in [slides](https://www.opensmtpd.org/presentations/asiabsdcon2013-smtpd/#slide-111)
that filesystem is a bottleneck in performance measurement. Is it for HDD or SSD?**

Well, be it HDD or SSD, disk access is always the bottleneck.

A while before Eric's presentation, we were considering the first stable OpenSMTPD release
and I was a bit worried that we had no idea how we compared to others when looking only at
performances.

Eric and I spent a few days doing performance measurements, profiling and improvements and
we reached a point where graphs proved we could not do better without starting to rely on
micro-optimizations and heuristics. The incoming and outgoing paths were optimal, we could
make previsions on papers about how the daemon would scale and we would accurately observe
these previsions become true. The details are hairy, I'll skip on that :-)

At this point, we realized that there was a limit to that scaling and profiling showed the
limit didn't come from the logic which was performing in constant time no matter the load
of the OpenSMTPD instance. The timings clearly pinpointed the queue as being the most
time-consuming component of the daemon.

We started looking at the code, assuming we had a logic issue somewhere and besides a few
micro-optimizations here and there to avoid or reduce system calls, we could not find any
logic that looked fishy. Also, the queue code is very simple and small, so there as quite
a bit of confidence after this audit that the problem was somewhere else.

We ran the same queue code in a memory FS and compared the delta with a stub queue that
simply discarded the operations. The delta was neglictible and it proved that the issue
was not with the code but rather with the performances of the underlying disk. We added
an "envelope" cache to the disk-based queue to avoid disk-hits on recent envelopes and
we observed a drastic improvement in performances, effectively pushing the limits we hit.

Note that the "disk" bottleneck is really not a problem in practice.
With a multi-million envelopes queue, which is far from being a common use-case you will
barely notice it, and the "real" bottleneck is the artificial limits that are used to
avoid blasting other mail exchangers. With a good SSD, you will unlikely ever hit a case
where you are limited by the disk.

**Do you measure code coverage? How often you use it: time from time or regular?**

We honestly don't.

The daemon is fairly simple and small, as well as split in very logical units.

We have been hacking on it for years now and we have been running it for several use-cases
ranging from low volume personal machines to massive volume mail hubs which has brought us
a very deep understanding of how it works.

We very rarely rely on profiling, I think we only did it once this year to prove a
theory when trying to understand a logic issue. We are confortable enough with the
code that for pretty much any scenario we can tell from the top of our heads which
components are involved and which ones takes time.

The tools are there to measure but we don't rely much on them.

**OpenSMTPD developers uses their own testing framework**
['smtpscript'](https://github.com/poolpOrg/smtpscript).
**What else tools, tests and testing frameworks do you use?
Do you use Continuous Integration in development?
What tool do you use for tracking open bugs?**

We used smtpscript a lot in the past, but most changes nowadays happen in the scheduler
and filters area which cannot be tested by this tool so our use of it has shrank.

Nowadays we rely a lot on a bunch of scripts and custom configurations which we do not
share with the community because they are impractical. Eric has setup an OpenSMTPD
instance which allows us to mail specific accounts, have the mail pass through several
rules and be checked against checksums to verify it was not mishandled.

We also use static analyzers like clang and coverity which have both helped us spot a
lot of bugs in error code paths that we are unlikely to hit. These tools make us more
confident about the worst case scenarios.

We also have a special "monkey" branch which randomly generates errors within OpenSMTPD
by simulating lack of resources and help us spot how the daemon copes with that. It has
helped us spot various errors at the beginning but now that APIs have stabilized a bit
it is not as helpful.

**OpenSMTPD usually releases two versions: one for OpenBSD and portable version
for other operating systems. What operating systems and hardware platforms
used in portable testing?**

Well, obviously we do the bulk of the testing on OpenBSD since that is our
primary development system. We mainly test on amd64, i386 and sparc64, but
we build on all architectures supported by OpenBSD and other developers do
run on ancient architectures which allowed us to fix bugs that would only
be visible on some random platform we don't have at hands.

Recently, we fixed a timer issue which caused OpenSMTPD to wake up every 30s
hit the disk and go back to sleep. This was not visible for any of us, but
it had a huge impact on VAX. Having access to these ancien platforms helps
improve the code quality even if for most users this isn't visible.

We also have two Linux test machines, both running Debian and we rely a lot
on power users who test on Linux and FreeBSD. We know it is tested on i386,
amd64 and arm at least.

**I know that project involve volunteers to stability testing (a-la flashmob).
For example:**
<blockquote class="twitter-tweet" lang="en"><p>Help us stress test our release, send a few mails to discard@test.opensmtpd.org ;-) <a href="https://twitter.com/hashtag/OpenSMTPD?src=hash">#OpenSMTPD</a></p>&mdash; OpenSMTPD, Inc (@OpenSMTPD) <a href="https://twitter.com/OpenSMTPD/statuses/403908361260785664">November 22, 2013</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>
<blockquote class="twitter-tweet" lang="en"><p>12.3M, still rock solid</p>&mdash; OpenSMTPD, Inc (@OpenSMTPD) <a href="https://twitter.com/OpenSMTPD/statuses/404017725699129344">November 22, 2013</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>
<blockquote class="twitter-tweet" lang="en"><p>Good news everyone: we found a bug \o/ thanks for the flood</p>&mdash; OpenSMTPD, Inc (@OpenSMTPD) <a href="https://twitter.com/OpenSMTPD/statuses/429324323413704704">January 31, 2014</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>
**Is it useful?**

Aaaah, the twitter flashmob calls !

Yes, they are very useful indeed.

We have used smtpscript to write flooding scenarios, we have written lots
of little scripts to flood us randomly, we have even created setups where
an OpenSMTPD floods another OpenSMTPD to test both incoming and outgoing
paths... but no matter what we do, the tests will be biased because tools
simply don't work like the real world.

In the real world, some people write SMTP directly, others rely on MTA,
others use some PHP or Python module. Some people lag, others don't,
some will rely on EHLO extensions, others not, ...

When we do these calls, we receive a large volume of very chaotic content
that is a sample from real internet trafic.

**Thanks for answers and wish you less bugs in your code!**

Thanks ;-)
