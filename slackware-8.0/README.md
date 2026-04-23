CBT scripts collection for Slackware 8.0
========================================
This package contains scripts to deploy all kinds of software packages on top of
Slackware 8.0 by building them from source code. These scripts can be deployed
by using CBT: The Conservative Build Tool.

Under the hood, It uses `checkinstall` and the Slackware package management to
automatically create and deploy Slacware packages.

Prerequisites
=============
You need to install all required packages to build C/C++ projects with the
Slackware package manager from the Slackware distribution. These package should
suffice:


```
Slackware category: d1

autoconf
automake
binutils
bison
flex
gcc
gettext
glibc
glocale
gmake
libtool
linuxinc
m4
```


For many desktop applications and games, it is good to have some common
libraries installed, such as:

```
Slackware category: d1

jpeg6
libpng
libtiff
```

For applications for the GNOME desktop environment the required GNOME libraries
must be installed such as:

```
Slackware category: gtk1

aaagnome
glib
gtkplus
```

KDE applications typically require the the following packages:

```
Slackware category: kde1

kdelibs
kdebase
qt2
ksupport
```

The Data Display Debugger (DDD) applications requires `gdb` (category: `d1`).

Finally, you need to install CBT: The Conservative Build Tool (CBT) in order
to execute sequences of scripts.

Installation
============
You must unpack the slackware CBT scripts tarball in a directory that is
publicly readable. For example, `/usr/src/slackware-8.0` is a good location.

You can configure the scripts that you want to be executed as follows:

```bash
$ cbt-cfg-seq sequences/slackware-8.0
```

and run the selected scripts in the sequence as follows:

```bash
$ cbt-run-seq sequences/slackware-8.0
```

Features
========
This repository contains scripts to deploy various kinds of emulators, games,
applications (such as: `MPlayer`) and development tools (such as: `gdb`,
Data Display Debugger etc.).

License
=======
This distribution is [BSD licensed](./COPYING). It uses the same license that
Linux from Scratch uses.
