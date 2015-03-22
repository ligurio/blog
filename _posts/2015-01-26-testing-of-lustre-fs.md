---
layout: post
title: Тестирование LustreFS
---

<p class="meta">26 января 2015 - Москва</p>

<img src="http://blog.bronevichok.ru/images/logo-lustrefs.png" height="210" alt="Lustre FS" style="float:left">

[LustreFS](http://wiki.lustre.org/) - это распределённая файловая система.
Роман Григорьев согласился ответить на вопросы о разработке и тестировании LustreFS.

Дополнительные ссылки: слайды [Testing Lustre with Xperior](http://www.eofs.eu/fileadmin/lad2014/slides/08_Roman_Grigoryev_Xperior__LAD14_Seagate.pdf), [Wikipedia](https://en.wikipedia.org/wiki/Lustre_(file_system)).

**Could you briefly introduce yourself?**

I work for Seagate (before acquisition - for [Xyratex](http://www.xyratex.com/)) on quality
and builds tools include testing automation for Clusterstore.
I'm  describing here my point of view and it is not Seagate or OpenSFS view. 
Lustre has pretty big community, maintainer(and main developer) is Intel. The most of answers are 
about  Seagate Lustre testing with references to public  testing. All this info is
available on OpenSFS and EOFS sites, especially in slides and videos from conferences.

**How does testing process look? Do you use regular testing?**

Lustre is tested regularly , in Seagate we do testing:

- for every commit (Gerrit/Jenkins) on fixed setup
- predefined matrix of branches/setups/days or weeks

Many other companies do testing on their specific hardware for their
fixes and configurations.

Intel support public Gerrit/Jenkins/testing solution for every fix
to main Lustre repo also as release testing.

**What tools, tests and testing frameworks do you use for testing Lustre?
Tell about each tool.**

Main tool is [Lustre own tests](http://wiki.lustre.org/index.php/Acceptance_Small_%28acc-sm%29_Testing_on_Lustre)
(include own framework). It is big set of functional and performance-like
tests which covers the most of Lustre features.

Also we're executing LTP ([ltp.sourceforge.net](http://ltp.sourceforge.net))
and number of benchmarks (ior, mdt and so on).

In Seagate as test executor and system monitor we use Xperior which
was originally written especially for this task. Jenkins manages
resources and controls Xperior execution (and build also). Results are
available in Jenkins and also in private results database.

Intel use private Maloo system for executing Lustre tests and reporting results.

**What kind of testing do you use (performance, functional,
compatibility, stability, unit testing etc)? Do you use manual testing?**

Historically Lustre doesn't have significant amount of unit tests,
the most of test are functional. As performance tests we often use
generic file system benchmarks and wrappers for them. Compatibility testing
question doesn't has simple answer. Lustre has big kernel space code part and it is
reason for checking compatibility with kernels, drivers, hardware.
Companies often do testing only on basic development platform and target platform(s).
I think, if we speak about full picture, Lustre compatibility testing
could be evaluated as not so bad because number of developers and products.
From other side, we have a lot of Lustre versions include a version
in vanilla kernel and we should do interoperability testing,
e.g. checks how new server works with old client and vise verse.
Some stability testing we do via Lustre own tests and some testing
on target platform when high availability subsystem is on.

Time to time we use manual testing, mostly for debugging. I think, in 99% runs are automated.

**Do you use negative testing techniques (like fuzz testing, fault injection etc)?**

Lustre has fault injection support and developers use it. I know about
few fuzz testing implementing attempts but, as I know, it was not included
to main test set. Maybe as some kind of fuzz testing could be evaluated
Xperior feature to executing  functional tests in random order and many times.
If we avoid file system umount and clean up we potentially could generate
new critical situation  and states of file system because of random test order.

**Do you measure code coverage? How often do you measure it?
How much of code covered by auto tests?**

We did last measurement about 2 years ago. On simple all-on-one-node
setup we got pretty small numbers ~56% lines, ~66% functions and ~44% branches.
We definitely should improve setup and do it regularly.

**Do you use regular security audit of code?**

I haven't heard about regular audit, only about case-to-case checks.
I think it's mostly important for full product (Lustre FS + Linux distribution + hardware).

**Do you use static code analysis tools or services like Coverity for
Lustre components? Or maybe another techniques directed to improving
quality of code?**

One company do Lustre checks with Coverity and push fixes for found issues.
Unfortunately, by licensee limitations report wasn't published and it's hard
fully evaluate it. I discussed with guy from the company on conference
and asked him for the most critical issues from Coverity and comparing
it with [CppCheck](http://sourceforge.net/projects/cppcheck/) list which I had.
From high level view, CppCheck warnings set was subset of Coverage set
and bigger part of high priority warning was same but it's hard to evaluate
it in details. In Seagate we decided that it is good idea for integrating CppCheck to our process.

Intel executes HPDD Checkpatch (looks like same as Linux kernel [checkpatch](https://github.com/torvalds/linux/blob/master/scripts/checkpatch.pl))
on every Gerrit commit. As other techniques for improving quality I could
name cross-review in company and cross-companies when sending changes to main repos.

**What was the most interesting bug in your practice? :)**

Usually interesting bugs are not bugs but features :)

Fin
