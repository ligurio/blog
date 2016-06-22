---
date: 2014-08-14T00:00:00Z
title: Тестирование sudo
tags: ["opensource", "openbsd", "interview", "softwaretesting"]
url: /2014/08/14/testing-of-sudo.html
---

<img src="/images/logo-sudo.png" alt="Sudo" style="float:left">

На этот раз я проинтервьюировал создателя и единственного разработчика программы *[sudo](http://www.sudo.ws/)* - Todd C. Miller.
Если вы хотя бы раз сталкивались с Mac OS, Linux или BSD, то знаете, что
утилита sudo позволяет делегировать права одного пользователя другому для запуска
программ.

*Это уже третье по счёту интервью с разработчиками открытых проектов о тестировании.
Первый был [про OpenSMTPD](/2014/07/29/testing-of-opensmtpd.html),
второй - [про X.Org](/2014/08/06/testing-of-xorg.html).
Как вам такой формат? Дайте знать, если будут замечания или предложения по улучшению.*

**How many developers involved in the development?**

For the most part, sudo is a one-man operation.  I do receive patches
from people and occasionally larger bits of functionality.  For
example, the initial LDAP support was written by Aaron Spangler and
the SSSD support was written Daniel Kopecek of RedHat.  The message
catalog translations are maintained by a number of different groups
coordinated via [translationproject.org](http://translationproject.org/).

**How does development process of sudo look like?**

I try to do three or four main releases a year and have specific
goals (or a list of to do items) for the upcoming release.  Most
bugs are fixed quickly and if a bug affects a large number of people
I'll put out a new patchlevel release with the bug fix.

**How does testing process look like (if it exists)?**

I use the development version of sudo on a daily basis.  This helps
find some bugs before users ever see them.  There are also beta
releases that receive some outside testing.  I can't test every
sudo feature manually so a growing set of regression tests help
ensure that features work the way they should.

**How often you do it: on each commit or it is time from time testing?**

I run the regression tests periodically through the release cycle.
I also have a build script that compiles sudo and runs the regression
tests sudo on all the platforms for which I make packages.

**I didn't find any tests in [source code of sudo](http://www.sudo.ws/repos/sudo/).
Do you really don't have any tests? What tools, tests and testing frameworks
do you use?**

You can find "regress" subdirectories throughout the sudo source
tree.  These contain various tests -- some which test specific functions
and other that test specific functionality.  The latter are typically
for testing parsing of sudoers files.  Currently, everything is
home-grown, with the sudoers file tests utilizing either the visudo
or testsudoers utilities. I've been considering switching to C-unit
for unit tests but have not done so at this time.

**Do you create tests on regular basis for new functionality and bugfixes?**

Yes, new tests are typically created when bugs are fixed or when
new functionality it added.  Sudo had no tests for a long time but
test coverage is slowly improving.

**What kind of testing do you use (performance, functional,
compatibility, stability, unit testing etc)?**

It is a mixture of functional, compatibility and unit testing.

**In case of using tests do you measure code coverage?
How often do you use it: time from time or on regular basis?**

I don't measure unit test code coverage at this time.

**I know Quest Software and Dell Inc. sponsored development of sudo.
Does they improve quality of sudo as sudo is a part of commercial product
(I mean [Privelege manager for Sudo](http://www.quest.com/privilege-manager-for-sudo/))?**

Dell (and Quest before it) give me time to work on sudo as part of
my day to day job which has helped improve the quality of sudo and
the speed at which bugs are fixed.  The Privilege Manage for Sudo
product doesn't actually include sudo itself (it requires an existing
sudo installation), but some of the major changes in the past few
years have bee a result of this sponsorship.  For example, session
logging, binary packages, the plugin interface.

**Do you use Continuous Integration in development process?**

No, currently, build tests are done manually toward the end of the
release cycle.

**What tool do you use for tracking open bugs? Who is responsible in
tracking of open bugs?**

I use bugzilla for bug tracking.  All bugs get assigned to me ;-)

**Sometimes sudo has security flaws (I mean a [list on sudo website](http://www.sudo.ws/sudo/alerts/)).
Do you use regular security audit of code?**

I have done several security audits of the code over the years.
For new code, I try to use best of breed interfaces that reduce the
likelihood of problems.  For example, using snprintf(), strlcpy()
and strlcat() for string handling, memory allocation functions that
check for integer overflow.  In addition, I turn up the compiler
warnings to detect potential problems such as sign comparison and
pointer arithmetic issues.

**Do you use static code analysis tools or services like Coverity?
Or maybe another techniques directed to improving quality of code?**

I regularly use tools such as the clang static analyzer, cppcheck
and valgrind to find potential coding and security errors.

**sudo utility supports all more or less popular operating systems:
Linux, FreeBSD, NetBSD, OpenBSD, Solaris, Microsoft Windows.
How you provide confidence in stable work for all these OSes?**

Sudo doesn't run on Microsoft Windows but it should work with any
modern POSIX-based system.  Sudo uses portable interfaces where
possible and its configure script tries to detect broken implementations.
Where a needed function does not exist on the system, sudo provides
its own private version.

**According to official site seems 'sudo' has often [releases](http://www.sudo.ws/sudo/news.html).
How you decide that new release is required and you are ready to release?**

I try to do three or four main releases a year. Typically I have
a few major changes or features in mind for a release and once those
are complete I try to wrap things up.  Often times something will
come up toward the end of the release cycle that needs to be included
but I try not to let the cycle to on too long.  Frequent releases
can help users in identifying when a bug or change in behavior was
introduced.  Also, since there are now a number of operating systems
doing one or two releases a year, this helps ensure that they can
include an up to date version of sudo.

**What was the most interesting bug in your practice? :)**

The "Vudu" vulnerability as described in [Phrack](http://phrack.org/issues/57/8.html).
The sudo bug itself is not nearly as interesting as the way malloc()
was subverted using it.

**Thanks for answers and wish you less bugs in your code!**

Thanks!
