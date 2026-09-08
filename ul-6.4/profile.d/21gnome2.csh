#!/bin/csh

if ( `id -u` == 0 ) then
    setenv PATH ${PATH}:"/opt/gnome2/sbin"
endif

setenv PATH ${PATH}:"/opt/gnome2/bin"
setenv INFOPATH ${INFOPATH}:"/opt/gnome2/share/info"
setenv PKG_CONFIG_PATH ${PKG_CONFIG_PATH}:"/opt/gnome2/lib/pkgconfig:/opt/gnome2/share/pkgconfig"
setenv PYTHONPATH ${PYTHONPATH}:"/opt/gnome2/lib/python2.6:/opt/gnome2/lib/python2.6/site-packages"

# Configure XDG_DATA_DIRS

if ( $?XDG_DATA_DIRS ) then
    if ( "$XDG_DATA_DIRS" == "" ) then
        setenv XDG_DATA_DIRS
    else
        setenv XDG_DATA_DIRS ${XDG_DATA_DIRS}:
    endif
else
    setenv XDG_DATA_DIRS
endif

setenv XDG_DATA_DIRS ${XDG_DATA_DIRS}"/opt/gnome2/share"

# Configure XDG_CONFIG_DIRS

if ( $?XDG_CONFIG_DIRS ) then
    if ( "$XDG_CONFIG_DIRS" == "" ) then
        setenv XDG_CONFIG_DIRS
    else
        setenv XDG_CONFIG_DIRS ${XDG_CONFIG_DIRS}:
    endif
else
    setenv XDG_CONFIG_DIRS
endif

setenv XDG_CONFIG_DIRS ${XDG_CONFIG_DIRS}"/etc/opt/gnome2/xdg"
setenv GNOME_LIBCONFIG_PATH "/usr/lib:/opt/gnome2/lib"
