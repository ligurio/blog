---
layout: page
title: Все посты
permalink: /archive/
---

{% for post in site.posts %}
  * {{ post.date | date: "%m.%d.%Y" }} – [ {{ post.title }} ]({{ post.url }})
{% endfor %}
