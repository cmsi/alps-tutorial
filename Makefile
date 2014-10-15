default clean distclean:
	(cd overview && make $@)
	(cd installation && make $@)
	(cd tutorial && make $@)
	(cd python && make $@)
	(cd pyalps && make $@)
	(cd matplotlib && make $@)
	(cd alpsize && make $@)
