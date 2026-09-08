Supplemental packages for UL-Linux 6.4
======================================
This repository contains additional supplemental packages that can be installed
on top of UL-Linux 6.4.

Prerequisites
=============
An already installed UL-Linux 6.4 distribution and the required dependencies for
the packages in this repository pre-installed.

Installation
============
You can configure the extras package sequence as follows:

```bash
$ cbt-cfg-seq sequences/extras
```

Running the selected scripts in the sequence can be done as follows:

```bash
$ cbt-run-seq sequences/extras
```

Features
========
This repository contains a number of interesting packages. This section
highlights some of them.

Older GCC compilers
-------------------
This repository includes two older versions of GCC for compatibility reasons:
* 2.95.3 is included to provide binary compatibility with applications developed
  in C++ still using an older libstdc++ API. The C++ API of GCC 2.95.x is used
  by quite a few commercial products, such as games from Loki games.
* 3.4.6 is included because it still contains a Fortran 77 implementation. In
  GCC 4.x and newer, this implementation was replaced with a Fortran 95
  implementation. Moreover, this version of GCC is required to bootstrap GCC
  2.95.3

Additional KDE applications
---------------------------
There are a number of additional KDE applications:

* krename, a convenient renaming tool for KDE
* krusader, an orthodox file manager for KDE
* konversation, an IRC client

Additional GNOME applications
-----------------------------
This repository also contains a number of interesting additional applications
for the GNOME desktop:

* AbiWord, a word processor
* gnumeric, a spreadsheet
* evolution, a mail client and calendar application
* Anjuta, a development IDE
* GNOME commander, an orthodox file manager for GNOME

Games
-----
It contains many free and open source software games. Some of them are ports
of previously released commercial block buster games.

OpenOffice.org 3.2.1
--------------------
This package set contains OpenOffice.org 3.2.1 supporting the OpenDocument
format.

Additional applications
-----------------------
* Inkscape, a vector drawing program
* Pidgin, a multi-protocol chat program based on libpurple
* Dia, a diagram drawing program

Additional packagers
--------------------
This package set contains tools to manage a variety of archive types:

* arc
* arj
* CAB (extraction only)
* lha
* rar (unrar only)
* zoo

WINE and binfmt_misc plugin
---------------------------
This package set contains WINE to run Windows executables and a plugin for the
`binfmt_misc` loader so that Windows executables can be executed in a similar
way as native ELF and a.out executables.

License
=======
This distribution is [BSD licensed](./COPYING). It uses the same license that
Linux from Scratch uses.
