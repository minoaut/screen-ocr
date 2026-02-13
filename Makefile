PREFIX ?= /usr/local

SOURCES=screen-ocr
PACKAGE_NAME=screen-ocr
PACKAGE_VERSION=0.1.0
COPYRIGHT_HOLDER= minoaut
COPYRIGHT_YEAR=2026

# i18n targets
POTFILE = po/screen-ocr.pot
LANGFILES = $(wildcard po/*.po)


.PHONY: install uninstall test pot update-po install-po uninstall-po

install:
	install -Dm755 screen-ocr $(PREFIX)/bin/screen-ocr
	install -Dm644 screen-ocr.png $(PREFIX)/share/pixmaps/screen-ocr.png
	@mkdir -p $(PREFIX)/share/applications
	sed 's|@PREFIX@|$(PREFIX)|g' screen-ocr.desktop.in > $(PREFIX)/share/applications/screen-ocr.desktop
	$(MAKE) install-po

uninstall:
	rm -f $(PREFIX)/bin/screen-ocr
	rm -f $(PREFIX)/share/pixmaps/screen-ocr.png
	rm -f $(PREFIX)/share/applications/screen-ocr.desktop
	$(MAKE) uninstall-po

test:
	python3 -m unittest discover -s tests

pot:
	@xgettext --language=Python --output=$(POTFILE) --add-comments \
		--keyword=_ \
		--keyword=N_ \
		--keyword=pgettext:1c,2 \
		--package-name=$(PACKAGE_NAME) \
		--package-version=$(PACKAGE_VERSION) \
		--copyright-holder=$(COPYRIGHT_HOLDER) \
		--from-code=UTF-8 \
		--files-from=/dev/null \
		--output=$(POTFILE) \
		$(SOURCES)
	@sed -i \
		-e 's/SOME DESCRIPTIVE TITLE./Screen OCR/' \
		-e 's/# Copyright (C) YEAR/# Copyright (C) $(COPYRIGHT_YEAR)/' \
		-e 's/Package-Id-Version: PACKAGE VERSION/Project-Id-Version: $(PACKAGE_VERSION)/' \
		-e 's/Package-Id-Version: PACKAGE/Project-Id-Version: $(PACKAGE_VERSION)/' \
		-e 's/charset=CHARSET/charset=UTF-8/' \
		$(POTFILE)

update-po: pot
	@for lang in $(shell cat po/LINGUAS); do \
		if [ ! -f po/$$lang.po ]; then \
			msginit --input=$(POTFILE) --output=po/$$lang.po --locale=$$lang --no-wrap; \
		fi; \
		msgmerge -U po/$$lang.po $(POTFILE); \
	done
	@# show fuzzy translations
	@for lang in $(shell cat po/LINGUAS); do \
		po_file="po/$$lang.po"; \
		if [ -f "$$po_file" ]; then \
			echo "Showing fuzzy entries in $$po_file"; \
			msgattrib --only-fuzzy "$$po_file"; \
		fi; \
	done

install-po:
	for lang in $(shell cat po/LINGUAS); do \
		mkdir -p $(PREFIX)/share/locale/$$lang/LC_MESSAGES; \
		msgfmt -o $(PREFIX)/share/locale/$$lang/LC_MESSAGES/screen-ocr.mo po/$$lang.po; \
	done

uninstall-po:
	for lang in $(shell cat po/LINGUAS); do \
		rm -f $(PREFIX)/share/locale/$$lang/LC_MESSAGES/screen-ocr.mo; \
	done

