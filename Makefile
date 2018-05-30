# https://ma.ttias.be/technical-guide-seo/

HUGO=hugo
IMAGES=static/images/

all: publish

publish:
	${HUGO}
	scp -r public/* git.bronevichok.ru:/var/www/htdocs/www.bronevichok.ru/blog/

links:
	@echo "Validate HTTP links"
	# https://github.com/dkhamsing/awesome_bot
	find . -name "*.md" | xargs grep "http:"
	wget --spider -r -o ~/crawl_results.log -p https://bronevichok.ru/blog 2>&1

w3c_validate:
	@echo "Spelling check"
	python w3c-validator.py https://bronevichok.ru/blog/
	python mft.py http://blog.bronevichok.ru

spellcheck:
	@echo "Spelling check"
	java -jar ~/LanguageTool-2.7/languagetool-commandline.jar --autoDetect _posts/*.md
	yaspeller .
	find . -name "*.md" -exec aspell --lang=en --mode=tex check "{}" \;

optimg:
	@echo "Optimize images"
	find -name *.jpg -exec jpegoptim --strip-all --overwrite --preserve --totals '{}' \;
	find -name *.png -exec optipng -o5 -v -clobber -strip all '{}' \;
	# see also https://github.com/technopagan/cjpeg-dssim

opticss:
	@echo TODO
	# https://github.com/mrclay/minify
