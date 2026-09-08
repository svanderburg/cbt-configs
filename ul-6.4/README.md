UL-Linux distribution version 6.4
=================================
This package contains scripts to deploy a version of my own custom Linux
distribution: *UL-Linux*, from source code.

UL-Linux is based on [Linux from Scratch (LFS)](http://linuxfromscratch.org)
and should be deployed with my custom developed software construction tool:
the Conservative Build Tool (CBT). This version of the distribution is
constructed by following the instructions from the 6.4 version of the LFS book.

There is hardly any reason to use this Linux distribution nowadays -- it mostly
contains old and obsolete packages. The main motivation for me to publish it and
keep it around is because I find it useful for *retro computing* and
*archeology* purposes. The most appropriate way to describe this Linux
distribution is that it is an "interactive historical museum".

If you want to enjoy a 2008-2010 Linux experience (e.g. on an old retro
computer, or in an emulator/virtualizer such as PCem of VirtualBox) and you want
the ability to work with the source code of nearly all Linux distribution parts
(e.g. for study or modification) then this project may be somewhat useful.

The meaning of UL-Linux
-----------------------
What does "UL" stand for? I really don't know for sure :-)

The 'L' probably refers to Linux and the 'U' to something ambiguous. It may
refer to "Ultimate" because it gives you full control over the components in a
Linux system including the underlying source code. It may also refer to
"Unusable" because the distribution is very advanced and you could easily get
lost in all possible configuration options, including invalid ones. :-)

Prerequisites
=============
To deploy this Linux distribution, you need to bootstrap it from an existing
Linux installation.

Linux from Scratch can be bootstrapped from a variety of existing Linux
distributions. For this version, I believe the Linux installation must meet the
following requirements:

* It needs glibc 2.2.x or newer
* You need to install all packages required to build C/C++ packages from source
  code, such as GNU Binutils, GCC, glibc, GNU Make, and GNU Bash from your host
  Linux distribution's package set
* You must install the Conservative Build Tool (CBT)

I have used Slackware 13.1 as a bootstrap distribution and it works fine for me.

Installation
============
If the above criteria were met, create a checkout of the UL-Linux code in a
directory on your bootstrap Linux distribution installation.

Unpacking the source tarball
----------------------------
You must extract the UL-Linux CBT scripts tarball in a directory that is
publicly readable. For example, `/usr/src/ul-6.4` is a good location.

Mounting the target partition
-----------------------------
We need a separate hard drive partition to install the distribution to. You must
create the following mount point (`/mnt/lfs`):

```bash
mkdir -p /mnt/lfs
```

You probably want to initialize the filesystem on the partition (assuming that
the partition's device is `/dev/sda7` and that you want to use the `ext3` file
system):

```bash
mkfs.ext3 /dev/sda7
```

and mount it to the mount point:

```bash
mount /dev/sda7 /mnt/lfs
```

Mounting a source medium
------------------------
The bootstrap script expects the source installation medium (e.g. a CD-ROM) to
be mounted on: `/mnt/lfs/mnt/source`.

Create the mount point directory as follows:

```bash
mkdir -p /mnt/lfs/mnt/source
```

and mount the installation medium (e.g. a CD-ROM: `/dev/cdrom`) as follows:

```bash
mount /dev/cdrom /mnt/lfs/mnt/source
```

Creating a CBT configuration
----------------------------
You must create a configuration file for CBT:

```bash
mkdir -p /mnt/lfs/etc/cbt
cat > /mnt/lfs/etc/cbt/cbt << "EOF"
# deployPackage settings
builderUser=lfs
builderGroup=lfs
packageType=slackware
EOF
```

Starting the bootstrap procedure
--------------------------------
The next step is starting the bootstrap procedure with the following command:

```bash
./sbin/ul-bootstrap
```

The above command invokes CBT to carry out the construction of all required
packages to set up a bare bones Linux installation, including bootstrapping all
required packages. This will take a while.

The bootstrap procedure consists of two stages:
* stage1 creates a minimal bootstrap system in `$LFS/tools` using the host
  system's tools containing all required build tools and command-line utilities
  to construct a system from scratch
* stage2 opens a chroot environment and builds all tools and libraries from
  scratch using the bootstrap system

Configuring the Linux kernel
----------------------------
At the end of the bootstrap procedure, you must configure the Linux kernel to
have the right features for your target system. The bootstrap script uses the
`make menuconfig` feature in the Linux kernel source code tree to do this.

You can find some example kernel configuration descriptions in this
[documentation folder](./doc/kernel-config-examples).

Initial setup steps
-------------------
The last step in the bootstrap procedure is to set up some configuration aspects
through the interactive setup tool (`ul-setup`), such as the keyboard layout,
filesystems, and timezone.

The setup program also allows you to install the GRUB bootloader. If you are
sure that your configuration is stable, you probably want to use this feature,
but if you are not, then it is best to skip it and configure GRUB at a later
point in time.

A safer route is to copy the kernel to your host Linux distribution and add
a new bootloader entry to your host system's boot loader configuration to boot
into the LFS system.

On Slackware 13.1, I can copy the kernel to my boot partition as follows:

```bash
cp /mnt/lfs/boot/lfskernel-2.6.27.57 /boot
```

and add the following entry to my Slackware's LILO configuration
(`/etc/lilo.conf`):

```
image = /boot/lfskernel-2.6.27.57
  root = /dev/sda7
  label = UL-6.4
  read-only
```

and update the bootloader with:

```bash
lilo
```

Booting into the new distribution
---------------------------------
The next step is rebooting the system and booting into your new Linux
configuration.

Finalizing the package deployment
---------------------------------
Log in as `root` user. Then finalize the installation with the following
command:

```bash
ul-stage3
```

The above command executes stage 3 that reinstalls all stage 2 packages with
`checkinstall` so that the Slackware package manager can manage their
installations.

Installing additional packages
------------------------------
After completing the stage 3 procedure you have a bare bones Linux installation
at your disposal. Most likely you want to deploy additional packages to do
something useful, such as desktop environments, additional utilities, drivers
and productivity software.

The UL source code tree contains another sequence (`ul-packages`) containing
many additional, optional packages.

After bootstrapping the system, a copy of the UL-Linux repository can be found by
opening:

```bash
cd /usr/src/ul-6.4
```

Scripts in the `ul-packages` sequence are optional. You need to select the
scripts that you want to be executed. You can open a selector as follows:

```bash
cbt-cfg-seq sequences/ul-packages
```

and run the selected scripts in the sequence as follows:

```bash
cbt-run-seq sequences/ul-packages
```

Features
========
UL-Linux 6.4 has a variety of interesting features demonstrating the
capabilities of Linux systems commonly used between 2008-2010. This section
highlights some of them.

Based on Linux from Scratch 6.4
-------------------------------
As already explained, the core of this distribution is based on version 6.4 of
the Linux from Scratch book.

Linux kernel
------------
This distribution uses version 2.6.27.57 of the Linux kernel. This kernel is an
LTS release and is still compatible with the proprietary NVIDIA display driver
version still supporting their earliest graphics cards, such as the NVIDIA RIVA
TNT2.

Package manager
---------------
The default package manager that this distribution uses is the Slackware
package manager. Although this package manager is primitive from a feature
perspective, e.g. it does not have a notion of dependencies, the reason why it
was selected is because it only relies on a shell and some common command-line
utilities to make it work.

More advanced package managers, such as RPM, have more complex dependencies
making the bootstrap of a Linux distribution more complicated.

It is easy to use the Slackware package manager in the construction process of
the distribution. Another tool: checkinstall is used to record file
modifications and conveniently create Slackware packages from each package
installation procedure.

In addition to the Slackware package manager, this distribution also contains
RPM as an optional package that can be used alongside the default package
manager.

Build toolchain
---------------
Since the distribution is deployed from source, the GNU build toolchain is one
of its prominent features. This version of the distribution provides binutils
2.18, GCC 4.3.6, and glibc 2.8.

GCC is deployed with most language extensions enabled: C, C++, Objective C,
Fortran 95, Java.

Shells
------
By default GNU Bash is provided as an interactive command-line shell, but the
distribution also includes `tcsh` that can be used as an alternative shell using
a different syntax.

I have also included the Debian Almquist Shell (`dash`), which is a
Bourne-compatible shell with no extra features having a very light memory and
storage footprint.

The main motivation to include `dash` is to use it as a development tool for
testing whether shell scripts are POSIX / Bourne shell compatible, not as an
interactive or login shell, but it can still be used as such, if desired.

For all the shells a proper environment has been set up so that they can be used
without too much trouble.

Display systems
---------------
This distribution includes a number of display systems. Most prominently, it
includes X.Org 7.3.

Furthermore, it includes:
* aalib, which renders graphics as ASCII Art
* libcaca, which renders graphics as colored ASCII Art
* svgalib which directly talks to SVGA-compatible hardware
* DirectFB which is an abstraction built over the kernel's framebuffer
  infrastructure

Some applications and libraries can also use the above display systems in
addition to (or as a replacement for) X.Org. SDL supports multiple video
backends and has support for all these options. MPlayer also supports the above
outputs.

Window managers
---------------
There are a number of simple window managers included:

* TWM (Tab Window Manager) which is included as a primitive example window
  manager with the XFree86 distribution.
* MWM (LessTif/Motif Window Manager) which is included with Lesstif, a
  Motif-compatible GUI toolkit implementation
* fvwm95 is included to provide a simple desktop experience. In combination
  with simple X11 applications, such as xfm, xpaint, xfig and xpdf, you can have
  a decent desktop experience on low-end (retro-)computers
* WindowMaker provides a desktop experience comparable to NeXTSTEP. Some
  simple applications that are developed for WindowMaker are included, such
  `FSViewer.app` (a file manager) and `wmtime` (a time widget).

Desktop environments
--------------------
In addition to simple window managers, two fully featured desktop environments
are included:

* KDE 3.5.10 which is the latest version in the 3.x series
* GNOME 2.32.1 which is the latest version in the 2.x series. It includes almost
  all functionality. A few exceptions are cheese, gnome-color-manager, and the
  gnome-disk-utility and their dependencies. These packages rely on a newer
  version of `udev` including `libgudev`, which is not compatible with the
  included versions of the Linux kernel headers, HAL and X.Org server.

Display managers
----------------
By default, an installation uses runlevel 3 that provides a textual login. It
is also possible to pick a display manager and switch to runlevel 5, that
facilitates graphical logins.

There are multiple display managers supported:

* `XDM` is a display manager included with the X.Org distribution
* `KDM` is a display manager included with KDE and primarily developed to start
  KDE sessions
* `GDM` is a display manager included with GNOME and primarily developed to
  start GNOME sessions
* `WDM` is a display manager using the WINGs GUI toolkit included with
  WindowMaker and primarily developed to start WindowMaker sessions

XDM is only capable of starting one kind of session type. Although the other
display managers are primarily developed for one specific desktop type, they
also have the ability to launch multiple kinds of desktop sessions.

In this Linux distribution, I have included a tool called: `ul-cfgdms` that
makes it possible to configure the display managers in such a way that it
becomes possible to launch any kind of window manager and desktop environment
that is supported on the system.

As a result of using this tool, it is also possible, for example, to boot into
GNOME using KDM, or to conveniently switch from a KDE session to a GNOME or
WindowMaker session, which is really useful for experimenting with multiple
window managers and desktop environments at the same time.

Server software
---------------
This distribution includes a number of server software packages, such as:

* Sendmail (an SMTP server)
* Samba (an SMB/CIFS server)
* OpenSSH (an SSH/SFTP server)
* OpenLDAP (an LDAP server)
* NFS (an NFS server)
* Apache HTTP server 1.3 (an HTTP server)
* ProFTPd (an FTP server)
* rsync (a file exchange service)

It also includes xinetd that acts as an Internet "super server". Within xinetd
you can enable even more services:

* CVS pserver
* Subversion server (using the Subversion protocol)
* Trivial Internet services: telnet, tftp, talk, ntalk

I do not really have nostalgic feelings towards running old versions of server
software so I am trying to keep the amount of these packages minimized.

Server software packages are included in this distribution for two reasons:

* They may be dependencies of packages that are useful, not because the server
  software itself is. For example, `sendmail` is included because some programs
  e.g. KMail can use it directly as an MTA. Samba is included because Midnight
  Commander and Konqueror can use its client library to browse network shares.
* Some server software is still useful, for example for file exchange (ProFTPd,
  rsync, and the Apache HTTP server) or to remotely administer the machine
  (OpenSSH). You may want to use these packages to connect from your host
  machine to a guest virtual machine (running UL-Linux).

Although not all server packages are useful on their own, I do not want to
restrict the ability to use them since they are included in the distribution
anyway. As a result, you can easily enable them.

Since most packages in this distribution are old, it is imperative that you
are careful with them. Do not use them in production environments or connect
these services to the Internet! They are not safe to use, as they most likely
contain security-related bugs! You have been warned!

Terminal connection support
---------------------------
In addition to networked software, this distribution also makes it possible
to set up a terminal connection (with `agetty`) and use `minicom` as a terminal
client. It also includes `lrzsz` to facilitate X/Y/ZMODEM file transfers.

Network clients
---------------
This distribution also includes various kinds of network clients:

### Browsers

* lynx. A textual Internet browser.
* Mozilla Firefox 3.6.28. This version is the last release in the 3.x series.
  Firefox 3.x is a prominent milestone and passes the Acid2 test.
* Konqueror (as part of KDE)

### Other network clients

* ncftp. An FTP client
* curl. A multi-protocol download client
* wget. A multi-protocol download client

Development facilities
----------------------
In addition to the GNU build toolchain, this distribution provides more
development facilities.

### Development tools

Various kinds of development tools: GNU Debugger (gdb), strace, valgrind,
Data Display Debugger (DDD), rcs, cvs, subversion, git, KDevelop

### Programming languages

In addition to the programming languages supported by GCC, GNU bash, `tcsh` and
`dash`, it also provides:

* Perl 5.10.1
* Python 2.6.2
* Guile 1.8.8 (a Scheme compatible interpreter)
* Java 1.6.0_45
* bc 1.0.6 (a numeric processing language)
* S-Lang (scripting language for creating text-based applications)
* Tool Command Language (tcl) version 8.5.5
* C# (through Mono)
* OCaml
* Ruby

Misc binary format support
--------------------------
Another interesting (and somewhat niche) feature of this Linux distribution is
that it easily enables the support for miscellaneous binary executable formats
(by using the Linux kernel's `binfmt_misc` module).

For example, if you install the Java SDK then a plugin can be installed
alongside the package that configures the `binfmt_misc` module in such a way
that Java class files, executable JAR files and HTML files with `<applet>` tags
can be executed as executables (if the files' executable permissions are set).

Also CLR (.NET) executable assemblies (`*.exe` files) are recognized through the
`binfmt_misc` loader.

Other software packages
-----------------------
There are more kinds of useful software packages in this distribution

### Editors

* vim
* GNU Emacs
* mcedit (included with Midnight Commander)
* kwrite (included with KDE)
* kate (included with KDE)
* gedit (included with GNOME)
* xedit (included with X.Org)

### Players

* MPlayer 1.0rc3 (plus various codecs and the KMPlayer front-end)
* Audacious 2.4.5

### Productivity

* GIMP 2.6.12
* KOffice 1.6.3
* TeTeX (with supplemental utilities, e.g. `aspell`, `ghostscript` etc.)

Acknowledgments
===============
To create this Linux distribution, I have consulted a variety of resources:

* Linux from Scratch version 6.4.

* I came up with the idea to use the Slackware package manager and
  `checkinstall` from the `tgz.txt` hint.

* For a substantial part of packages I used various versions of the Beyond Linux
  from Scratch (BLFS) book as a reference. Most prominently I used version 6.3
  but I also used bleeding-edge development versions between 2008 and 2010.
  Sometimes I adjusted the versions and the build instructions a bit.

Known issues
============
GNOME crashes on startup
------------------------
In VirtualBox when using the VESA display driver, GNOME crashes on startup if
D-Bus is enabled. The reason is the NotificationAreaApplet.

You can disable the service by deleting or moving the following file:
`/opt/gnome2/share/dbus-1/services/org.gnome.panel.NotificationAreaAppletFactory.service`

License
=======
This distribution is [BSD licensed](./COPYING). It uses the same license that
Linux from Scratch uses.

The [binfmt_misc Java plugin](./binfmt_misc-java) is GPLv2 licensed because
it was taken from the Linux kernel source code.
