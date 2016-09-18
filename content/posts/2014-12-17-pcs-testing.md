---
date: 2014-12-17T00:00:00Z
title: Автоматическое тестирование Parallels Cloud Server (англ.)
url: /2014/12/17/pcs-testing.html
tags: ["opensource", "softwaretesting"]
---

Полгода назад я опубликовал статью о [тестировании Parallels Cloud Server](http://habrahabr.ru/post/204292/).
По непонятным для меня причинам к статье был проявлен интерес от
англоязычных QA инженеров. Ниже перевод этой статьи на английский язык.

I want to tell you about the testing process of Parallels Cloud Server,
one of the products of Parallels Inc., where I’ve been working since
2005. I think the majority of our readers are familiar with the
product, mentioned in such articles as [Parallels рассекретила Cloud
Server](http://habrahabr.ru/company/parallels/blog/169927/),
[FastVPS: как мы меняли платформы виртуализации](http://habrahabr.ru/company/parallels/blog/190524/)
and [Собери сам: как мы сделали хранилище Amazon-style для начинающих хостеров](http://habrahabr.ru/company/parallels/blog/162381/). If you are still puzzled, I would definitely suggest you taking a look at
them. There are multiple reasons why the testing process of PCS may be
interesting, but the main one is, undoubtedly, the nature of the
products itself. It is complex, consisting of many components and
developed by several independent teams.

If it seems interesting to you, warm welcome to the next section.
[Parallels Cloud Server](http://www.parallels.com/ru/products/pcs/)
is a _bare metal product_, meaning that it is installed on bare hardware,
eliminating the need to any intermediate software.  In the heart
of PCS lays RHEL-based Linux distributive, more precisely Cloud Linux,
together with integrated components: patched Linux core,
[Parallels hypervisor](http://www.parallels.com/ru/products/pcs/hypervisor/),
[Parallels Cloud Storage](http://www.parallels.com/ru/products/pcs/cloud-storage/)
components, customized installer based on Anaconda, user friendly panel to manage containers
and virtual machines ([Parallels Virtual Automation](http://www.parallels.com/ru/products/pva/))
and dozens of command line tools to manage and monitor PCS.
Testing process covers every single component mentioned above.

## Preface

At the moment about 98% of PCS functionality is tested by auto tests.
The amount of tests we use has grown dramatically from 180 to 600 distinct
titles between PCS 6.0 and its predecessor, PCS 4.0. Peculiar traits that are now present in the
testing process owe much to the nature of the product: we run tests only
on hardware nodes, physical machines, and they are different from any
Selenium testing engines, especially in their complexity, sophisticated
configuration and overall duration (from 1 hour to 1 week).  To let you
see the whole picture, I am giving some real figures. For PCS 6.0 RTM
we’ve used 572 unique test titles and made 2959 runs during 2.5 month,
what equals ~ 294 computer/days. Whereas one of our latest updates was
covered by 260 unique test titles and 4800 runs.

<img src="/images/pcs-testing-1.png">

Nevertheless, the situation was different in the past. No later than several years ago we
didn’t have so many auto tests and didn’t possess so much hardware to
run them. We used to install software for every single HW node manually,
manually started auto tests and manually filed bugs to our bug tracking
system. Some time passed and the amount of HW nodes in tests grew from
20 to a hundred, number of tests to run on every single build increased
from 180 to 600. It all influenced the testing system and that’s why
we’ve come the testing system we use now.

## General schema of auto testing system

<img src="/images/pcs-testing-2.png">

The core of auto testing system is pretty simple, containing several services:

- builds – service that stores info about all product builds, their validation status, etc.,
- bug tracker – we use Atlassian Jira
- test report system – in-house written service that stores all previous
test runs’ details and results.
- deployment system – in-house written service for HW nodes management,
automatic OS deployment, automatic installation of all Parallels
Products, Windows Updates installation, hard disk backup, HW node
activities management (QA investigation, Developer investigation, Test
execution, etc., … )
- test scheduler (aka robot)

Every product build is validated by general acceptance criteria
(Basic Validation Test) and regular tests that are run continuously
(Stress Tests, Performance Tests, etc.).

When a fresh Parallels Cloud Server build is compiled according to the timetable,
builds portal receives the notification
about the successful build procedure and displays new build details.
After that, BVT (Basic Validation Test) is started automatically. The
test itself contains of two main parts – PCS validation (containers and
virtual machines testing) and Parallels Cloud Storage validation (same
tests, but using Cloud Storage as the main storage instead of local hard
drive). If BVT passes, notification about successful validation is sent
to the builds portal and current build is marked as valid. Finally, test
scheduler starts all planned test titles against current product build.
If BVT fails, no additional tests are run by test scheduler until new
build with fixed problem appears on builds portal.

Test scheduler is one of the main parts of our automatic test process. And if sometimes it
is possible to satisfy ones needs with out-of-box working solutions for
continuous integration tasks (like [Jenkins used by Yandex](http://tech.yandex.ru/events/meetings/testing-environment/talks/1471/)), it is not
possible is our case, because we have to implement custom logic for test
planning.

Using information from other internal systems, test scheduler
is able to perform the following tasks

- start test titles with varying test strategy
- prepare test environment on target HW nodes before the test run
- monitor new product build appearance
- monitor HW nodes current state using information provided by deployment
system
- monitor test plan for changes and test blocking product
bugs for status change
- verify bugs filed by auto test.

Before testing each new product update or release we compose the list
of test titles, test plan, to be run. Each test plan consists of test titles,
shortly defining test configuration that is needed (prerequisites for HW
nodes to run the test, test parameters, etc., …).

<img src="/images/pcs-testing-3.png" width="800">

Each test title has its own corresponding test job that contains information about needed
testing environment and additional test options, such as amount of
involved HW nodes, software/hardware HW nodes prerequisites (HW node, vm
or container needed, OS and product versions, etc, …). From time to time
Task scheduler (robot) spools test plan and continuously takes the next
test title from the list, then firstly tries to queue it for execution
if title is not blocked by any product or test bugs, secondly looks for
available HW nodes satisfying all test job requirements. If such HW
nodes are found, robot uses deployment system to initiate installation
activities on HW node: OS deployment, product installation and upon
successful completion, test title run.

<img src="/images/pcs-testing-4.png">

While test is run on a HW node, it is marked as busy with corresponding
activity on deployment system portal and is not used by other tests.

<img src="/images/pcs-testing-5.png">

The screenshot above illustrates that some test run on five HW nodes,
used _pclin-c19_ node a client (was start from the client, not from nodes themselves).
Parallels Cloud Server was installed on two HW nodes and IP pool reservation was
performed to provide for the future needs of virtual machines and
containers.

Successful test execution finishes with deployment system
exporting test results into test report system.

Deployment system activities finish releasing HW nodes for other tests. Test failures
lead to Jira bug creation. Every auto test filed bug contains the
following information: versions of products involved into the test, test
results link, test description, back trace of the test, instructions for
test re-execution, problem report for virtual machine and link to
previous runs of the same test title (Do you still remember what test
title means?). Each bug contains assigned HW nodes, the ones involved in
the failed test (the following screenshot shows _mccp46_, _ts49_ and
_svvpamd_).

<img src="/images/pcs-testing-6.png" width="800">

These nodes have QA investigation activity on deployment
system and are eliminated from other tests until they are released
manually.

Our engineers in test and developers always have a
possibility to investigate the bug in the original environment. If the
bug is trivial and nodes are not needed, they are released either from
Jira assigned nodes field or by finishing the activity on deployment
system.

<img src="/images/pcs-testing-7.png" width="800">

We also use the graph below to see the dynamics of testing in
time and know what our servers are busy with.

As I’ve already written, task scheduler is able to validate product bugs
automatically. How does this work you would ask? Every product commit
contains an obligatory comment, referring Jira issue reference.
After the product build event, build version field is updated in field "Fixed in build"
for issues mentioned as closed for corresponding change log.

<img src="/images/pcs-testing-8.png" width="800">

Robot considers this information and reruns tests only for those builds
that have a fix. If rerun succeeds, robot marks Jira bug as validated
on new builds number and provides a link new results.

<img src="/images/pcs-testing-9.png" width="800">

But automation is not the answer to all our needs.
Unfortunately or gladly, ☺ we are still unable to make the process of
testing fully automated. Such an intricate production-level system of
auto testing requires a human attention, of a single engineer in test in
our case, to take care of test runs, analyze their results, add new test
configurations, create test plans with needed titles to accept the
product change, develop test scheduler logic and provide HW node support
and maintenance (sometimes they break down, sometimes require new
hardware, such as SSD or USB bulk device emulator device, etc).

And what are your news in automatic testing? :)


**Thanks to Galina Polyakova for translation of [original article](http://habrahabr.ru/post/204292/).**
