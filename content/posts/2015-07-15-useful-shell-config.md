---
date: 2015-07-15T00:00:00Z
title: Полезности в .profile
url: /2015/07/15/useful-shell-config.html
---

Я всё ещё активно пользуюсь командной строкой несмотря на то, что за последнее
время я стал больше использовать графических приложений вместо консольных.

Многие операции в консоли можно автоматизировать с помощью алиасов и функций.
Этот пост про те алиасы и функции, которые прижились у меня в .profile и которыми
я часто пользуюсь.

Итак.

### Алиасы

Первый алиас остался с тех времен, когда я пользовался
[todo.txt](https://github.com/ginatrapani/todo.txt-cli).
Но сейчас список дел лежит в [Notational Velocity](http://notational.net/),
а привычка иногда просматривать текущий список дел из консоли остался.

```
t="vim $HOME/Documents/personal/sergeyb-notes/TODO.txt"
```

Чтобы что-то автоматизировать нужно сначала понять в каком месте рутина.
Этот алиас помогает понять какие команды чаще всего я набираю
и сделать вывод об автоматизации этих команд.

```
topc="history | awk {'print $2'} | sort | uniq -c | sort -k1 -rn | head"
```

<!--
Иногда жуть как хочется твитнуть из консоли не открывая Tweetdeck
или другие приложения для твиттера. Утилита curl приходит на помощь,
пароль она берет из .netrc:

```
twit='curl -u estet:pass -d status="Tweeting from the shell" http://twitter.com/statuses/update.xml'
```
-->

Узнать IP адрес, под которым вы выходите во внешнюю сеть, иногда бывает необходимо:

```
ip='dig myip.opendns.com @resolver1.opendns.com +short'
```

tmux использую ещё с тех пор как одна из его первых версий была [добавлена](http://undeadly.org/cgi?action=article&sid=20090707041154) в OpenBSD. Что делает алиас ниже думаю не надо объяснять.

```
tmux='tmux attach || tmux new'
```

Зачем писать дополнительные команды, если можно просто хорошо попросить?

```
please='sudo'
```

###  Функции

Если apg не установлен, то используем openssl для создания пароля:

```
if [ -x /usr/local/bin/apg ]; then
        alias newpassword='apg -n 1 -m 40 -M SNCL -E oO0'
else
        alias newpassword='openssl rand -base64 40'
fi
```

<!--
```
anybar { echo -n $1 | nc -4u -w0 localhost ${2:-1738}; }
```
-->


Сокращение ссылок в консоли:

```
clck { curl https://clck.ru/--?url=$1 || exit 1; echo; }
```

Чтобы передать кусочек текста с ноутбука на телефон я пользуюсь
QR кодами: сделал изображение QR кода, сфотографировал и текст на телефоне.
Чтобы QR делать быстро и из консоли я пользуюсь сервисов Google:

```
qr { open "https://chart.googleapis.com/chart?chs=500x500&cht=qr&chl=$1" || exit 1; }
```

Часто перечитываю маны для FreeBSD/OpenBSD и чтобы быстрее открывать нужную страницу документации
полезен сервис [mdoc.su](http://mdoc.su).

```
m { open "http://mdoc.su/-/$1" || exit 1; }
```

Нет у меня привычки пользоваться ни дропбоксом, ни другими подобными сервисами.
Проще выложить файл на свой хост и поделиться ссылкой.

```
share { scp -r $1 gw.bronevichok.ru:/var/nginx/html/trash/ > /dev/null 2>&1 && echo "http://bronevichok.ru/trash/$(basename $1)" || echo "Failed to share :("; }
```

Про команду ssh-copy я знаю, но её нужно дополнительно устанавливать,
а эта функция всегда будет под рукой, если её добавить в .profile:

```
sshcp { cat ~/.ssh/id_rsa.pub | ssh $1 'cat >> ~/.ssh/authorized_keys'; }
```

Таймер в консоли:

```
function stopwatch(){
  case $(uname) in
    "Linux") DATE=date ;;
    "Darwin") DATE=gdate ;;
  esac
  local BEGIN=`$DATE +%s`
  while true; do
    echo -ne "$($DATE -u --date @$((`$DATE +%s` - $BEGIN)) +%H:%M:%S)\r";
  done
}
```

*Добавлено:* Пару дней назад на HN было [обсуждение](https://news.ycombinator.com/item?id=9869231) любимых алиасов, в котором можно найти немало полезных.
