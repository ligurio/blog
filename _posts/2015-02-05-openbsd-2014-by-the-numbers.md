---
layout: post
title: OpenBSD 2014 в цифрах (англ.)
---

<p class="meta">5 февраля 2015 - Москва</p>

*«If you can’t measure it, you can’t improve it»* — Peter Drucker
<br><br>

[tedu@](http://www.tedunangst.com/)
[wrote a post](http://www.tedunangst.com/flak/post/OpenBSD-2014-by-the-numbers)
with selection of random numbers regarding source changes in 2014.

As opposed to his post I have reviewed changes in OpenBSD projects
and created my own list of numbers related to quality.

OpenBSD project is still exist without bug tracker, so it is hard to analyze bug statistic.
According to archive of mail list [bugs@openbsd.org](https://marc.info/?l=openbsd-bugs)
there was slightly bigger traffic in 2014 than in previous years:

	2014 - 1243
	2013 - 980
	2012 - 1162

<br>
The top five committers to [src/regress](http://cvsweb.openbsd.org/cgi-bin/cvsweb/src/regress/) for the year:

	schwarze	1316
	bluhm		448
	miod		192
	jsing		170
	djm			151

<br>
The top five slackers committed to [src/regress](http://cvsweb.openbsd.org/cgi-bin/cvsweb/src/regress/) for the year:

	jca			3
	krw			3
	kettenis	1
	logan		1
	naddy		1

<br>
Totals in [src/regress](http://cvsweb.openbsd.org/cgi-bin/cvsweb/src/regress/):

	commits				2925
	lines added			9062
	lines deleted		4697
<br>

<!-- statistics was derived from cvs log -d"2014-01-01<2015-01-01"-->

P.S. I like to calculate FIXME words in the code.
The statistics for OpenBSD src tree is following:
Total FIXMEs - 4191, where 3969 FIXMEs belongs to GNU software (gcc, gdb, cvs, binutils, perl, texinfo, mkhybrid).

<!-- find . -name "*.c" -print0 | xargs -0 egrep -i FIXME -->

Fin
