---
layout: page
title: Все посты
permalink: /archive/
---

{% for post in site.posts %}
  * {{ post.date | date: "%d.%m.%Y" }} – [ {{ post.title }} ]({{ post.url }})
{% endfor %}
