---
date: 2015-07-20T00:00:00Z
tags: ["openbsd", ""]
title: Порты для OpenBSD
url: /2015/07/20/openbsd-ports/
---

Занимаясь
[портированием](http://openports.se/search.php?stype=maintainer&so=estetus)
приложений на OpenBSD у меня был список приложений, для которых я бы хотел сделать порт.
Но часто желания конфликтуют с наличием свободного времени и на все порты времени не хватает.
Поэтому я решил опубликовать этот список вместе со своими мыслями относительно каждого приложения.


* [Collection 4](https://collectd.org/wiki/index.php/Collection_4)
* [Syncthing](https://github.com/syncthing/syncthing/)
* [blists](http://www.openwall.com/blists/)
* [s3cmd](http://s3tools.org/s3cmd) - уже [засылали](http://openbsd-archive.7691.n7.nabble.com/New-sysutils-s3cmd-td249277.html) в ports@
* [duck](https://duck.sh/)
* [Pywikibot](https://www.mediawiki.org/wiki/Manual:Pywikibot/ru)
* [dEQP](https://android.googlesource.com/platform/external/deqp/) - DrawElements Quality Program ([FOSDEM](https://archive.fosdem.org/2015/schedule/event/gl_testing/attachments/slides/670/export/events/attachments/gl_testing/slides/670/slides.pdf))
* [spotifyd](https://simonpersson.github.io/spotifyd/)
* [XMBC](http://kodi.tv/) - похоже, что [непортируемо](http://openbsd.7691.n7.nabble.com/xbmc-td246409.html)
* [LanguageTool](https://languagetool.org/)
* Клиент для [Telegram](https://github.com/vysheng/tg)
* [MediaGoblin](http://mediagoblin.readthedocs.org/en/v0.7.1/siteadmin/deploying.html)
* [castnow](https://github.com/xat/castnow) или что-нибудь для трансляции на Chromecast
* [Attic](https://attic-backup.org/) и [atticmatic](https://torsion.org/atticmatic/)
* [QEMU guest agent](http://wiki.qemu.org/Features/QAPI/GuestAgent) - были [попытки](http://comments.gmane.org/gmane.os.openbsd.ports/65642) портирования.
* [OSRM](http://project-osrm.org/)
* [rr](http://rr-project.org/)
* [T - twitter client](http://sferik.github.io/t/)
* [lastpass-cli](https://github.com/lastpass/lastpass-cli) - был [порт в ports@](http://openbsd-archive.7691.n7.nabble.com/NEW-security-lastpass-cli-td267355.html)
* [Plex.tv](https://plex.tv/) - похоже что не портируемо. Для FreeBSD порт использует [бинарь](http://www.freshports.org/multimedia/plexmediaserver/) приложения.
* [gtimelog](https://github.com/gtimelog/gtimelog)
* [California](https://wiki.gnome.org/Apps/California) - когда уже в OpenBSD будет хороший аналог Calendar.app?
* [Age of Empires](http://openage.sft.mx) - [в процессе портирования](https://github.com/jasperla/openbsd-wip/tree/master/games/openage)
* [Sigil](http://code.google.com/p/sigil/)
* [fbreader](https://fbreader.org/) - была [попытка](http://openbsd-archive.7691.n7.nabble.com/new-x11-fbreader-td139121.html). Есть [порт](https://svnweb.freebsd.org/ports/head/deskutils/fbreader/) для FreeBSD.
* [MyPaint](http://mypaint.intilinux.com/?page_id=9)
* [Gnome Paint](https://launchpad.net/gnome-paint) - здорово было бы иметь минималистичный графический редактор, чтобы не устанавливать Gimp.
* [Tapper](http://tapper.github.io/Tapper/) - [сделано](https://github.com/jasperla/openbsd-wip/tree/master/www), но не импортировано в официальное дерево портов
* [Seafile](https://www.seafile.com/en/home/) - [импортирован в официальное дерево портов](http://ports.su/net/seafile/seafile)
* [gpxviewer](http://blog.sarine.nl/gpx-viewer/) - [импортирован](http://ports.su/geo/gpx-viewer)
* [guacamole](http://guac-dev.org/doc/gug/installing-guacamole.html#building-guacamole-from-source)
* [ethercalc](https://ethercalc.org/)
* [etherpad](https://github.com/ether/pad)
* [Intel GPU tools](http://cgit.freedesktop.org/xorg/app/intel-gpu-tools/)
* [conman](https://code.google.com/p/conman/)
* [NOC project](http://kb.nocproject.org/display/SITE/NOC)
* [Xpra](http://xpra.org/)
* [Shairport](https://github.com/hendrikw82/shairport) - я пока не определился нужно ли поддерживать [проприерастов](https://www.apple.com/).
* [ted](http://www.nllgg.nl/Ted/) - [импортирован](http://ports.su/editors/ted)
* qcad не развивается, нужно заменить [cad/qcad](http://ports.su/cad/qcad) на [librecad](http://librecad.org/).
* [Calypso](http://keithp.com/blogs/calypso/) - альтернатива Radicale.
* [poit](http://yangman.ca/poit/)
* [yed](http://www.yworks.com/en/products_yed_about.html)
* [pkcs11-dump](http://sites.google.com/site/alonbarlev/pkcs11-utilities)
* [Scan Tailor](http://scantailor.sourceforge.net/)
* Open hardware порты - [идея не нашла поддержки](http://marc.info/?l=openbsd-misc&m=127995927812289&w=2).
* [opentodo](http://code.google.com/p/opentodo/) - я передумал портировать.
* [UniConvertor](http://www.sk1project.org/modules.php?name=Products&product=uniconvertor&op=download)
* [postal](http://doc.coker.com.au/projects/postal/) - [сделано](https://github.com/jasperla/openbsd-wip/tree/master/benchmarks/postal), но не импортировано.
* [ownCloud](http://owncloud.org/install/advanced/) - [импортировано](http://ports.su/www/owncloud)
* [gpsprune](http://activityworkshop.net/software/prune/)
* [xtrkcad](http://sourceforge.net/projects/xtrkcad-fork/) - [импортировано](http://ports.su/cad/xtrkcad)
* [unpaper](http://unpaper.berlios.de/) - [импортировано](http://ports.su/print/unpaper)
* [Открытые ресурсы для игры OpenTTD](http://bundles.openttdcoop.org/) - игра уже давно портирована, но ресурсы нужно брать из коммерческой версии. Нужно сделать порт для открытых ресурсов.
* [Redis DB](http://code.google.com/p/redis/)
* [Pimlico Dates](http://www.pimlico-project.org/dates.html) - нет проекта - нет порта.
* [tangogps](http://www.tangogps.org) - [импортировано](http://ports.su/geo/foxtrotgps).
* [HomeDaemon](http://www.denninger.net/homedaemon.htm) - уже нет желания тащить это в порты.
* [btpd webui](http://code.google.com/p/btpd-webui/) - уже нет желания тащить это в порты.
* [omd](http://www.sorted.org/~pete/Xmd/) - когда у меня был плеер Sony Walkman с MD дисками, то это было актуально. Теперь нет.
* [pybookreader](http://sourceforge.net/projects/pybookreader/)
* [sndfile-tools](http://www.mega-nerd.com/libsndfile/tools/#spectrogram)
* [checksec](http://www.trapkit.de/tools/checksec.html)
* [paxtest](http://pax.grsecurity.net/) - непортируемо
* Обновить [kismet](https://www.kismetwireless.net/)
* [netams](http://netams.com)
* [MacPaint](http://www.computerhistory.org/highlights/macpaint/)
* [CADuntu](http://www.caduntu.org/) - проект умер. Нет проекта - нет порта.
* Типографская раскладка (нужно ли?) [Бирмана](http://ilyabirman.ru/typography-layout/) или
[эту](http://sovety.blogspot.com/2010/09/typography-keyboard-layout-in-linux.html).
* [pacman](http://slaout.linux62.org/pacman/index.html)
* [NBD сервер](http://web.hexapodia.org/~adi/nbd/)
* [mpd & mpc and patches for scoring](http://mpd.wikia.com/wiki/Hack:mpc-mpd-score) - мне лень делать отдельный порт из-за этих патчей. Идея была в том, чтобы сделать систему рейтингов в MPD (Music Player Daemon) и потом эти рейтинги использовать во время загрузки музыкальных файлов в iPod (a-la iTunes).
* [POVColor](http://sourceforge.net/projects/povcolor/) - неплохо было бы иметь хотя бы один color picker.
* [backupfs](http://sourceforge.net/projects/backupfs/) - соблазнился тем, что её [использовал](http://www.informit.com/articles/article.aspx?p=1193856) Дональд Кнут, но есть решения и получше.
* [didiwiki](http://c2.com/cgi/wiki/wiki?DidiWiki)
* [snake](ftp://ftp.simtreas.ru/pub/my/snake.c.gz)
* Порты с firmware - есть порты с [прошивками для железа](http://ports.su/sysutils/firmware/). Почему бы не сделать порты с прошивками для потребительских устройств ([OpenInkPot](http://morgue.openinkpot.org/), [Rockbox](http://www.rockbox.org/))
* [invaders](http://sourceforge.net/projects/ninvaders)
* [asciijump](http://otak.k-k.pl/asciijump/gallery.php)
* [Return to Castle Wolfenstein](https://github.com/id-Software/RTCW-SP) ([ftp](ftp://ftp.idsoftware.com/idstuff/source/)) - есть [порт](https://www.freshports.org/games/rtcw-paks/) для FreeBSD.
* [minisip](http://freshmeat.net/projects/minisip/)

Fin
