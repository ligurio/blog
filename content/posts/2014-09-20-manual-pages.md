---
date: 2014-09-20T00:00:00Z
title: Что пишут в разделе BUGS в документации
url: /2014/09/20/manual-pages.html
---

В документации есть секция BUGS, которая, согласно
[man(7)](http://www.openbsd.org/cgi-bin/man.cgi/OpenBSD-current/man7/man.7?query=man&sec=7),
предназначена для описания различных известных проблем:

> Known bugs, limitations, and work-arounds should be described in this section.

Но разработчики её используют по-разному. Одни используют по назначению
и пишут ограничения, иногда с воркэраундами, как например здесь:

<!--
LIMITATIONS
-->

[calendar.1](http://www.openbsd.org/cgi-bin/man.cgi/OpenBSD-current/man1/calendar.1?query=calendar)

> calendar doesn't handle all Jewish holidays or moon phases.

[grolj4(1)](https://developer.apple.com/library/mac/documentation/Darwin/Reference/ManPages/man1/grolj4.1.html)

> Small dots.

[pppd(8)](http://www.openbsd.org/cgi-bin/man.cgi/OpenBSD-current/man8/pppd.8?query=pppd)

> Scripts should be run as root, but are not.

[ps(1)](https://developer.apple.com/library/mac/documentation/Darwin/Reference/ManPages/man1/ps.1.html)

> Since ps cannot run faster than the system
> and is run as any other scheduled process, the information
> it displays can never be exact.

[rs.1](http://www.openbsd.org/cgi-bin/man.cgi/OpenBSD-current/man1/rs.1?query=rs)

> There are too many options.

[script.1](http://www.openbsd.org/cgi-bin/man.cgi/OpenBSD-current/man1/script.1?query=script)

> script places everything in the log file, including
> linefeeds and backspaces. This is not what the naive user expects.

[units.1](http://www.openbsd.org/cgi-bin/man.cgi/OpenBSD-current/man1/units.1?query=units)

> The effect of including a ‘/’ in a prefix is surprising.

[wsfontload(8)](http://www.openbsd.org/cgi-bin/man.cgi/OpenBSD-current/man8/wsfontload.8?query=wsfontload)

> Many features are missing.
> There is no way to remove a loaded font.

[newsyslog(8)](https://developer.apple.com/library/mac/documentation/Darwin/Reference/ManPages/man8/newsyslog.8.html)

> Does not yet automatically read the logs to find security breaches.

[spell.1](http://www.openbsd.org/cgi-bin/man.cgi/OpenBSD-current/man1/spell.1?query=spell)

> British spelling was done by an American.

Это явно писал перфекционист: "Программа работает, но не совсем хорошо.":

[cu(1)](https://developer.apple.com/library/mac/documentation/Darwin/Reference/ManPages/man1/cu.1.html)

> This program does not work very well.

[bash(1)](https://developer.apple.com/library/mac/documentation/Darwin/Reference/ManPages/man1/bash.1.html)

> It's too big and too slow.

[akbd.4](http://www.openbsd.org/cgi-bin/man.cgi/OpenBSD-current/man4/akbd.4?query=akbd)

> The list of built-in mappings doesn't follow any logic.
> It grew as people submitted what they needed.

<!--
[dhcpd.8](http://www.openbsd.org/cgi-bin/man.cgi/OpenBSD-current/man8/dhcpd.8?query=dhcpd)

> We realize that it would be nice if one could send
> a SIGHUP to the server and have it reload the database.
> This is not technically impossible, but it would require
> a great deal of work, our resources are extremely limited,
> and they can be better spent elsewhere. So please don't complain
> about this on the mailing list unless you're prepared
> to fund a project to implement this feature, or prepared to do it yourself.

[rbootd(8)](http://www.openbsd.org/cgi-bin/man.cgi/OpenBSD-current/man8/rbootd.8?query=rbootd)

> If multiple servers are started on the same interface,
> each will receive and respond to the same boot packets.

[mount(8)](https://developer.apple.com/library/mac/documentation/Darwin/Reference/ManPages/man8/mount.8.html)

> It is possible for a corrupted file system to cause a crash.

[portmap(8)](http://www.openbsd.org/cgi-bin/man.cgi/OpenBSD-current/man8/portmap.8?query=portmap)

> If portmap crashes, all servers must be restarted.

[atactl.8](http://www.openbsd.org/cgi-bin/man.cgi/OpenBSD-current/man8/atactl.8?query=atactl)

> The output from the identify command is rather ugly.

[growfs.8](http://www.openbsd.org/cgi-bin/man.cgi/OpenBSD-current/man8/growfs.8?query=growfs)

> Filesystems must be checked with fsck(8) after enlarging.

[umct(4)](http://www.openbsd.org/cgi-bin/man.cgi/OpenBSD-current/man4/umct.4?query=umct)

> This driver is not known to work currently.

[at(1)](https://developer.apple.com/library/mac/documentation/Darwin/Reference/ManPages/man1/at.1.html)

> Specifying a date past 2038 may not work on some systems.

[com.4](http://www.openbsd.org/cgi-bin/man.cgi/OpenBSD-current/man4/com.4?query=com)

> Data loss is possible on busy systems with unbuffered UARTs at high speed.
> The name of this driver and the constants which define
> the locations of the various serial ports are holdovers from DOS.

[sdiff.1](http://www.openbsd.org/cgi-bin/man.cgi/OpenBSD-current/man1/sdiff.1?query=sdiff)

> sdiff may not work with binary data.

[write.1](http://www.openbsd.org/cgi-bin/man.cgi/OpenBSD-current/man1/write.1?query=write)

> The “EOF” message seen when the other write terminates
> is indistinguishable from that party simply typing “EOF”
> to make you believe that any future messages did not come from them.
> Especially messages such as:
> [1] Done rm -rf *

[ipsec.4](http://www.openbsd.org/cgi-bin/man.cgi/OpenBSD-current/man4/ipsec.4?query=ipsec)

> There's a lot more to be said on this subject. This is
> just a beginning. At the moment the socket options are not fully implemented.

[watchdog(4)](http://www.openbsd.org/cgi-bin/man.cgi/OpenBSD-current/man4/watchdog.4?query=watchdog)

> For systems with multiple watchdog timers available, only a singleV
> one can be used at a time.
> There is currently no way of selecting which device is used; the first
> discovered by the kernel is selected.

[bc.1](http://www.openbsd.org/cgi-bin/man.cgi/OpenBSD-current/man1/bc.1?query=bc)

> ‘Quit’ is interpreted when read, not when executed.
> Some non-portable extensions, as found in the
> GNU version of the bc utility are not implemented (yet).

[locale.1](http://www.openbsd.org/cgi-bin/man.cgi/OpenBSD-current/man1/locale.1?query=locale)

> The list of supported locales is perpetually incomplete.

[mopchk.1](http://www.openbsd.org/cgi-bin/man.cgi/OpenBSD-current/man1/mopchk.1?query=mopchk)

> In some implementations the same interface can occur more than once.

[bzdiff(1)](https://developer.apple.com/library/mac/documentation/Darwin/Reference/ManPages/man1/bzdiff.1.html)

> Messages from the cmp or diff programs refer
> to temporary filenames instead of those specified.

[uguru(4)](http://www.openbsd.org/cgi-bin/man.cgi/OpenBSD-current/man4/uguru.4?query=uguru)

> Interrupt support is unimplemented.

[rwho(1)](https://developer.apple.com/library/mac/documentation/Darwin/Reference/ManPages/man1/rwho.1.html)

> This is unwieldy when the number of machines on the local net is large.

[audit(2)](https://developer.apple.com/library/mac/documentation/Darwin/Reference/ManPages/man2/audit.2.html)

> The kernel does not fully validate that the argument passed is syntactically
> valid BSM. Submitting invalid audit records may corrupt the audit log.

[ls(1)](https://developer.apple.com/library/mac/documentation/Darwin/Reference/ManPages/man1/ls.1.html)

> To maintain backward compatibility, the relationships
> between the many options are quite complex.
-->

<!--
VENDOR's BULLSHIT
-->

...упоминание нерадивых вендоров и паршивых стандартов:

[apm.4](http://www.openbsd.org/cgi-bin/man.cgi/OpenBSD-current/man4/i386/apm.4?query=apm)

> Not all the BIOSes support power down the way we are attempting to execute it.
> Not all BIOS vendors even read the specification.

[openssl.1](http://www.openbsd.org/cgi-bin/man.cgi/OpenBSD-current/man1/openssl.1?query=openssl)
[pkcs12(1)](https://developer.apple.com/library/mac/documentation/Darwin/Reference/ManPages/man1/pkcs12.1ssl.html)

> Some would argue that the PKCS#12 standard is one big bug :-)

[vic(4)](http://www.openbsd.org/cgi-bin/man.cgi/OpenBSD-current/man4/vic.4?query=vic)

> There are tons of bugs in VMware and the underlying
> host operating systems. Please consider that the security of
> the OpenBSD guest can be circumvented by attacking the host environment.

<!--
DOCUMENTATION
-->

...недостатков самой документации:

[ipcs(1)](https://developer.apple.com/library/mac/documentation/Darwin/Reference/ManPages/man1/ipcs.1.html)

> This manual page is woefully incomplete, because
> it does not at all attempt to explain the information printed by ipcs.

[Mail.1](http://www.openbsd.org/cgi-bin/man.cgi/OpenBSD-current/man1/Mail.1?query=Mail)

> There are some flags that are not documented here.
> Most are not useful to the general user. Usually, mail and mailx
> are just links to Mail, which can be confusing.

[screencapture(1)](https://developer.apple.com/library/mac/documentation/Darwin/Reference/ManPages/man1/screencapture.1.html)

> Better documentation is needed for this utility.

[lseek(2)](https://developer.apple.com/library/mac/documentation/Darwin/Reference/ManPages/man2/lseek.2.html)

> This document's use of whence is incorrect English, but is maintained for
> historical reasons.

[sigvec(2)](https://developer.apple.com/library/mac/documentation/Darwin/Reference/ManPages/man2/sigvec.2.html)

> This manual page is still confusing.

[rtnetlink.3](http://man7.org/linux/man-pages/man3/rtnetlink.3.html)

> This manual page is incomplete.

<!--
BUGS
-->

Кто-то признает в своём коде наличие багов:

[vi(1)](https://developer.apple.com/library/mac/documentation/Darwin/Reference/ManPages/man1/vi.1.html)

> Probably. See ":help todo" for a list of known problems.
> Note that a number of things that may be regarded as bugs by some,
> are in fact caused by a too-faithful reproduction of Vi's behaviour.
> And if you think other things are bugs "because Vi does it differently",
> you should take a closer look at the vi_diff.txt file
> (or type :help vi_diff.txt when in Vim). Also have a look
> at the 'compatible' and 'cpoptions' options.

[festival(1)](http://linux.die.net/man/1/festival)

> More than you can imagine.

[tip.1](http://www.openbsd.org/cgi-bin/man.cgi/OpenBSD-current/man1/tip.1?query=tip)

> Probably plenty.

[mongoose.4](http://www.openbsd.org/cgi-bin/man.cgi/OpenBSD-current/man4/hppa/mongoose.4?query=mongoose)

> Has some.

[perlplan9(1)](https://developer.apple.com/library/mac/documentation/Darwin/Reference/ManPages/man1/perlplan9.1.html)

> "As many as there are grains of sand on all the
> beaches of the world..." - Carl Sagan

а кто-то всё еще считает, что их нет (почему-то такое в основном в документации для Perl):

[perlbug(1)](https://developer.apple.com/library/mac/documentation/Darwin/Reference/ManPages/man1/perlbug.1.html)

> None known (guess what must have been used to report them?)

[perlrequick(1)](https://developer.apple.com/library/mac/documentation/Darwin/Reference/ManPages/man1/perlrequick.1.html)

> None.

[perlthanks(1)](https://developer.apple.com/library/mac/documentation/Darwin/Reference/ManPages/man1/perlthanks.1.html)

> None known (guess what must have been used to report them?)

[dot_clean(1)](https://developer.apple.com/library/mac/documentation/Darwin/Reference/ManPages/man1/cu.1.html)

> None known.

[CGI::Cookie(3pm)](https://developer.apple.com/library/mac/documentation/Darwin/Reference/ManPages/man3/CGI__Cookie.3pm.html)

> This section intentionally left blank.

<!--
UNIQUE
-->

Только один раз я видел, чтобы в документации отсутствие теста
считалось недостатком, это было в [urandom(4)](http://www.openbsd.org/cgi-bin/man.cgi/OpenBSD-current/man4/urandom.4?query=urandom):

> No randomness testing suite provided.

Проблемы совместимости описывались только в [talk.1](http://www.openbsd.org/cgi-bin/man.cgi/OpenBSD-current/man1/talk.1?query=talk):

> The version of talk released with 4.3BSD uses a protocol
> that is incompatible with the protocol used in the version released with 4.2BSD.

Шуточки разработчиков Perl:

[perl(1)](https://developer.apple.com/library/mac/documentation/Darwin/Reference/ManPages/man1/perl.1.html)

> Perl actually stands for Pathologically Eclectic
> Rubbish Lister, but don't tell anyone I said that.

<!--
PLANS TO FUTURE
-->

Иногда секция BUGS описывает планы на будущее и текущий статус.
И тогда некоторые утилиты только подтверждают пословицу "Нет ничего более постоянного, чем временное":
планы на будущее не сбываются (или это будущее ещё не наступило?).

[rlogin(1)](https://developer.apple.com/library/mac/documentation/Darwin/Reference/ManPages/man1/rlogin.1.html)

> The rlogin utility will be replaced by telnet(1) in the near future.

[UKC(8)](http://www.openbsd.org/cgi-bin/man.cgi/OpenBSD-current/man8/UKC.8?query=UKC)

> The add command is rather restricted, and might be expanded in the future.

[pkg_check(8)](http://www.openbsd.org/cgi-bin/man.cgi/OpenBSD-current/man8/pkg_check.8?query=pkg%5fcheck)

> Work in progress. The order of checks is not definitive,
> and more checks may be added. Use with caution.

[grohtml(1)](https://developer.apple.com/library/mac/documentation/Darwin/Reference/ManPages/man1/grohtml.1.html)

> Grohtml has been completely redesigned and rewritten. It is still beta code.

fsck_msdos.8 ([OpenBSD](http://www.openbsd.org/cgi-bin/man.cgi/OpenBSD-current/man8/fsck_msdos.8?query=fsck%5fmsdos)
[Mac OS](https://developer.apple.com/library/mac/documentation/Darwin/Reference/ManPages/man8/fsck_msdos.8.html))

> fsck_msdos is still under construction.

<br><br>

<!--
[mailwrapper(8)](http://www.openbsd.org/cgi-bin/man.cgi/OpenBSD-current/man8/mailwrapper.8?query=mailwrapper)

> The entire reason this program exists is a crock.
> Instead, a command for how to submit mail should be
> standardized, and all the "behave differently if invoked
> with a different name" behavior of things like mailq(8) should go away.

[pac(8)](http://www.openbsd.org/cgi-bin/man.cgi/OpenBSD-current/man8/pac.8?query=pac)

> The relationship between the computed price and reality is as yet unknown.

[mklocale(1)](https://developer.apple.com/library/mac/documentation/Darwin/Reference/ManPages/man1/mklocale.1.html)

> The mklocale utility is overly simplistic.

[netstat(1)](https://developer.apple.com/library/mac/documentation/Darwin/Reference/ManPages/man1/netstat.1.html)

> The notion of errors is ill-defined.

[what(1)](https://developer.apple.com/library/mac/documentation/Darwin/Reference/ManPages/man1/what.1.html)

> As BSD is not licensed to distribute SCCS.
> This is a rewrite of the what command which is part of SCCS;
> it may not behave in exactly the same manner as that command does.
-->
