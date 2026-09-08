#!/bin/sh

if [ -f /etc/sysconfig/locale ]
then
    source /etc/sysconfig/locale
else
    LOCALE=C
fi

export LANG=$LOCALE
export LC_ALL=$LOCALE
export LC_COLLATE=$LOCALE
export LC_CTYPE=$LOCALE
export LC_MESSAGES=$LOCALE
export LC_NUMERIC=$LOCALE
