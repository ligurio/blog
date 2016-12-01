---
date: 2014-09-01T00:00:00Z
title: Тестирование Python
tags: ["opensource", "interview", "softwaretesting"]
url: /2014/09/01/testing-of-python.html
---

<img src="/images/logo-python.png" alt="Python" style="float:left">

[Python](https://www.python.org/) - высокоуровневый язык программирования
общего назначения, ориентированный на повышение производительности разработчика и читаемости кода.

Разработчик Python согласился ответить на мои вопросы о разработке и тестировании Python.

**Please present yourself.**

Brett Cannon, core developer since 2002.

**How many developers involved in the development on regular basis?**

According to Open HUB we had as high as 36 contributors in a single month in the
past year
([https://www.openhub.net/p/python/contributors/summary](https://www.openhub.net/p/python/contributors/summary)).

**How development cycle of Python looks like?**

The Python devguide covers this in detail:
[https://docs.python.org/devguide/](https://docs.python.org/devguide/).

**I have found continuous integration tool based on
[BuildBot](https://www.python.org/dev/buildbot/).
What else tools, tests and testing frameworks do you use?**

We use unittest primarily for our tests and our own test runner.

**Do developers create tests on regular basis for new functionality and
bugfixes?**

Yes; it is expected all bugfixes and new features have tests.

**What process do you use for testing?**

We don't have an overarching one other than tests
should be written to make sure semantics don't regress.

**What kind of testing do you use (functional, compatibility, stability, unit
testing etc)?**

The buildbots handle compatibility. Otherwise it's mostly unit and functional
testing.
 
**Python has [performance test
suite](https://hg.python.org/benchmarks/file/9a1136898539/README.txt) How often
do you run it?**

Whenever someone chooses to run it (no continuous run of it).

**Do you compare results only with previous versions?**

Rarely. It's typically only used for verifying that an experimental performance
improvement actually improves performance.

**What are the criterias for good performance results?**

Typically at least a 5% increase in performance across
the board for anything that may increase code complexity.

**Do you use negative testing techniques
(like fuzz testing, fault injection etc)?**

Victor Stinner has in the past (e.g. this is
why the faulthandler module exists in the stdlib).

**Do you measure code coverage?**

On occasion, yes. It is a common starter project for new contributors.

**How much of code covered by auto tests?**

I don't have the number handy for a recent coverage run.

**What tool do you use for measuring code coverage?**

[coverage.py](https://pypi.python.org/pypi/coverage)

<!--
** How looks development and testing of new feature? **
-->

**Do you involve volunteers to testing? I mean things like 'crowd sourcing'.
(For example Perl community uses volunteers resources to test CPAN modules.
See [slides from OSCON 2010](http://www.dagolden.com/wp-content/uploads/2009/04/Free-QA-OSCON-2010.pdf) (PDF)
and [http://www.cpantesters.org/](http://www.cpantesters.org/))**

PyPI is run independently from python-dev so that doesn't apply here.
We do include the test suite with Python so users can run it and report any issues they have.

**It seems you keep all bugs in bug tracker on
[https://bugs.python.org/](https://bugs.python.org/).  Who is responsible for
tracking of open bugs?**

Everyone and no one. =) As a group we try to track bugs, but no one individual owns it.

**Do you have triage process?**

Yes, and it's covered in the devguide.

**Do you make regular security audit of code?**

We have a Coverity project set up which regularly
scans the code (maintained by Christian Heimes).
They did a press release about our very low defect rate:
[https://www.coverity.com/press-releases/coverity-finds-python-sets-new-level-of-quality-for-open-source-software/](http://www.coverity.com/press-releases/coverity-finds-python-sets-new-level-of-quality-for-open-source-software/).

(Interviewer's note: see also [Coverity Scan report](http://wpcme.coverity.com/wp-content/uploads/2013-Coverity-Scan-Spotlight-Python.pdf) (PDF))

<!--
** Do you use static or dynamic code analysis tools or services like Coverity?
Or maybe another techniques directed to improving quality of code? **
-->

**Who is responsible for releasing of new version? What are the release
criterias?**

We have a release manager. Release criteria is technically no release blockers,
but otherwise it is up to the RM to make that call.  There is always a PEP
written to outline what the targeted release dates are.

<!--
** What was the most interesting bug in your practice? :) **
-->

**Thanks for your answers.**
