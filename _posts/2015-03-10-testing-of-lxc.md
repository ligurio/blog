---
layout: post
title: Тестирование LXC (Linux Containers)
---

{{ page.title }}
================

<p class="meta">10 марта 2015 - Москва</p>

[LXC](https://linuxcontainers.org/) - это проект по разработке технологии
контейнерной виртуализации в ядре Linux, преследующий цель
обеспечить функциональность контейнеров на уровне OpenVZ в ванильном ядре.
Кстати, OpenVZ, который в основном разрабатывают в Parallels, и LXC,
поддерживаемый разработчиками Canonical - это не два конкурирующих проекта.
OpenVZ можно рассматривать как надстройку над LXC (так как
LXC ещё готова к полноценному использованию, многих вещей в ванильном ядре нет,
а OpenVZ патч это добавляет) плюс наши утилиты командной строки (vzctl и друзья), плюс всякие шаблоны и т.п.
А разработчики OpenVZ -- одновременно разработчики LXC!
Более подробно о всех хитросплетениях проектов [описал](https://ru-openvz.livejournal.com/1970.html)
Кирилл Колышкин. LXC для управления контейнерами предоставляет свой набор утилит,
но если вам знакома утилита vzctl из проекта OpenVZ, то вы можете использовать её,
она [поддерживает работу с upstream ядром](https://openvz.org/Vzctl_for_upstream_kernel).

Стефан Грабе (Stéphane Graber), разработчик проекта LXC, рассказал как устроены
разработка и тестирование в проекте LXC.

<img src="http://blog.bronevichok.ru/images/logo-lxc.png" height="130" alt="LXC logo" style="float:left; margin-right: 40px;">

**Please introduce yourself.**

Hi,

I'm Stéphane Graber. I work for Canonical Ltd. and I'm the project leader
for LXC and its other related projects (cgmanager, lxcfs and lxd).

**How does development process of LXC look like? Do you use Continuous Integration
in development process?**

LXC's development is a bit of an hybrid. We have a bunch of contributors
who are used to kernel-style workflow, so mostly communicating on our
mailing-list, doing code-reviews through e-mails. And then we have some
other contributors who prefer to use github pull-requests.

We accomodate both.

Any change landing in LXC must have been reviewed by one of the
committers and committers obviously can't review their own code.

We have some minimal tests that are run using Travis both on commits in
the main repository and for pull requests.

And we have much more comprehensive integration tests covering multiple
compilers and multiple architectures which we run on every commit in our
Jenkins.

**LXC source tree contains directory with a [number of tests](https://github.com/lxc/lxc/tree/master/src/tests).
How does testing process look? Do you use regular testing?**

Testing happens on every commit so git master is usually functional.

We also have daily builds available for Ubuntu which a lot of our
developers run on their day to day machine, helping catch anything the
testsuite may have missed.

The same testsuite is also used by distributions downstream to make sure
LXC didn't regress in their particular environment.

**What tools, tests and testing frameworks do you use? How do often
developers create new tests?**

LXC's testsuite is a mix of C binaries and shell scripts. It's typically
targeted at either big features like unprivileged containers doing an
end to end test in those cases or at very narrow, specific security
features like apparmor where we want to test all the edge cases to make
sure nothing can possibly regress.

We usually get new tests with new important features.
Regression testing for LXC is made difficult in that most of the
bugfixes we incorporate these days is targeted at a very specific
environment (typically kernel + kernel configuration + mount table)
which we can't really replicate.

**What is the process for testing new features or significant changes?**

The developer would typically send an e-mail to our list describing
exactly what they plan on implementing, getting feedback there, then
branch the code, implement the feature, ideally add a testcase and then
send it for review.

At that point, we'll make sure that the code does match the original
description of the feature which everyone agreed on, a few developers
will pull the branch and test the feature manually, looking for corner
cases, send review feedback and after a few iterations of that, the code
gets pushed to master.

**What kind of testing do they use (performance, functional,
compatibility, stability, unit testing etc)? Do you test manually?**

As LXC in itself doesn't have any runtime overhead by design,
performance testing isn't something we worry about much. Any performance
issue with containers is likely to be a kernel bug.

Functional, stability and to some extent unit tests are achieved through
our testsuite. It does make sure LXC's main feature all work as
expected. It runs in a perfectly identical environment every time, so it
makes detecting any change very easy and because we run it hundreds of
times a day, resulting in tens of thousands of containers being created,
it's bound to run into any potential race condition we may have.

**The most important thing in virtualization is isolation. How do you
test it for containers?**

LXC sets up the isolation by using kernel features, it doesn't itself
manage the isolation, so there's little risk of regression there.

We do still have tests for some specific kernel security features like
AppArmor which will try to escape the isolation in order to ensure that
our security profile was indeed applied by the kernel and that there
wasn't a big kernel regression (we've caught a few over the years).

**Do you have a list of known issues for isolation with public available exploits?**

We don't have a list, no.

LXC's policy is not to consider privileged containers as safe. There has
been exploits in the past and there will be in the future because that
way of running containers just isn't secure by design.

LXC does provide apparmor, selinux and seccomp profiles which as far as
we know blocks every single exploit out there but resource DoS is still
possible and there's bound to be a few more possible ways of escaping
the container.

What we implemented a while back are completely unprivileged containers,
those are safe by design as any exploit which would let you escape one
such container would equally let any unprivileged user on your system
become root. That's not to say such exploits don't exist, but they're a
lot more visible and so a lot more likely to have been thought about and
solved.

For unprivileged containers, there has been a few exploits of kernel
bugs in the past but all of those have been resolved in the current
Linux kernel and the fixes have been backported to all stable Linux
kernels.

**Do you run these exploits as a part of regression testing? Does these
tests available for community?**

We don't, though some of our tests probably go through some of the same
code paths. Really, any of those security issues would have been kernel
bugs and so regression testing belongs in the kernel, not in LXC.

**Do you use regular security audit of code?**

Not regular. The Ubuntu security team has been kind enough over the
years to do code reviews for specific privileged bits of code we wrote.

And again, LXC isn't a virtual machine, it doesn't catch and interpret
everything that happens in the container. It only does a bunch of kernel
calls at the start and at the end of the container and provides a user
interface to interact with the container. The isolation and security is
entirely done by the kernel.

Also, currently LXC doesn't expose any interface to the container so
there's no way from within the container to trigger any reaction from
the LXC process outside of it. Making the attack surface there, non-existent.

**LXC supports a number of architectures (i686, x86_64, ppc, ppc64,
S390, armel and armhf). Do you really test all of them regularly?**

We do test builds and test runs on i686, x86_64, ppc, ppc64, ppc64el,
armel, armhf and arm64 on every commit.

I don't have a big IBM mainframe in my basement so we don't do automated
S390 testing :)

**Do you measure code coverage of LXC? How much of code covered by tests?**

We don't.

**Do you use negative testing techniques (like fuzz testing, fault injection etc)?**

We've received a few patches as a result of people doing some fuzzing,
specifically with our configuration parser, but while those are
definitely issues we'll accept patches for. They're not security issues
since you must be the container owner to have access to that, so finding
more of those isn't a priority for us.

**Do you use static code analysis tools or services like Coverity?
Or maybe another techniques directed to improving quality of code?**

Every commit gets uploaded to Coverity and while it often gets confused
due to our use of some unusual kernel features, it has helped us find
quite a number of issues which we usually fix in batch every so often
(look for coverity: in our commit messages).

**Do you involve community in testing process of LXC?**

Sure, LXC is a community project, we don't all work for the same company
and so everyone is welcome and encouraged to help testing.

I typically act as the release manager, publishing a rough timeline for
the release as we get to the point where we have enough changes to
warrant a release. Once we start hitting RCs, we encourage all of our
contributors and advanced users to make sure their use case still works
fine (be that running LXC on Android, running on some obscure embedded
system, some odd architectures or making sure their language bindings
are up to date with our library).

**Let's imagine someone want to contribute to LXC quality. What will you
advice to him?**

That we very much welcome help there but to keep in mind that to keep an
active community, we need to make contributing easy.

So having extra tools that we can automatically run and that will report
real problematic issues is great. Having an overly strict set of rules
or requiring everyone add metadata or run their change through some
extra tools before contributing, isn't acceptable to us.

**What are the release criterias for new LXC versions?**

Testsuite must pass, all commiters must be happy with the state of the
release, all templates must work on their respective distribution, all
public images (download template) must work in both privileged and
unprivileged mode, no existing API call can have been modified or
removed within the same major release (1.x), all new options must have
been documented in the manpages and typically at least 24h since the
last change was commited.

**What was the most interesting bug in your practice?**

Hard to think about a single particular one. We don't typically get very
difficult frustrating bugs. Getting systemd working properly was
probably one of the most frustrating and lengthy experience we had in a
while. It required a bunch of upstream systemd fixes which I had to
contribute, we had to write a new filesystem for it, rework the way
devices work in LXC and add a bunch more configuration options too.

But that one is somewhere between a bug (distro X doesn't work in LXC)
and a feature (get that crazy init system working in a container).

Some of the more frustrating bugs we had to deal with in the past,
weren't LXC bugs at all but kernel bugs instead. Typically the result of
some security update done in a rush upstream, pulled by all the distros
and breaking LXC and containers in general in some horrifying ways.

Those are very stressful because all of a sudden nothing works anymore.
Finding the culprit is pretty simple (kernel changed, things stopped
working), but coming up with the right upstream fix is difficult (and a
revert is out of the question as that'd re-introduce a now disclosed
security flaw).

Fin
