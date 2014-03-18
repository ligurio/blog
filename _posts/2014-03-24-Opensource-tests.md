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

### Network
* TODO packetdrill
* PORTS TREE [isic - IP stack integrity checker](http://ports.su/security/isic)
* PORTS TREE [iperf - tool for measuring maximum TCP and UDP bandwidth](http://ports.su/net/iperf)
* PORTS TREE [netperf - network performance benchmark](http://ports.su/benchmarks/netperf)
* PORTS TREE [netperf-wrapper - test network latency under load via netperf](http://ports.su/benchmarks/netperf-wrapper)
* [RedHat LNST](http://lnst-project.org)
* SKIP pkt-gen (Linux-only test)
* TODO [IKE implementations testing](http://n.ethz.ch/~ptsankov/fuzzing/index.html)
* TODO [IKE](ftp://ftp.inf.ethz.ch/pub/publications/tech-reports/7xx/747.pdf)

### Storage
* TODO [fsync perf](https://github.com/hostmaster/POC_fsyncperf)
* [FreeBSD performance tests](http://www.freebsd.org/ru/ports/benchmarks.html)
* TODO [Pawel Jakub Dawidek’s POSIX file system test suite](http://people.freebsd.org/~pjd/pjdfstest/)
* SKIP [SCSI fault injection](http://sourceforge.net/projects/scsifaultinjtst/) Depends on SystemTap.
* TODO [XFS tests](https://github.com/dmonakhov/xfstests)
* [File System Stress Testing Framework](http://code.google.com/p/file-system-stress-testing-framework/)
* [NFS tests from Solaris](http://hub.opensolaris.org/bin/view/Community+Group+nfs/tests)
* [NFS connectathon testsuite](http://www.connectathon.org/nfstests.html) Dead?
* DONE [NFS tests](http://linux-nfs.org/wiki/index.php/NFStest)
* PORTS TREE [fsstress](http://ports.su/sysutils/fsstress)
* PORTS TREE [iogen](http://ports.su/sysutils/iogen)
* PORTS TREE [iozone](http://ports.su/benchmarks/iozone)
* PORTS TREE [bonnie](http://ports.su/benchmarks/bonnie)
* PORTS TREE [bonnie++](http://ports.su/benchmarks/bonnie++)
* PORTS TREE [ubench](http://ports.su/benchmarks/ubench)
* PORTS TREE [sysbench](http://ports.su/benchmarks/sysbench,pgsql)
* PORTS TREE [fs_mark](http://ports.su/benchmarks/fs_mark)
* DONE [fsx](http://codemonkey.org.uk/projects/fsx/)
* TODO fusexmp (testing FUSE by mounting filesystem in loopback) See PSBM-15157
* DONE [postmark](http://fsbench.filesystems.org)
* TODO [fio](http://freecode.com/projects/fio)
* SKIP [fsfuzzer](https://github.com/sughodke/fsfuzzer)
* [filebench](http://sourceforge.net/projects/filebench/)
* [tiobench](http://sourceforge.net/projects/tiobench/)
* [ffsb](http://sourceforge.net/projects/ffsb/)
* [lmbench](http://lmbench.sourceforge.net/)

### Graphics
* [Conformance](http://www.mesa3d.org/conform.html)
* TODO [isfast](http://www.berkelium.com/OpenGL/isfast.html)
* TODO [machtest](http://cumbia.informatik.uni-stuttgart.de/machtest/)
* [tutors](http://user.xmission.com/~nate/tutors.html)
* [demos](http://cs.anu.edu.au/people/Hugh.Fisher/shaders/)
* TODO [X Testing](http://www.freedesktop.org/wiki/Software/XTesting/)
* [touchpad tests](http://git.chromium.org/gitweb/?p=chromiumos/platform/touchpad-tests.git;a=summary)
* TODO [mesa-demos](http://cgit.freedesktop.org/mesa/demos)
* TODO [piglit - OpenGL driver testing framework](http://cgit.freedesktop.org/piglit)
* TODO [XTS - X Test Suite, tests for core protocol conformance](http://cgit.freedesktop.org/xorg/test/xts/)
* TODO [Intel GPU tools](http://cgit.freedesktop.org/xorg/app/intel-gpu-tools/)
* DONE [glean](http://glean.sourceforge.net/whatis.html) Port is done.
* BASE [x11perf](http://cgit.freedesktop.org/xorg/app/x11perf/)
* BASE glxgears
* DONE [rendercheck](http://cgit.freedesktop.org/xorg/app/rendercheck/)

### Common tests:
* [capsicum tests](https://github.com/google/capsicum-test). Actually capsicum
* [interbench](http://ck.kolivas.org/apps/interbench/)
* DONE [abi-compliance-checker](http://ispras.linuxbase.org/index.php/ABI_compliance_checker/)
* [unixbench](http://code.google.com/p/byte-unixbench/)
* PORTS TREE [memtester](http://ports.su/sysutils/memtester)
* PORTS TREE [stress](http://ports.su/sysutils/stress)
* PORTS TREE [crashme](http://ports.su/sysutils/crashme)
* TODO [Open Posix Testsuite](http://posixtest.sourceforge.net)
* TODO [Linux Test Project](http://ltp.sourceforge.net)
* SKIP [stress2](http://people.freebsd.org/~pho/stress/)
* [POSIX/C99 Conformance Audit Tests](http://www.dragonflybsd.org/docs/developer/RegressionTest/)
* [Ubuntu regressions tests](http://bazaar.launchpad.net/~ubuntu-bugcontrol/qa-regression-testing/master/files/head:/)
* TODO [FreeBSD regression tests](http://svnweb.freebsd.org/base/release/10.0.0/tools/regression/)
* TODO [NetBSD regression tests](http://cvsweb.netbsd.org/bsdweb.cgi/src/regress/?only_with_tag=MAIN)
* [DragonFly BSD regression tests](http://gitweb.dragonflybsd.org/dragonfly.git/tree/1365b5f1af0c1cc3894d279008de5831984b2990:/test)
* [OpenSolaris regression tests](http://dlc.sun.com/osol/test/downloads/current/). On [Bitbucket](https://bitbucket.org/illumos/illumos-stc).
* SKIP? [Virtual Memory touching](http://hoytech.com/vmtouch/)
* SKIP? [mmtests](https://github.com/gormanm/mmtests)
* cpuburn
* [vmregress](http://www.csn.ul.ie/~mel/projects/vmregress/) Probably it is Linux-only test.
* [perf_event_overhead](http://web.eecs.utk.edu/~vweaver1/projects/perf-events/benchmarks/rdtsc_overhead/)
* [memhack](https://01.org/memhack)
* [crackerjack - regression test framework and kernel execution coverage](http://sourceforge.net/projects/crackerjack/)
[Paper from Ottawa Linux Symposium](https://www.kernel.org/doc/ols/2007/ols2007v2-pages-285-296.pdf)
* SKIP [trinity - Linux syscall fuzzer](http://codemonkey.org.uk/projects/trinity/)
* [futex test](https://git.kernel.org/cgit/linux/kernel/git/dvhart/futextest.git)
* [simple mmap test](http://people.freebsd.org/~jkim/mmap_test.c)
* [btrax](http://btrax.sourceforge.net)
* [entropy - pseudorandom number sequence test program](http://www.fourmilab.ch/random/)
* [dieharder - random number test suite](http://www.phy.duke.edu/~rgb/General/dieharder.php)
* [testu01 - empirical statistical testing of uniform random number generators](http://www.iro.umontreal.ca/~simardr/testu01/tu01.html)
* [ncurses tests](http://bxr.su/NetBSD/tests/lib/libcurses/)
* PORTS TREE [zzuf is a transparent application input fuzzer](http://ports.su/misc/zzuf)
* [libvirt testsuite](http://people.canonical.com/~jamie/libvirt/qatest.tar.bz2)
* [micro libc benchmark](https://github.com/vext01/openbsd-libc-benchmarks)
* [ptrace tests](https://sourceware.org/cgi-bin/cvsweb.cgi/tests/ptrace-tests/tests/?cvsroot=systemtap)
* [nsd testsuite](https://github.com/miekg/ldns/tree/master/examples/nsd-test)
* [osstest](http://manuals.opensound.com/usersguide/osstest.html)
* [chromium audio test](http://git.chromium.org/gitweb/?p=chromiumos/platform/audiotest.git;a=tree)
* TODO [wrk](https://github.com/wg/wrk) - tool for stress and load testing of HTTP servers. Used by Nginx Inc. for nginx testing.
* SKIP [apache testsuite](http://search.cpan.org/dist/Apache-Test/)
* PORTS TREE [slowhttptest - http://ports.su/www/slowhttptest](http://ports.su/www/slowhttptest)
* PORTS TREE [siege - multi-threaded HTTP benchmark and regression tester](http://ports.su/benchmarks/siege)
* ab - apache benchmark
* TODO [httpress](https://bitbucket.org/yarosla/httpress/wiki/Home)
* TODO [http-stress](https://bitbucket.org/vstakhov/http-stress)
* DONE [nginx regression testsuite](http://hg.nginx.org/nginx/)
* PORTS TREE [smtp-benchmark](http://ports.su/benchmarks/smtp-benchmark)
* TODO [smtpscript](https://github.com/poolpOrg/smtpscript)
* [tests for tools related to ELF](http://sourceforge.net/p/elftoolchain/wiki/Home/)
* [gcc testsuite](http://gcc.gnu.org/testing/)
* [pcc testsuite](http://pcc.ludd.ltu.se/standards_and_regression_testing/)
* [USB test from Solaris](http://sourceforge.net/projects/openusb/files/)
* [usbstress](http://www.lrr.in.tum.de/Par/arch/usb/download/usbstress/)
