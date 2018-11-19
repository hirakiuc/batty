NAME=batty
GERBER_DIR=./gerber
ARCHIVE_DIR=./${NAME}

.PHONY: clean
clean:
	rm -rf ${ARCHIVE_DIR}
	rm -f ${NAME}.zip

.PHONY: copy-gerber
copy-gerber: clean
	mkdir ${ARCHIVE_DIR}
	cp ${GERBER_DIR}/${NAME}-F.CU.gbr ${ARCHIVE_DIR}/${NAME}.GTL
	cp ${GERBER_DIR}/${NAME}-B.CU.gbr ${ARCHIVE_DIR}/${NAME}.GBL
	cp ${GERBER_DIR}/${NAME}-F.Mask.gbr ${ARCHIVE_DIR}/${NAME}.GTS
	cp ${GERBER_DIR}/${NAME}-B.Mask.gbr ${ARCHIVE_DIR}/${NAME}.GBS
	cp ${GERBER_DIR}/${NAME}-F.SilkS.gbr ${ARCHIVE_DIR}/${NAME}.GTO
	cp ${GERBER_DIR}/${NAME}-B.SilkS.gbr ${ARCHIVE_DIR}/${NAME}.GBO
	cp ${GERBER_DIR}/${NAME}-PTH.drl ${ARCHIVE_DIR}/${NAME}.TXT
	cp ${GERBER_DIR}/${NAME}-NPTH.drl ${ARCHIVE_DIR}/${NAME}-NPTH.TXT
	cp ${GERBER_DIR}/${NAME}-Edge.Cuts.gbr ${ARCHIVE_DIR}/${NAME}.GML

.PHONY: archive
archive: copy-gerber
	zip -r ${NAME}.zip ${ARCHIVE_DIR}
	@echo "Created ${NAME}.zip"

.PHONY: release
release: clean copy-gerber archive
