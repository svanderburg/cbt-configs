#!/bin/csh

setenv PATH /bin:/usr/bin:/usr/local/bin
setenv INFOPATH /usr/share/info:/usr/local/share/info

if ( `id -u` == 0 ) then
    setenv PATH /sbin:/usr/sbin:/usr/local/sbin:$PATH
endif

setenv PYTHONPATH /usr/lib/python2.6:/usr/lib/python2.6/site-packages

# By default we want the umask to get set

if ( `id -gn` == `id -un` && `id -u` > 99 ) then
    umask 002
else
    umask 022
endif
