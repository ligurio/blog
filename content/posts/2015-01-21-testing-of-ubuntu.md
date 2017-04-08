---
date: 2015-01-21T00:00:00Z
title: "Интервью: тестирование Ubuntu"
tags: ["opensource", "interview", "softwaretesting"]
url: /2015/01/21/testing-of-ubuntu.html
---

<img src="/images/logo-ubuntu.png" height="210" alt="Ubuntu" style="float:left">

В этом году исполняется 10 лет такому Linux дистрибутиву как Ubuntu.
Я задал несколько вопросов человеку, который непосредственно отвечает за качество этой ОС -
Nicholas Skaggs.

**Please introduce yourself.**

My name is Nicholas Skaggs and I'm a community manager for Ubuntu working
at Canonical. I specifically focus on quality efforts and making sure Ubuntu
is the best it can be. This involves working with a wonderful community
of testers and developers to help release Ubuntu images. I also work to
encourage app developers to make sure there code is well tested.
This involves helping educate and provide tools and documentation.
Testing is a wonderful thing and can be an enjoyable experience rather
than a feared part of application development.

I trust Ubuntu is familar to everyone, but just in case, Ubuntu is a Linux
distribution founded to focus on the desktop and make it easy to use Linux at home.
It's based upon Debian and recently celebrated it's 10 year anniversary.
New versions are released every 6 months, with long term supported versions
coming out every 2 years. Running an LTS (long term support) version
is recommended for new users.

**How does development process of Ubuntu look like?**

The development process of Ubuntu as a distribution started out
as a 6 month cadence. This was intended to match other open source
communities release schedules. In particular GNOME's release schedule,
which was a major upstream for the Ubuntu desktop. As Ubuntu has evolved
it has adopted a more rolling release model with LTS releases providing
a stable foundation to build things. The 6 month releases are stable,
but are more of an intermediate stepping stone between LTS releases.
Each 6 month cadence begins with an update of all downstream software
into the Ubuntu repository. Much of this occurs by syncing with Debian unstable,
but package updates can come from many sources. From there, traditionally
a UDS (Ubuntu developer summit) event would occur which allowed teams
to plan and share there work for the next cycle. These events have been
replaced by UOS ([Ubuntu online summit](https://summit.ubuntu.com)), which also
occur every 6 months and allow the community to plan and share as usual,
but occur virtually so anyone can participate.

In addition, Ubuntu has adopted a much faster process for Ubuntu for phone,
which allows for continuous development and updates to stable as they occur.
However, the traditional 6 month development cycle that has been a trademark
since the beginning of Ubuntu remains in place with only minor refinements from the original.

**How many developers in Canonical involved in the development?**

Many :-) I don't have any real numbers, but suffice to say its <500 people.
However, the beauty of open source means they are aided by thousands of
other developers worldwide across a wide range of projects and distributions.

**How does testing process look? Do you use regular testing?**

We have automated testing of many packages before they enter into Ubuntu,
but we also leverage Debian and sync packages directly from them
on a regular basis during development of a release. The primary tool
for this is autopkgtest and DEP-8 which you can read more about [here](http://packaging.ubuntu.com/html/auto-pkg-test.html) and [here](http://dep.debian.net/deps/dep8/).
These tools prevent syncing broken packages from what we call the -proposed
to the repository proper. In addition, package tests are run for new versions
of any package of it's dependencies to prevent a package from entering
the repository that would break an existing package.

**What tools, tests and testing frameworks do you use? Do developers
create tests on regular basis for new functionality and bugfixes?**

[Autopilot](https://wiki.ubuntu.com/Touch/Testing/Autopilot), [PhantomJS](http://phantomjs.org/),
[googletest](https://code.google.com/p/googletest/) (Google C++ Testing Framework),
qmltestrunner; all sorts of different testing frameworks and tools.
For projects which Canonical is owner (such as [Unity](https://unity.ubuntu.com/) and [Mir](https://unity.ubuntu.com/mir/)),
tests are added regularly to deal with regressions (as part of bugfixes),
and new tests are required for new functionality. The code is reviewed
before being merged into the project and part of this review is ensuring
testing needs are met. Jenkins is the primary gatekeeper for ensuring
the tests pass before the code can be merged. Buildbots are run
on every commit to a merge proposal.

**Do you have something like Basic Validation Test (aka acceptance testing)
for each new build?**

Yes, Autopilot provides acceptance testing for each new build.
Acceptance tests are run before merging code into a project,
and also as part of validating an image. We keep these system level acceptance
tests in [their own repository](https://launchpad.net/ubuntu-autopilot-tests).
They consist of tests that encoporate code from many different projects.
For example, dialing a phone number and ensuring the call is placed
and the caller can be heard, etc involves several applications and system services.

**Do you have 'home made' testing tools?**

Autopilot is homemade; that is to say it's an open source testing tool
originally designed for testing Unity, whic is our desktop enviroment.
It's evolved to support our other testing needs and can be utilized
by others to test any GTK or QT application.
Check it out: [sources](https://launchpad.net/autopilot), [wiki](https://wiki.ubuntu.com/Autopilot)!
We also use apport and whoopsie which allow us to collect meaningful data
on crashes and other errors in the released versions of Ubuntu in a seamless
and automated fashion. Check out [errors.ubuntu.com](https://errors.ubuntu.com/).

<img src="/images/Ubuntu-Error-reports.png" width="65%" alt="Ubuntu" style="float:left">

Finally, we use what is called the "CI train", which is intended to provide
continuous integration and handle our release process.
The tool lives on [Launchpad](https://launchpad.net/uci-engine).
Lest I forget, we also make use of [umockdev](https://github.com/martinpitt/umockdev),
which allows us to mock hardware devices.

Finally, we use what we call the qatracker. This tool handles keeping track
of all of our manual testcases and manual test results. It's implemented as module for Drupal,
allowing easy deployment and accessibility via the web. The primary domains
are under *.qa.ubuntu.com, like the image tracker, [iso.qa.ubuntu.com](http://iso.qa.ubuntu.com).

**What is the process for testing new features or significant changes?**

The process is what is affectionately known as the CI train.
First, a change must be merged and accepted into the upstream project itself.
This occurs inside of each project team and requires a code and testing review.
In addition, an automated Jenkins build and run of the project has to succeed.
Once completed, Jenkins will take the new branch and merge it into
the main project branch. From there the change can be placed into what
is known as a silo. A silo allows QA to review the change in isolation
with a known good image. This is done by taking a valid image containing
only the change in question. This image is then tested for proper
functionality of the change; some manual testing may occur as part of this process.
If it passes QA's testing it can be placed as part of the next proposed image.
This proposed image itself is released based upon release criteria
involving manual testing as well as passing acceptance tests. Once a proposed
image meets all the criteria for release and is signed off by QA,
the image is released. Only then does the new feature or change land on a user's device.

**What kind of testing do they use (performance, functional,
compatibility, stability, unit testing etc)? Do you test manually?**

Unit and functional testing is done on a project by project level.
Manual testing is used after all acceptance tests are good and we want
to validate a specific image for release.

**Do you use negative testing techniques (like fuzz testing, fault
injection etc)?**

This is done on a more individual project basis.

**Do you measure code coverage? How often do you measure it?
How much of code covered by auto tests?**

We do attempt to measure it, although I don't have a lot of knowledge about it.
It's run via Jenkins and requires the underlying project and language
to report coverage (tox, or whatever else). We aim for 100% in every project,
but fall somewhat sort of that. https://launchpad.net/qa-coverage-dashboard
is the code driving this.

**What tool do you use for tracking open bugs?**

[Launchpad](https://launchpad.net).

<img src="/images/Ubuntu-Launchpad.png" width="100%" alt="Ubuntu">

**Do you have triage process?**

Yes. And we have a wonderful group of community members who
help keep bugs triaged on Launchpad. You can find out more about
the triage work and team (and even pitch in!) [here](https://wiki.ubuntu.com/HelpingWithBugs).

**Do you use regular security audit of code?**

Yes, the Security Team handles this. In addition, we invest
in things like [AppArmor](https://wiki.ubuntu.com/AppArmor)
which provides application isolation from the system.
Should there be a security issue, the goal is to limit
any potential impact because of this confinement. An application or
service is extremely limited by default; so a rogue application
would only be able to impact itself. This technology has shipped
within Ubuntu for some time.

While developing the phone, we took it a step further and enhanced
the protection provided by AppArmor. You can see the result of
this work with Snappy. Snappy provides a minimal read-only
core system with transactional updates. This allows us to keep a very close
eye on the core system, while allowing the user to safely run and update
applications which are confined. Check Snappy out [here](https://ubuntu.com/snappy).

**Do you use static code analysis tools or services like Coverity for
Ubuntu components? Or maybe another techniques directed to improving quality of code?**

We have used services like Coverity in the past and would continue
to do so on an individual project basis. Overall code quality comes
in adopting standards for merging, including things like requiring PEP8
conformity for python code, using Google C++ style guide, etc.

**Who is responsible for releasing of new version? What are the release
criterias?**

For the distribution as a whole, the release team still handles releasing.
This invovles freezing an image and testing it (including fixes as you go)
until it's satisfactory for release. With the communitities help,
images are made availible on iso.qa.ubuntu.com, along with the
series of tests for each image. The isotracker handles tracking results,
but ultimately releasing is done manually by the release team.

For individual packages, updates to stable distributions are called SRU's
(stable release updates). These must be tested and review like any other change.
However, in addition to this, the update is rolled out slowly so it can be
easily backed out should something go wrong in the initial batch of users who updated.

For Ubuntu phone, the CI team takes the lead for releasing.
The release criteria is more or less QA signoff combined with satisfactory
manual testing and automated test results. You can see the results
in realtime for each build on the [CI dashboard](http://ci.ubuntu.com/).

<img src="/images/Ubuntu-Dashboard.png" width="100%" alt="Ubuntu">
<br>

**What was the most interesting bug in your practice? :)**

[The original bug #1](https://bugs.launchpad.net/ubuntu/+bug/1) for Ubuntu.
I won't spoil the surprise. Hint, it's been closed recently!
