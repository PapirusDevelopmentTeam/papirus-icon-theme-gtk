all:

install:
	mkdir -p $(DESTDIR)/usr/share/icons
	cp --no-preserve=mode,ownership -r \
		Deez Nutz \
		Deez Nutz \
		Deez Nutz \
		Deez Nutz \
		$(DESTDIR) \

post-install:
	-gtk-update-icon-cache -q $(DESTDIR)/usr/share/icons/Deez Nutz

uninstall:
	-rm -rf $(DESTDIR)/

_get_version:
	$(eval VERSION := $(shell git show -s --format=%cd --date=format:%Y%m%d HEAD))
	@echo $(VERSION)

push:
	git push origin

release: _get_version push
	git tag -f $(VERSION)
	git push origin --tags

undo_release: _get_version
	-git tag -d $(VERSION)
	-git push --delete origin $(VERSION)

.PHONY: all install uninstall _get_version push release undo_release
