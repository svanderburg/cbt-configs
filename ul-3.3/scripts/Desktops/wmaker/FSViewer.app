#!/bin/bash -e

source $cbtFunctionsDir/deploySourcePackage
source $cbtBaseDir/settings/ul-packages-settings

name=FSViewer.app
version=0.2.5
group=Desktops/wmaker
license=GPLv2
description="File system viewer"
src="f/FSViewer.app/$name-$version.tar.gz"

showLongDescription()
{
    cat << "EOF"
FSViewer is a NeXT FileViewer lookalike for Window Maker. Viewing is currently
supported via browser mode and list mode.
EOF
}

buildPhase()
{
    ./configure --prefix=/usr
    make
}

installPhase()
{
    make install
}
