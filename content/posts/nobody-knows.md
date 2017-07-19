---
date: 2017-07-19T00:00:00Z
title: Переносимый интерфейс операционных систем
tags: ["opensource"]
---

Читаю документацию по функции
[statfs(2)](http://man7.org/linux/man-pages/man2/statfs.2.html), а там такое:

> Nobody knows what f_fsid is supposed to contain (but see below).

Дальше идёт объяснение того, как f_fsid используется в разных ОС, но суть в
том, что нет единого мнения как значение из этого поля использовать. Это
несмотря на то, что поле присутствует в описании struct statvfs в POSIX
1003.1-2001.

<!--
>    Solaris, Irix and POSIX have a system call statvfs(2) that returns a
>    struct statvfs (defined in <sys/statvfs.h>) containing an unsigned
>    long f_fsid.  Linux, SunOS, HP-UX, 4.4BSD have a system call statfs()
>    that returns a struct statfs (defined in <sys/vfs.h>) containing a
>    fsid_t f_fsid, where fsid_t is defined as struct { int val[2]; }.
>    The same holds for FreeBSD, except that it uses the include file
>    <sys/mount.h>.

>    The general idea is that f_fsid contains some random stuff such that
>    the pair (f_fsid,ino) uniquely determines a file.  Some operating
>    systems use (a variation on) the device number, or the device number
>    combined with the filesystem type.  Several operating systems
>    restrict giving out the f_fsid field to the superuser only (and zero
>    it for unprivileged users), because this field is used in the
>    filehandle of the filesystem when NFS-exported, and giving it out is
>    a security concern.
>
>    Under some operating systems, the fsid can be used as the second
>    argument to the sysfs(2) system call.
-->
