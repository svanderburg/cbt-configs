#!/bin/csh

if ( -f /etc/sysconfig/locale.csh ) then
    source /etc/sysconfig/locale.csh
else
    set LOCALE=C
endif

setenv LANG $LOCALE
setenv LC_ALL $LOCALE
setenv LC_COLLATE $LOCALE
setenv LC_CTYPE $LOCALE
setenv LC_MESSAGES $LOCALE
setenv LC_NUMERIC $LOCALE
