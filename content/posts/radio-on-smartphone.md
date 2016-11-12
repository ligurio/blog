---
date: 2016-11-07T00:00:00Z
title: Радио в дорогу
tags: ["life", "personal"]
---

Количество приложений для Андроид перевалило за число полтора миллиона.  Но я
так и не смог найти в Google Play нормальное приложения для прослушивания
онлайн-радио.  Задача простая: мне нравится [Radio
Caroline](https://ru.wikipedia.org/wiki/Radio_Caroline) и я хочу слушать это
радио в удобном приложении без рекламы. Самое популярное приложение для
прослушивания радио в Google Play это TuneIn, но с удобством я бы поспорил, да и
реклама отключается только после оформления подписки. А за что там платить
деньги, если сами радио бесплатные, я не понимаю. Другим вариантом был
медиаплеер VLC, но при "мигании" интернета он не может восстановить проигрывание
аудиопотока.

Я нашёл решение, которое не требует установки приложения - прослушивание радио с
помощью стандартного HTML5 плеера в веб-браузере:

	  <div>Radio Caroline</div>
		 <audio controls preload="none">
		 <source src="http://sc6.radiocaroline.net:8040/;stream.mp3" type="audio/mpeg">
		 Your browser does not support the audio element.
		 </audio>
	  </div>

<audio controls preload="none">
<source src="http://sc6.radiocaroline.net:8040/;stream.mp3" type="audio/mpeg">
Your browser does not support the audio element.
</audio>

Но страницу делать самому вовсе не обязательно, можно воспользоваться
каталогами: [Community Radio Browser](http://www.radio-browser.info/), [Icecast
directory](http://dir.xiph.org/) и плейлистами на
[iptv.zone](https://iptv.zone).
