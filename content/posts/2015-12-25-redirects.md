---
date: 2015-12-25T00:00:00Z
title: Переименования
url: /2015/12/25/redirects.html
tags: ["life"]
---

Недавно в структуре компании Parallels произошли изменения и на свет появились
две новых компании: [Virtuozzo](https://virtuozzo.com/) и Plesk.

До этого уже были попытки разделить бизнесы на серверный и пользовательский (SP
и CP) и выделить подразделение по разработке серверного ПО в в отдельный бренд
Odin.  Чтобы не путаться что и в какой последовательности происходило всегда
можно посмотреть историю изменений в редиректах с основного сайта:

www.parallels.com -> sp.parallels.com -> www.odin.com -> www.virtuozzo.com

	$ curl -L -I https://www.parallels.com/products/pcs/

	HTTP/1.1 301 Moved Permanently
	Server: nginx/1.8.0
	Date: Thu, 24 Dec 2015 08:05:39 GMT
	Content-Type: text/html
	Connection: keep-alive
	X-Powered-By: PHP/5.4.45
	Location: http://sp.parallels.com/products/pcs/

	HTTP/1.0 301 Moved Permanently
	Server: squid/3.1.10
	Date: Thu, 24 Dec 2015 08:05:39 GMT
	Content-Length: 0
	Location: https://www.odin.com/products/pcs/
	X-Cache: MISS from sp.parallels.com
	X-Cache-Lookup: MISS from sp.parallels.com:80
	Connection: keep-alive

	HTTP/1.0 302 Moved Temporarily
	Date: Thu, 24 Dec 2015 08:05:40 GMT
	Server: Apache/2.2.3 (CentOS)
	Set-Cookie: aspcms_sid=a6c8bbec0f0b7e97cf0aaf34ab7c12b0; path=/; domain=.www.odin.com; expires=Fri, 23-Dec-2016 08:05:40 GMT; HTTPOnly
	Pragma: no-cache
	Cache-Control: private, no-cache
	Expires: Thu, 01 Jan 1970 00:00:00 GMT
	Content-Type: text/html; charset=iso-8859-1
	Location: /en/products/virtuozzo/
	X-Cache: MISS from www.odin.com
	X-Cache-Lookup: MISS from www.odin.com:80
	Connection: close

	HTTP/1.0 301 Moved Permanently
	Date: Thu, 24 Dec 2015 08:05:40 GMT
	Server: Apache/2.2.3 (CentOS)
	Content-Type: text/html; charset=iso-8859-1
	Location: https://www.odin.com/products/virtuozzo/
	X-Cache: MISS from www.odin.com
	X-Cache-Lookup: MISS from www.odin.com:80
	Connection: close

	HTTP/1.0 301 Moved Permanently
	Date: Thu, 24 Dec 2015 08:04:23 GMT
	Server: Apache
	Vary: Accept-Encoding
	Content-Length: 0
	Content-Type: text/html; charset=UTF-8
	Location: https://www.virtuozzo.com
	Age: 78
	X-Cache: HIT from www.odin.com
	X-Cache-Lookup: HIT from www.odin.com:80
	Connection: close

	HTTP/1.0 200 OK
	Date: Thu, 24 Dec 2015 08:04:24 GMT
	Server: Apache
	Last-Modified: Mon, 21 Dec 2015 08:16:13 GMT
	Expires: Thu, 24 Dec 2015 08:10:06 GMT
	ETag: "9ef1d76b5dbb78855e21eb774f7df3cd"
	Cache-Control: max-age=342
	Pragma: public
	Vary: Accept-Encoding
	Content-Type: text/html; charset=utf-8
	Age: 78
	X-Cache: HIT from www.new.virtuozzo.com
	X-Cache-Lookup: HIT from www.new.virtuozzo.com:80
	Connection: close
