#!/bin/sh

PATH=/bin:/usr/bin:/usr/local/bin
MANPATH=/usr/share/man:/usr/local/share/man
INFOPATH=/usr/share/info:/usr/local/share/info

if [ $(id -u) = 0 ]
then
    PATH=/sbin:/usr/sbin:/usr/local/sbin:$PATH
fi

# Setup the INPUTRC variable

if [ -z "$INPUTRC" -a ! -f "$HOME/.inputrc" ]
then
    INPUTRC=/etc/inputrc
fi

export PATH MANPATH INFOPATH INPUTRC
