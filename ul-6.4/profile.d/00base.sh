#!/bin/sh

PATH=/bin:/usr/bin:/usr/local/bin
INFOPATH=/usr/share/info:/usr/local/share/info

if [ $(id -u) = 0 ]
then
    PATH=/sbin:/usr/sbin:/usr/local/sbin:$PATH
fi

PYTHONPATH=/usr/lib/python2.6:/usr/lib/python2.6/site-packages

# By default we want the umask to get set.

if [ "$(id -gn)" = "$(id -un)" -a $EUID -gt 99 ]
then
    umask 002
else
    umask 022
fi

# Setup for /bin/ls to support color

if [ -f "/etc/dircolors" ]
then
    eval $(dircolors -b /etc/dircolors)

    if [ -f "$HOME/.dircolors" ]
    then
        eval $(dircolors -b $HOME/.dircolors)
    fi
fi

alias ls='ls --color=auto'

# Setup a red prompt for root and a green one for users.

NORMAL="\[\e[0m\]"
RED="\[\e[1;31m\]"
GREEN="\[\e[1;32m\]"

if [[ $EUID == 0 ]]
then
    PS1="$RED\u [ $NORMAL\w$RED ]# $NORMAL"
else
    PS1="$GREEN\u [ $NORMAL\w$GREEN ]\$ $NORMAL"
fi

# Setup the INPUTRC variable

if [ -z "$INPUTRC" -a ! -f "$HOME/.inputrc" ]
then
    INPUTRC=/etc/inputrc
fi

export PATH INFOPATH PYTHONPATH INPUTRC
