---
date: 2017-12-18T00:00:00Z
title: Универсальный фаззер для грамматик
tags: ["softwaretesting", "openbsd"]
---

Этот текст - продолжение [поста про фаззинг](/2017/12/01/fuzzing.html). Его я
закончил на том, что было бы здорово на основе грамматики генерировать примеры
для тестирования приложений. Нужно сразу отметить, что эта идея не нова и есть
специализированные фаззеры, которые генерируют синтаксически правильные
программы. Немного расскажу про три таких фаззера.

Пожалуй самый известный пример это
[csmith](http://www.cs.utah.edu/~regehr/papers/pldi11-preprint.pdf). Фаззер
генерирует синтаксически правильную программу на языке Си и с помощью
тестируемого компилятора пытаются эту программу скомпилировать. С помощью
csmith нашли семь десятков багов в gcc и пару сотен в LLVM.

Второй пример это sqlsmith. Принцип точно такой же как и у csmith, список багов
тоже не маленький - семь десятков.

sqlsmith и csmith имеют одну общую черту - генератор для каждого из них писали
отдельно. Писать свой генератор для синтаксиса каждого из демонов OpenBSD мне
совсем не хотелось. К тому же синтаксис мог со временем меняться и генератор
пришлось бы исправлять.

Ещё один пример это фаззер для CockroachDB. Эта СУБД имеет нестандартную
реализацию SQL, поэтому sqlsmith им не подошёл. Грамматика SQL для CockroachDB
описывается в формате YACC и они на основе этой грамматики сделали [генератор
SQL запросов](https://github.com/cockroachdb/cockroach/tree/master/pkg/internal/rsg) и
[нашли](https://mattjibson.com/blog/2016/10/19/testing-cockroachdb-generating-random-valid-sql/)
с ним 82 бага. Из-за того, что генератор использует YACC формат он опять же не
является универсальным для разных грамматик.

В OpenBSD для описания грамматики конфигов тоже используется YACC, на основе
которого с помощью утилиты *yacc* генерируется парсер. Пример описания для yacc
выглядит так:

```
%{
#include <stdio.h>
#include <string.h>
 
void yyerror(const char *str)
{
        fprintf(stderr,"error: %s\n",str);
}
 
int yywrap()
{
        return 1;
} 
  
main()
{
        yyparse();
} 

%}

%token NUMBER TOKHEAT STATE TOKTARGET TOKTEMPERATURE
```

Мне нужно было YACC-описание преобразовать в более стандартный и читаемый
формат, желательно независимый от языков программирования. Таким форматом
является BNF - форма Бэкуса-Наура. BNF используется для описания синтаксиса
языков программирования, протоколов и т.д. Вот так, например, выглядит
описание небольшой части [синтаксиса конфига пакетного
фильтра](https://man.openbsd.org/pf.conf#GRAMMAR) в OpenBSD:

```
line    = ( option | pf-rule | 
          antispoof-rule | queue-rule | anchor-rule | 
          anchor-close | load-anchor | table-rule | include ) 
 
option  = "set" ( [ "timeout" ( timeout | "{" timeout-list "}" ) ] | 
          [ "ruleset-optimization" [ "none" | "basic" | 
          "profile" ] ] | 
          [ "optimization" [ "default" | "normal" | "high-latency" | 
          "satellite" | "aggressive" | "conservative" ] ] 
          [ "limit" ( limit-item | "{" limit-list "}" ) ] | 
          [ "loginterface" ( interface-name | "none" ) ] | 
          [ "block-policy" ( "drop" | "return" ) ] | 
          [ "state-policy" ( "if-bound" | "floating" ) ] 
          [ "state-defaults" state-opts ] 
          [ "fingerprints" filename ] | 
          [ "skip on" ifspec ] | 
          [ "debug" ( "emerg" | "alert" | "crit" | "err" | 
          "warning" | "notice" | "info" | "debug" ) ] | 
          [ "reassemble" ( "yes" | "no" ) [ "no-df" ] ] ) 
```

*yacc* не может преобразовать YACC-описание напрямую в BNF форму, но с ключом
```-v``` можно преобразовать в описание, удобное для чтения, а потом сделав
небольшие преобразования получить описание в EBNF, расширенной BNF форме. EBNF
это как раз то, что мне и было нужно. Для чтения EBNF во многих языках есть
модули и сделать генератор не будет большой проблемой.

Приятный бонус использования EBNF это возможность нарисовать railroad диаграммы
для грамматики:

<img src="/images/option.png" style="float:left"><br><br>

Насколько эффективным получился мой генератор напишу в одном из следующих
постов.

Если тема показалась интересной, то вот список статей на подобную тематику:

- [Experiences with Model Inference Assisted
Fuzzing](https://www.usenix.org/legacy/event/woot08/tech/full_papers/viide/viide.pdf)
- [Фаззер языков на основе грамматик
LangFuzz](https://users.own-hero.net/~decoder/holler-mthesis-2011.pdf)
- [Fuzzing with Code
Fragments](https://people.csail.mit.edu/akiezun/pldi-kiezun.pdf)
- BlendFuzz: A Model-Based Framework for Fuzz Testing Programs with Grammatical Inputs
- [Property-based тестирование с BNF](http://www.erlang.se/euc/08/1430Nilsson.pdf)
- [Fuzzing with Code
Fragments](https://www.usenix.org/system/files/conference/usenixsecurity12/sec12-final73.pdf)
- A sentence generator for testing parsers
- [Grammar Based Unit Testing for Parsers](https://jonriehl.com/public/docs/thesis.pdf)
- Фаззеры для тестирования безопасности [dharma](https://github.com/MozillaSecurity/dharma) и [avalanch](https://github.com/MozillaSecurity/avalanche)

<!--
[VCG](http://www.rw.cdl.uni-saarland.de/users/sander/html/gsvcg1.html)
[yaccviso](http://www.lo-res.org/~aaron/yaccviso/)
[vyacc](http://cs.gmu.edu/~white/Vyacc/dist.html)
[awk script](http://www.coding-guidelines.com/images/railroad.awk.txt)
[yacc2dot](https://www.physics.drexel.edu/~wking/unfolding-disasters-old/posts/yacc2dot/)
[source](http://git.tremily.us/?p=blog.git;a=blob;f=posts/yacc2dot/yacc2dot;h=35c40eee3801b10a844c5e72aad45808e45a25ee;hb=ba9185cb0e83d226c46a223a668b7eefd52811f2)
-->
