# https://ma.ttias.be/technical-guide-seo/

publish:
	hugo
	scp -r public/* gw.bronevichok.ru:/var/www/html/www.bronevichok.ru/blog/

notfound:
	wget --spider -r -p https://bronevichok.ru/blog 2>&1 | grep -B 2 ' 404 '	

200:
	wget --spider -r -o ~/crawl_results.log -p https://bronevichok.ru/blog 2>&1

force_https:
	find . -name "*.md" | xargs grep "http:"
