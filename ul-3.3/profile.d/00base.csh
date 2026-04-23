#!/bin/csh

setenv PATH /bin:/usr/bin:/usr/local/bin
setenv MANPATH /usr/share/man:/usr/local/share/man
setenv INFOPATH /usr/share/info:/usr/local/share/info

if ( `id -u` == 0 ) then
    setenv PATH /sbin:/usr/sbin:/usr/local/sbin:$PATH
endif
