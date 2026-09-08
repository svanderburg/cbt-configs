#!/bin/csh

setenv PATH ${PATH}:"/opt/kde/bin"

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

setenv XDG_DATA_DIRS ${XDG_DATA_DIRS}"/opt/kde/share"

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

setenv XDG_CONFIG_DIRS ${XDG_CONFIG_DIRS}"/etc/opt/kde/xdg"
