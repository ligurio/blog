---
date: 2015-05-15T00:00:00Z
title: Тестирование ПО в Facebook
url: /2015/05/15/testing-at-facebook.html
---

Инженер из Facebook рассказывает о тестировании в компании:

<img src="/images/logo-facebook.png" height="130" alt="FB logo" style="float:left; margin-right: 40px;">

We do several kinds of testing. Some specifics:

* For our PHP code, we have a suite of a few thousand test classes using the
PHPUnit framework. They range in complexity from simple true unit tests to
large-scale integration tests that hit our production backend services. The
PHPUnit tests are run both by developers as part of their workflow and
continuously by an automated test runner on dedicated hardware. Our developer
tools automatically use code coverage data to run tests that cover the
outstanding edits in a developer sandbox, and a report of test results is
automatically included in our code review tool when a patch is submitted for
review.
* For browser-based testing of our Web code, we use the Watir framework. We have
Watir tests covering a range of the site's functionality, particularly focused
on privacy—there are tons of "user X posts item Y and it should/shouldn't be
visible to user Z" tests at the browser level. (Those privacy rules are, of
course, also tested at a lower level, but the privacy implementation being
rock-solid is a critical priority and warrants redundant test coverage.)
* In addition to the fully automated Watir tests, we have semi-automated tests
that use Watir so humans can avoid the drudgery of filling out form fields and
pressing buttons to get through UI flows, but can still examine what's going on
and validate that things look reasonable.
* We're starting to use JSSpec for unit-testing JavaScript code, though that's
still in its early stages at this point.
* For backend services, we use a variety of test frameworks depending on the
specifics of the services. Projects that we release as open source use
open-source frameworks like Boost's test classes or JUnit. Projects that will
never be released to the outside world can use those, or can use an
internally-developed C++ test framework that integrates tightly with our build
system. A few projects use project-specific test harnesses. Most of the backend
services are tied into a continuous integration / build system that constantly
runs the test suites against the latest source code and reports the results into
the results database and the notification system.
* HipHop has a similar continuous-integration system with the added twist that
it not only runs its own unit tests, but also runs all the PHPUnit tests. These
results are compared with the results from the same PHP code base run under the
plain PHP interpreter to detect any differences in behavior.

Our test infrastructure records results in a database and sends out email
notifications on failure with developer-tunable sensitivity (e.g., you can
choose to not get a notification unless a test fails continuously for some
amount of time, or to be notified the instant a single failure happens.) The
user interface for our test result browser is integrated with our bug/task
tracking system, making it really easy to associate test failures with open
tasks.

A significant fraction of tests are "push-blocking"—that is, a test failure is
potential grounds for holding up a release (this is at the discretion of the
release engineer who is pushing the code in question out to production, but that
person is fully empowered to stop the presses if need be.) Blocking a push is
taken very seriously since we pride ourselves on our fast release turnaround
time.

My team, Test Engineering, is responsible for building the common infrastructure
used by all the above stuff, as well as for maintaining PHPUnit and Watir.
Facebook has no dedicated QA team; all Facebook engineers are responsible for
writing automated tests for their code and keeping the tests maintained as the
underlying code changes.

Facebook's test setup is still very much a work in progress, but the above is at
least a taste of what we do in that area.

[via](https://www.quora.com/What-kind-of-automated-testing-does-Facebook-do)
