---
layout: post
title: Открытые тесты для OpenBSD
---

{{ page.title }}
================

<p class="meta">24 марта 2014 - Москва</p>

Я давно занимаюсь портированием тестов для других POSIX операционных систем
на OpenBSD. Здесь будет список тестов, которые портированы или планируется порт для OpenBSD.
Статус для каждого из порта написан на английском языке, чтобы англоязычные товарищи могли с легкостью
его понять без использования переводчика :)

### Common tests:
* [capsicum tests](https://github.com/google/capsicum-test)
Capsicum is not a part of OpenBSD now, but it [can be](http://www.openbsdfoundation.org/gsoc2014.html#capsicum).
BTW FreeBSD contains [their own capsicum tests](http://svnweb.freebsd.org/base/release/10.0.0/tools/regression/capsicum/).
* [interbench](http://ck.kolivas.org/apps/interbench/)
* PORT devel/abi-compliance-checker https://github.com/jasperla/openbsd-wip/tree/master/devel/abi-compliance-checker
** https://github.com/lvc/vtable-dumper
** https://github.com/lvc/abi-dumper
* [unixbench](http://code.google.com/p/byte-unixbench/)
* [memtester](http://ports.su/sysutils/memtester)
* [stress](http://ports.su/sysutils/stress)
* [crashme](http://ports.su/sysutils/crashme)
* [Open Posix Testsuite](http://posixtest.sourceforge.net)
* [Linux Test Project](http://ltp.sourceforge.net)
It seems LTP works on FreeBSD. At least they have test run results in [wiki](https://wiki.freebsd.org/linux-kernel/ltp).
* [stress2](http://people.freebsd.org/~pho/stress/)
Test looks like totally unportable.
* POSIX/C99 Conformance Audit Tests from DragonFly
http://www.dragonflybsd.org/docs/developer/RegressionTest/	http://gitweb.dragonflybsd.org/~beket/
* [Ubuntu regressions tests](http://bazaar.launchpad.net/~ubuntu-bugcontrol/qa-regression-testing/master/files/head:/)
* [FreeBSD regression tests](http://svnweb.freebsd.org/base/release/10.0.0/tools/regression/)
Developers have plans to convert all regression tests in base to the kyua framework.
You can track status [here](https://wiki.freebsd.org/TestingFreeBSD).
* [NetBSD regression tests](http://cvsweb.netbsd.org/bsdweb.cgi/src/regress/?only_with_tag=MAIN)
* [DragonFly BSD regression tests](http://gitweb.dragonflybsd.org/dragonfly.git/tree/1365b5f1af0c1cc3894d279008de5831984b2990:/test)
Additional tests: [general tests](http://gitweb.dragonflybsd.org/~beket/gen-tests.git) and
[POSIX/C99 Conformance Audit tests](http://gitweb.dragonflybsd.org/~beket/pcca-tests.git).
* [OpenSolaris regression tests](http://dlc.sun.com/osol/test/downloads/current/). On [Bitbucket](https://bitbucket.org/illumos/illumos-stc).
* [Virtual Memory touching](http://hoytech.com/vmtouch/)
* LINUX ONLY? mmtests
	https://github.com/gormanm/mmtests
	http://www.csn.ul.ie/~mel/projects/mmtests/
	http://lwn.net/Articles/509585/
* cpuburn
* [vmregress](http://www.csn.ul.ie/~mel/projects/vmregress/)
Probably it is Linux-only test.
* perf_event_overhead http://web.eecs.utk.edu/~vweaver1/projects/perf-events/benchmarks/rdtsc_overhead/
* [memhack](https://01.org/memhack)
* [crackerjack - regression test framework and kernel execution coverage](http://sourceforge.net/projects/crackerjack/)
Paper from Ottawa Linux Symposiumhttps://www.kernel.org/doc/ols/2007/ols2007v2-pages-285-296.pdf
* [trinity (Linux syscall fuzzer)](http://codemonkey.org.uk/projects/trinity/)
Maintainer of the project (Dave Jones) declines patches with OpenBSD support. He do not want to support OpenBSD due
to a big amount of 'linuxisms' in trinity source tree.
* [futex test](https://git.kernel.org/cgit/linux/kernel/git/dvhart/futextest.git)
* [simple mmap test](http://people.freebsd.org/~jkim/mmap_test.c)
* btrax http://btrax.sourceforge.net
* [entropy - pseudorandom number sequence test program](http://www.fourmilab.ch/random/)
* [dieharder - random number test suite](http://www.phy.duke.edu/~rgb/General/dieharder.php)
* [testu01 - empirical statistical testing of uniform random number generators](http://www.iro.umontreal.ca/~simardr/testu01/tu01.html)
* [ncurses tests](http://bxr.su/NetBSD/tests/lib/libcurses/)
ncurses tests is a part of NetBSD regression tests. Probably we will
get it after porting kyua tests from NetBSD regression tests.
[Automated testing of the Curses library (pdf)](www.bsdcan.org/2012/schedule/attachments/188_curses-test.pdf)
* [zzuf is a transparent application input fuzzer](http://ports.su/misc/zzuf)
* [libvirt testsuite](http://people.canonical.com/~jamie/libvirt/qatest.tar.bz2)
* [micro libc benchmark](https://github.com/vext01/openbsd-libc-benchmarks)
* [ptrace tests](https://sourceware.org/cgi-bin/cvsweb.cgi/tests/ptrace-tests/tests/?cvsroot=systemtap)

### Network
* PORT packetdrill
* DONE security/isic
* DONE net/iperf
* DONE benchmarks/netperf
* DONE benchmarks/netperf-wrapper
* tcpstress from pcca
* RedHat LNST http://lnst-project.org
* Linux ONLY pkt-gen
* IKE implementatios testing http://n.ethz.ch/~ptsankov/fuzzing/index.html
* IKE ftp://ftp.inf.ethz.ch/pub/publications/tech-reports/7xx/747.pdf

STORAGE:
* fsync perf https://github.com/hostmaster/POC_fsyncperf
* FreeBSD http://www.freebsd.org/ru/ports/benchmarks.html
* Pawel Jakub Dawidek’s POSIX file system test suite
	https://github.com/yaneurabeya/pjdfstest
	! http://www.tuxera.com/community/posix-test-suite/
	http://people.freebsd.org/~pjd/pjdfstest/
* DEPENDS on SystemTap SCSI fault injection http://sourceforge.net/projects/scsifaultinjtst/
* PORT XFS tests
	https://github.com/dmonakhov/xfstests
	http://git.kernel.org/cgit/fs/xfs/xfstests-dev.git
* sysutils/fsstress http://code.google.com/p/file-system-stress-testing-framework/
* NFS: http://hub.opensolaris.org/bin/view/Community+Group+nfs/tests
* NFS: automount
* <b>dead?</b> NFS http://www.connectathon.org/nfstests.html
* ZFS: http://hub.opensolaris.org/bin/view/Community+Group+zfs/ztest
* ZFS: http://hub.opensolaris.org/bin/view/Community+Group+zfs/zfstestsuite
* DONE http://linux-nfs.org/wiki/index.php/NFStest#nfstest_posix_-_POSIX_file_system_level_access_tests
* DONE sysutils/iogen
* DONE benchmarks/iozone
* DONE benchmarks/bonnie
* DONE benchmarks/bonnie++
* DONE benchmarks/ubench
* DONE benchmarks/sysbench http://sysbench.sourceforge.net/
* DONE benchmarks/fs_mark
* DONE fsx http://codemonkey.org.uk/projects/fsx/
* PORT devel/fuse fusexmp PSBM-15157 fuse.sourceforge.net
* DONE http://fsbench.filesystems.org (from atomics http://fsbench.filesystems.org/bench/postmark-1_5.c)
* IMPOSSIBLE? fio http://freecode.com/projects/fio на сайте написано что OpenBSD поддерживается
* [OpenBSD developers decline it] fsfuzzer
	http://jon.oberheide.org/mokb/
	https://github.com/sughodke/fsfuzzer
	http://lkml.indiana.edu/hypermail/linux/kernel/0901.3/01025.html
* zumastor http://code.google.com/p/zumastor/source/browse/trunk/ddsnap/tests/?r=1733
* Filebench http://sourceforge.net/apps/mediawiki/filebench/index.php?title=Main_Page
* tiobench http://sourceforge.net/projects/tiobench/
* ffsb http://sourceforge.net/projects/ffsb/
* lmbench

* Solaris, GPL, TET framework http://sourceforge.net/projects/openusb/files/
* [usbstress](http://www.lrr.in.tum.de/Par/arch/usb/download/usbstress/)
USB stress tool, requires special device for testing.

xenocara/X11/video (xenocara/README)
* testing requirements for drm i915 http://blog.ffwll.ch/2013/11/testing-requirements-for-drmi915.html
* slides http://tieguy.org/blog/2009/04/22/a-rumbling-about-x-qa/
* How Intel tests graphics? https://01.org/linuxgraphics/sites/default/files/documentation/gfx_test_xds2008.pdf
* HOWTO http://dri.freedesktop.org/wiki/TestingAndDebugging/

* [isfast](http://www.berkelium.com/OpenGL/isfast.html)
* [machtest](http://cumbia.informatik.uni-stuttgart.de/machtest/)
* [tutors](http://user.xmission.com/~nate/tutors.html)
* [demos](http://cs.anu.edu.au/people/Hugh.Fisher/shaders/)
* [X Testing](http://www.freedesktop.org/wiki/Software/XTesting/)
* touchpad test http://git.chromium.org/gitweb/?p=chromiumos/platform/touchpad-tests.git;a=summary
* DONE mesa-demos
	http://cgit.freedesktop.org/mesa/demos
	Conformance http://www.mesa3d.org/conform.html
* [piglit - OpenGL driver testing framework](http://cgit.freedesktop.org/piglit)
[Port](https://github.com/jasperla/openbsd-wip/tree/master/graphics/piglit) is in WIP status.
* [XTSi - X Test Suite, tests for core protocol conformance](http://cgit.freedesktop.org/xorg/test/xts/)
X Test Suite [userguide] (pdf) (http://freedesktop.org/software/fontconfig/xtest/userguide.pdf).
* [Intel GPU tools](http://cgit.freedesktop.org/xorg/app/intel-gpu-tools/)
* [glean](http://glean.sourceforge.net/whatis.html)
Port is done.
* [x11perf](http://cgit.freedesktop.org/xorg/app/x11perf/)
x11perf is a part of Xenocara project (xenocara/app/x11perf).
* [glxgears]
glxgears is a part of Xenocara project (xenocara/app/glxgears).
* [rendercheck](http://cgit.freedesktop.org/xorg/app/rendercheck/)
Port is ready - [x11/rendercheck](http://ports.su/x11/rendercheck).

nsd and unbound
* https://github.com/miekg/ldns/tree/master/examples/nsd-test
* BIND usr.sbin/bind/bin/tests/

* [osstest](http://manuals.opensound.com/usersguide/osstest.html)
* http://wiki.meego.com/Quality/TestSuite/Audio_Driver_Test_Specification
* http://alsa.opensrc.org/Speaker-test
* [ALSA test utility](http://www.mythtv.org/wiki/Using_ALSA's_speaker-test_utility)
* [chromium audio test](http://git.chromium.org/gitweb/?p=chromiumos/platform/audiotest.git;a=tree)
* loopback mode aucat(1)

* [wrk](https://github.com/wg/wrk)
Tool for stress and load testing of HTTP servers. Used by Nginx Inc. for nginx testing.
* [apache testsuite](http://search.cpan.org/dist/Apache-Test/)
Testsuite is useless now, because apache was removed from OpenBSD base. 
* [slowhttptest - http://ports.su/www/slowhttptest](http://ports.su/www/slowhttptest)
* [siege - multi-threaded HTTP benchmark and regression tester](http://ports.su/benchmarks/siege)
* ab
* [httpress](https://bitbucket.org/yarosla/httpress/wiki/Home)
* [http-stress](https://bitbucket.org/vstakhov/http-stress)
Nice HTTP stress test. Used in vzt-atomics testsuite.
* [nginx regression testsuite](http://hg.nginx.org/nginx/)
Framework used by Nginx Inc. for regression testing of nginx web server.
[Mercurial mirror](http://mdounin.ru/hg/nginx-tests)
[Github mirror](https://github.com/catap/nginx-tests)
It is a Perl tests splitted on several number of files, one file per feature.
Framework is useless on OpenBSD because the most features disabled.
* [smtp-benchmark](http://ports.su/benchmarks/smtp-benchmark)
* PORT xstress, postal, postfix stress test
* [smtpscript](https://github.com/poolpOrg/smtpscript)
Framework used for OpenSMTPD regression testing.

libelf: 
	http://people.freebsd.org/~jkoshy/download/libelf-20080125.tbz
	https://wiki.freebsd.org/LibElf
	http://sourceforge.net/apps/trac/elftoolchain/browser/trunk/test
	ELF header mangling
gdb	openbsd/src/gnu/usr.bin/binutils/gdb/testsuite
[gcc testsuite](http://gcc.gnu.org/testing/)
	http://gcc.gnu.org/install/test.html
	http://gcc.gnu.org/onlinedocs/gccint/Testsuites.html
[pcc testsuite](http://pcc.ludd.ltu.se/standards_and_regression_testing/)
