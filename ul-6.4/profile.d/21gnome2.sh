#!/bin/sh

if [ $(id -u) = 0 ]
then
    PATH=$PATH:/opt/gnome2/sbin
fi

PATH=$PATH:/opt/gnome2/bin

INFOPATH=$INFOPATH:/opt/gnome2/share/info
PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/opt/gnome2/lib/pkgconfig:/opt/gnome2/share/pkgconfig
PYTHONPATH=$PYTHONPATH:/opt/gnome2/lib/python2.6:/opt/gnome2/lib/python2.6/site-packages
XDG_DATA_DIRS=$XDG_DATA_DIRS${XDG_DATA_DIRS+:}/opt/gnome2/share
XDG_CONFIG_DIRS=$XDG_CONFIG_DIRS${XDG_CONFIG_DIRS+:}/etc/opt/gnome2/xdg
GNOME_LIBCONFIG_PATH=/usr/lib:/opt/gnome2/lib

export PATH INFOPATH PKG_CONFIG_PATH PYTHONPATH XDG_DATA_DIRS XDG_CONFIG_DIRS GNOME_LIBCONFIG_PATH
