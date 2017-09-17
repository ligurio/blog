---
date: 2017-09-17T00:00:00Z
title: Own repository with OpenBSD packages
tags: ["opensource", "openbsd", "openbsd-en"]
---

Right now OpenBSD ports tree contains about 10042 ports according to
[ports.su](http://ports.su/). Resources of OpenBSD developers are limited and
thus not all new ports are comitted to the official tree. It's a reason why we
have a big number of ports out of tree. See a [list of some repositories with
out-of-tree ports](https://github.com/ligurio/openbsd-wip/#see-also).
Maintaining packages is not so simple when you have more than one OpenBSD
machine: build a package on a machine with required CPU architechture, keep it
somewhere, rebuild for each new release and so on.

For Ubuntu and Fedora there are convenient services available where you can get
your own package repository. Ubuntu has [Launchpad
PPA](https://help.launchpad.net/Packaging/PPA) and Fedora project has
[COPR](https://docs.pagure.org/copr.copr/user_documentation.html).  You can put
there source packages which are under an open source license, e.g.  development
snapshots of your software. Users then only need to add the repository address
with one command and can install the packages via ```apt-get``` in case of
Ubuntu and ```yum``` (or ```dnf```)  in case of Fedora.

It would be nice to have similar service for OpenBSD. I'm even agree to pay a
small amount of money for using such service :)
