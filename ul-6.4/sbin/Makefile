PREFIX = /usr

INSTALL = install

SCRIPTS=ul-adduser \
	ul-alsa \
	ul-bootstrap \
	ul-cfgdms \
	ul-console \
	ul-firewall \
	ul-fstab \
	ul-gpm \
	ul-grub \
	ul-init \
	ul-locale \
	ul-network \
	ul-setup \
	ul-stage2 \
	ul-stage3 \
	ul-timezone \
	ul-update-xdg-menu \
	ul-utc \
	ul-xdg-menu \
	ul-xdm \
	ul-xinit

install:
	install -m754 $(SCRIPTS) $(PREFIX)/sbin

uninstall:
	cd $(PREFIX)/sbin
	rm -f $(SCRIPTS)
