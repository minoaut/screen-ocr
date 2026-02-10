PREFIX ?= /usr/local

.PHONY: install uninstall test

install:
	install -Dm755 screen-ocr $(PREFIX)/bin/screen-ocr
	install -Dm644 screen-ocr.png $(PREFIX)/share/pixmaps/screen-ocr.png
	@mkdir -p $(PREFIX)/share/applications
	sed 's|@PREFIX@|$(PREFIX)|g' screen-ocr.desktop.in > $(PREFIX)/share/applications/screen-ocr.desktop

uninstall:
	rm -f $(PREFIX)/bin/screen-ocr
	rm -f $(PREFIX)/share/pixmaps/screen-ocr.png
	rm -f $(PREFIX)/share/applications/screen-ocr.desktop

test:
	python3 -m unittest discover -s tests

