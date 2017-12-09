---
date: 2017-12-03T00:00:00Z
title: Чтение книг
draft: true
tags: ["personal"]
---

Во время чтения книг я делаю для себя заметки о прочитанном, а для прочитанных книг
веду список с краткой рецензией и избранными цитатами.

Раньше я для ведения списка книг с цитатами использовал сервисы,
но пришел к выводу, что ни один из них неудобен.

Первым была [Библа](http://bibla.ru/estet/). Некий разработчик сделал
для себя сервис, в котором можно было бы вести список прочитанных книг.

[Bookmate](https://bookmate.com/sergeybronnikov/),
[Kindle](https://read.amazon.com/notebook))

+ простой текст
+ нет зависимости от какого-то сервиса (SaaS lock-in)


```
#!/usr/bin/env python
# -*- coding: utf-8 -*- 

import sys, os, codecs
from collections import defaultdict

filename = 'My Clippings.txt'

def process_clipping(clipping):

    # every clipping has a title, content and a date
    clipping_lines = clipping.split('\r\n')
    if not len(clipping_lines) >= 4:
        return ('', '')
    title = clipping_lines[0].split('(')[0]
    # TODO date option
    content = "\r\n".join(clipping_lines[3:])
    print title
    return title, content
    
    
def process_file():

    fh = codecs.open(filename, 'r', 'utf-8')
    text = fh.read()
    clippings = text.split('\r\n==========\r\n')

    ebooks = defaultdict(list)
    for c in clippings:
        title, content = process_clipping(c)
        if title and content:
            ebooks[title].append(content)

#    if not os.path.isdir('clippings'):
#        os.mkdir('clippings')

    for ebook in ebooks.keys():

        ebook = ebook.replace('/', '')
        ebook = ebook.replace('\\', '')
        fh = codecs.open('ebook.yml', 'a', 'utf-8')
        fh.write(ebook + '\n\n')
        for content in ebooks[ebook]:
            fh.write(content + '\n\n')
        fh.close()

if __name__ == '__main__':
```


## Похожие списки

- [Brandon Amos](https://github.com/bamos/reading-list)
- [Cory Monty](https://github.com/cmonty/reading-list)
- [Cory Schires](https://github.com/coryschires/reading-list)
- [David Ragone](https://github.com/DavidRagone/reading_list)
- [Matt Valentine-House](https://github.com/eightbitraptor/reading_list)
- [Jared Cacurak](https://github.com/jaredcacurak/reading-list)
- [Derek Sivers](https://sivers.org/book)
- [Людвиг Быстроновский](http://ludwigbistronovsky.ru/storage/books)
- [Паша Омелёхин](http://omelekhin.ru/read/)
- [chrisreads](https://github.com/ckenst/ReadingList)
