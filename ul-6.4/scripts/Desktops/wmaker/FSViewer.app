#!/bin/bash -e

source $cbtFunctionsDir/deploySourcePackage
source $cbtBaseDir/settings/ul-packages-settings

name=FSViewer.app
version=0.2.5
group=Desktops/wmaker
license=GPLv2
description="File system viewer"
src="f/FSViewer.app/$name-$version.tar.gz"
patches=("f/FSViewer.app/$name-$version-WM-0.81.0.patch.gz")

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
    sed -i 's/-lX11/-lX11 -lXft/' src/Makefile
    make $globalBuildOptions
}

installPhase()
{
    make install
}
