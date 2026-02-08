.PHONY: test build install uninstall

build:
	@echo "No build required"

test:
	python3 -m unittest discover -s tests
	
install:
	install -m 755 screen-ocr /usr/bin/
	install -m 644 screen-ocr.png /usr/share/pixmaps/
	install -m 644 screen-ocr.desktop /usr/share/applications/

uninstall:
	rm -f /usr/bin/screen-ocr
	rm -f /usr/share/pixmaps/screen-ocr.png
	rm -f /usr/share/applications/screen-ocr.desktop
