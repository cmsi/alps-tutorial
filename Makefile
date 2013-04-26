default clean distclean:
	(cd overview && make $@)
	(cd library && make $@)
	(cd tutorial && make $@)
	(cd python && make $@)
	(cd pyalps && make $@)
	(cd matplotlib && make $@)
	(cd alpsize && make $@)
	(cd installation && make $@)
