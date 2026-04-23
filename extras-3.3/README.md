Supplemental packages for UL-Linux 3.3
======================================
This repository contains additional supplemental packages that can be installed
on top of UL-Linux 3.3.

Prerequisites
=============
An already installed UL-Linux 3.3 distribution and the required dependencies for
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
This repository contains a number of interesting packages.

Additional KDE applications
---------------------------
There are a number of additional KDE applications:

* k3b, a CD/DVD burning tool
* krusader, an orthodox file manager for KDE

Additional GNOME applications
-----------------------------
This repository also contains a number of interesting additional applications
for the GNOME desktop:

* AbiWord, a word processor
* gnumeric, a spreadsheet
* evolution, a mail client and calendar application
* Anjuta, a development IDE
* dia, a diagram tool

Games
-----
It contains many free and open source software games. Some of them are ports
of previously released commercial block buster games.

OpenOffice.org 1.0.2
--------------------
Somewhere in 2000, the codebase of StarOffice suite was open sourced into
OpenOffice.org. The 1.0.2 release is the last release in the first stable major
release (1.0.x) that I have managed deploy.

Additional packagers
--------------------
This package set contains tools to manage a variety of archive types:

* arc
* arj
* CAB (extraction only)
* lha
* rar (unrar only)

WINE and binfmt_misc plugin
---------------------------
This package set contains WINE to run Windows executables and a plugin for the
`binfmt_misc` loader so that Windows executables can be executed in a similar
way as native ELF and a.out executables.

License
=======
This distribution is [BSD licensed](./COPYING). It uses the same license that
Linux from Scratch uses.
