---
date: 2018-06-01T00:00:00Z
title: Разобраться в новом коде
tags: ["opensource"]
---

Когда пытаешься разобраться в новом коде, то удобно это делать двигаясь от
общей архитектуры в сторону реализации отдельных функций. Обычно я пользуюсь
связкой vim с ctags и ctags конечно помогает в навигации по функциям, но чтобы
понять все взаимосвязи в большой кодовой базе нужно потратить прилично времени.
Было бы удобно рисовать граф вызовов функций для общего представления и потом уже
погружаться в детали реализации.

После непродолжительного поиска я нашел несколько скриптов, которые рисуют
такой граф. На вопрос в твиттере мне подсказали ещё несколько вариантов:
[doxygen](https://www.stack.nl/~dimitri/doxygen/manual/diagrams.html) и скрипт
[graph-llvm-ir](https://github.com/pfalcon/graph-llvm-ir/blob/master/graph-llvm-ir)
для LLVM IR.

<blockquote class="twitter-tweet" data-lang="ru"><p lang="en" dir="ltr">What tool do you use to get a pictorial function call graph of C code? I found Doxygen, CodeViz, pycflow2dot and some others. The goal is understanding large codebase.</p>&mdash; Sergey Bronnikov (@estet) <a href="https://twitter.com/estet/status/969664050367025152?ref_src=twsrc%5Etfw">2 марта 2018 г.</a></blockquote>
<script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>

Все найденные варианты работают примерно одинаково: строят синтаксическое
дерево и на его основе рисуют картинку с графом. При ближайшем рассмотрении
выяснилось, что код [pycflow2dot](https://github.com/johnyf/pycflow2dot) давно
не обновлялся и не работает с последними версиями питоновских модулей.
[codeviz](https://github.com/petersenna/codeviz) тоже давно не обновлялся и у
меня не получилось его попробовать. А вот Doxygen оказался очень простым в
использовании. Нужно выполнить команду ```doxygen -g```, которая создаст шаблон
конфига, потом включить в этом конфиге опции HAVE_DOT, EXTRACT_ALL,
EXTRACT_PRIVATE, EXTRACT_STATIC, CALL_GRAPH и запустить ```doxygen Doxyfile```
в директории с исходниками. После успешного выполнения программа создаст две
директории: latex и html. В первой будут исходники для сборки pdf документа, а
во второй документация для просмотра в браузере. Для теста я запускал doxygen в
репозитории проекта CRIU (~67 KLOC) и создание документации заняло 4 минуты.
Для каждого исходного файла создается отдельный раздел с документации и там
можно посмотреть и описания функций, если они аннотированы в коде, и графы
взаимосвязей функций. Пользоваться удобно.
