# https://ma.ttias.be/technical-guide-seo/

HUGO=hugo

all: 404 200

publish:
	${HUGO}
	scp -r public/* gw.bronevichok.ru:/var/www/html/www.bronevichok.ru/blog/

404:
	wget --spider -r -p https://bronevichok.ru/blog 2>&1 | grep -B 2 ' 404 '	
	python check_urls.py _posts/*.md

200:
	wget --spider -r -o ~/crawl_results.log -p https://bronevichok.ru/blog 2>&1

force_https:
	find . -name "*.md" | xargs grep "http:"

w3c_validate:
	python w3c-validator.py https://bronevichok.ru/blog/
	python mft.py http://blog.bronevichok.ru

spellcheck:
	java -jar ~/LanguageTool-2.7/languagetool-commandline.jar --autoDetect _posts/*.md
	yaspeller .
	find . -name "*.md" -exec aspell --lang=en --mode=tex check "{}" \;
