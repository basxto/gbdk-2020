PKGNAME=gbdk-2020
PKGDIR=$(PKGNAME)

.PHONY:
build: clean
	make -C .. gbdk-build gbdk-install-nosdcc TARGETDIR=/opt/$(PKGNAME)/ BINDIR=/usr/bin/ SDCCDIR=/usr/
	sed "s/^\(Version: \).*/\1$$(git tag -l 'v*.*' | tail -1 | sed "s/^v//g")/g" -i $(PKGDIR)/DEBIAN/control
	mkdir -p $(PKGDIR)/usr
	mkdir -p $(PKGDIR)/opt
	mv ../build/gbdk/bin $(PKGDIR)/usr/
	mv ../build/gbdk $(PKGDIR)/opt/$(PKGNAME)
	find /opt/$(PKGNAME)/ -type f -name '*.bat' -delete
	dpkg-deb --build $(PKGDIR)

.PHONY:
clean:
	rm -rf $(PKGDIR)/usr $(PKGDIR)/opt
