PREFIX = /usr

INSTALL = install

SCRIPTS=ul-adduser \
	ul-alsa \
	ul-cfgdms \
	ul-devices \
	ul-firewall \
	ul-fstab \
	ul-gpm \
	ul-init \
	ul-kbd \
	ul-lilo \
	ul-locale \
	ul-network \
	ul-setup \
	ul-stage2 \
	ul-stage3 \
	ul-timezone \
	ul-utc \
	ul-xdm \
	ul-xinit

install:
	install -m754 $(SCRIPTS) $(PREFIX)/sbin

uninstall:
	cd $(PREFIX)/sbin
	rm -f $(SCRIPTS)
