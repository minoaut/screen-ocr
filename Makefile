build:
	@echo "No build required"

install:
	install -m 755 screen-ocr /usr/bin/
	install -m 644 screen-ocr.png /usr/share/pixmaps/
	install -m 644 screen-ocr.desktop /usr/share/applications/

uninstall:
	rm -f /usr/bin/screen-ocr
	rm -f /usr/share/pixmaps/screen-ocr.png
	rm -f /usr/share/applications/screen-ocr.desktop
