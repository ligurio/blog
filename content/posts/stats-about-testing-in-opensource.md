---
date: 2016-06-10T00:00:00Z
title: Статистика о тестировании в открытых проектах
tags: ["junit", "subunit", "testformats"]
---

Мне нужно написать парсеры тестовых отчётов в форматах JUnit, TAP и SubUnit.
Парсеры почти готовы и чтобы их протестировать мне нужно было найти результаты
из настоящих проектов. Нужные данные я нашёл, но дополнительно я проанализировал
информацию о пятидесяти открытых проектах, чтобы ответить на три вопроса:

* доступны ли результаты о тестировании в выбранных проектах публично
* какие форматы используют проекты для отчётов о тестировании
* возможно ли принять участие в тестировании в выбранных проектах

Я получил следующие данные:

* чуть менее половины проектов (24) публикует данные о тестировании
* половина проектов использует три наиболее популярных формата: TAP (19), JUnit
(8), SubUnit (3), остальные изобрели какой-то свой формат
* в десяти проектах возможно участие людей со стороны

| Проект		 | Формат			| Данные о результатах тестирования доступны публично | Возможность принять участие в тестировании проекта |
| -------------- |:----------------:|:-------------------:|------:
| LibVirt        | [TAP](https://libvirt.org/testtck.html) | Нет | Нет |
| LTP (Linux Test Project) | [TAP](https://www.mail-archive.com/ltp-list@lists.sourceforge.net/msg21870.html)? | [Да](http://www.lineo.co.jp/ltp/linux-4.3-results/result.html) | Нет |
| [CRIU](https://criu.org/)	  | [TAP](https://github.com/xemul/criu/commit/c4e13bc92816fa049a46fbc491a62098e422948c) | [Да](https://ci.openvz.org/view/CRIU/job/CRIU/job/CRIU-ppc64le/branch/criu-dev/102/tapResults/) | Нет |
| OpenVZ  | - | Нет | Нет |
| FreeBSD | [TAP](https://lists.freebsd.org/pipermail/freebsd-testing/2013-November/000095.html)? | [Да](https://jenkins.freebsd.org/job/FreeBSD_HEAD/95/testReport/) | Нет
| GIT SCM | [TAP](https://github.com/git/git/tree/master/t) | Нет | Нет
| NGINX   | [TAP](http://hg.nginx.org/nginx-tests/)  | Нет | Нет
| Perl 6  | [TAP](https://github.com/perl6/roast)  | [Да](http://www.cpantesters.org/) | [Да](http://wiki.cpantesters.org/wiki/QuickStart) |
| Perl 5   | TAP | Да ([perl.daily-build.reports](http://www.nntp.perl.org/group/perl.daily-build.reports/), [perl5.test-smoke.org](http://perl5.test-smoke.org/)) | Да
| MariaDB | [TAP](https://dev.mysql.com/doc/mysqltest/2.0/en/unit-tests.html) | Нет | Нет
| LibreSSL | [TAP](https://github.com/libressl-portable/portable/commit/b28e5bedab4ebddd9f93816150832c591bcd4c3e) | Нет | Нет
| Chromium | TAP/JUnit (Google Test) | [Да](https://test-results.appspot.com/) | [Да](http://test-results.appspot.com/) | Да?
| OpenCV   | TAP/JUnit (Google Test) | Нет | Нет
| Protocol Buffers | TAP/JUnit (Google Test) | Нет | Нет
| Mercurial | [JUnit](https://www.mercurial-scm.org/pipermail/mercurial-devel/2014-August/060470.html) | Нет | Нет
| OpenBSD | [Собственный](http://cvsweb.openbsd.org/cgi-bin/cvsweb/src/regress/) | Нет | Нет |
| muslibc | [Собственный](http://nsz.repo.hu/git/?p=libc-test) | Нет | Нет
| unpaper | [Собственный](https://github.com/Flameeyes/unpaper) | Нет | Нет
| tesseract-ocr | [Собственный](https://github.com/tesseract-ocr/tesseract/tree/master/testing) | Нет | Нет
| Linux kernel | [Собственный](https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/tools/testing/selftests) в юнит-тестах, [TAP](https://github.com/autotest/autotest/issues/23) в функциональных тестах,  | Да ([1](http://www.csn.ul.ie/~mel/results/home/marvin/dashboard-openSUSE-13.1-smart.html), [2](https://kernelci.org/job/samsung/)) | [Да](https://api.kernelci.org/examples.html#uploading-tests)
| Wine | [Собственный](https://test.winehq.org/data/) | [Да](https://test.winehq.org/data/) | [Да](https://www.winehq.org/pipermail/wine-devel/2015-September/109318.html) |
| Piglit | Собственный? | [Да](http://people.freedesktop.org/~nh/piglit/results/all/index.html) | Нет
| Boost | Собственный? | [Да](http://www.boost.org/development/tests/develop/developer/summary.html) | Нет
| FFMpeg | [Собственный](https://github.com/FFmpeg/FFmpeg/tree/master/tests)? | [Да](http://fate.ffmpeg.org/) | [Да](https://ffmpeg.org/fate.html) |
| Ubuntu | [SubUnit/JUnit](http://www.tech-foo.net/making-the-most-of-subunit.html) | [Да](http://ci.ubuntu.com/) | Да ([1](https://launchpad.net/ubuntu-manual-tests), [2](http://www.theorangenotebook.com/2015/10/introducing-pilot.html), [3](https://launchpad.net/ubuntu-community-testing)) |
| PostgreSQL | Собственный? | Да ([1](http://www.pgbuildfarm.org/), [2](http://pgfoundry.org/mail/?group_id=1000040)) | [Да](http://www.pgbuildfarm.org/cgi-bin/register-form.pl)
| ReactOS | Собственный? | [Нет](https://www.reactos.org/testman) | Нет
| OpenResty | [TAP](https://openresty.gitbooks.io/programming-openresty/content/testing/running-tests.html) | [Да](http://qa.openresty.org/) | Нет
| Redis | [Собственный](http://download.redis.io/redis-stable/tests/unit/)? | [Да](http://ci.redis.io/) | Нет
| OpenStack | SubUnit (Tempest, testr) | [Да](http://logs.openstack.org/periodic-qa/) | Нет?
| LLVM     | Собственный в функциональных тестах ([1](http://llvm.org/docs/CommandGuide/lit.html#test-run-output-format), [2](http://llvm.org/docs/TestSuiteMakefileGuide.html#generating-test-output)) и TAP/JUnit в юнит-тестах (Google Test) | Нет | Нет?
| QEMU     | [Собственный](http://git.qemu.org/?p=qemu-test.git;a=summary) | Нет | Нет?
| Xen      | Собственный | Да ([HTML](http://logs.test-lab.xenproject.org/osstest/), [xen-devel@](http://lists.xen.org/archives/html/xen-devel/)) | [Да](http://xenbits.xen.org/gitweb/?p=osstest.git;a=blob;f=README.email;h=e14a8160aac355dda2fa7b8636fb7162b70235b7;hb=HEAD) | Да?
| LibreSwan | Собственный | [Да](http://blueswan.phenome.nl/results/) | Да
| NetBSD    | Собственный | [Да](http://releng.netbsd.org/test-results.html) | Да?
| GCC | Собственный | Да ([1](https://gcc.gnu.org/ml/gcc-testresults/), [2](http://toolchain.lug-owl.de/buildbot/)) | Нет
| OpenSMTPD | [TAP](https://github.com/OpenSMTPD/smtpscript/commit/ba46d2057cea1345d21144a4974f75569fc74d46) | Нет | Нет
| LXC       | [Собственный](https://github.com/lxc/lxc/tree/master/src/tests)?     | Нет | Нет
| ClamAV    | [Собственный](https://github.com/vrtadmin/clamav-devel/tree/master/unit_tests)? | Нет | Нет
| gawk      | [Собственный](http://git.savannah.gnu.org/cgit/gawk.git/tree/test)? | Нет | Нет
| Ruby      | [Собственный](http://svn.ruby-lang.org/repos/ruby/trunk/test/)? | Нет | Нет
| Haskell   | [Собственный](http://darcs.haskell.org/testsuite/tests/ghc-regress/)? | Нет | Нет
| LustreFS  | [TAP/JUnit](https://htmlpreview.github.io/?https://raw.githubusercontent.com/wiki/Xyratex/xperior/perldoc/runtest.html) | [ResultsDB](http://www.eofs.eu/fileadmin/lad2014/slides/08_Roman_Grigoryev_Xperior__LAD14_Seagate.pdf), [Maloo](https://testing.hpdd.intel.com/) | [Да](https://testing.hpdd.intel.com/import_tasks/new) |
| GlusterFS | [JUnit](https://github.com/gluster/glusterfs/blob/master/doc/developer-guide/unittest.md) | [Да](https://build.gluster.org/) | Нет
| Go        | [Собственный](https://github.com/golang/go/tree/master/test) | Нет | Нет
| Zsh       | [Собственный](https://github.com/zsh-users/zsh/tree/master/Test) | Нет | Нет
| Lua       | [Собственный](http://www.lua.org/tests/) | Нет | Нет
| curl      | [Собственный](https://github.com/curl/curl/tree/master/tests) | Нет | Нет
| Busybox   | [Собственный](https://git.busybox.net/busybox/tree/testsuite/README) | Нет | Нет
| Rsync     | [Собственный](https://github.com/AndyA/rsync/tree/master/testsuite)  | Нет | Нет
| runc      | [TAP](https://github.com/opencontainers/runc/pull/659) | Нет | Нет
| Samba     | [SubUnit](https://www.jelmer.uk/262-subunit-usage-in-Samba.html) | [Нет](https://build.samba.org/build.cgi/build/58cb8d1cc9ab241c01b5e18d68aa2add6786ffab) | Нет?
| Apache    | [TAP](http://svn.apache.org/viewvc/httpd/test/framework/trunk/) | Нет? | Нет
