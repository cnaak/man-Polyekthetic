PREF=2020-NaaktgeborenC-Polyekthetic

clean:
	for EXT in log aux blg bbl out toc info; do \
		rm -vf ${PREF}.$$EXT; \
	done

wipe: clean
	rm -vf cc/*pdf

cc/%.pdf: cc/%.svg
	inkscape \
		--export-pdf-version=1.4 \
		--export-filename=$@ \
		$<

fig/%.pdf: fig/%.svg
	inkscape \
		--export-pdf-version=1.4 \
		--export-filename=$@ \
		$<

${PREF}.pdf: ${PREF}.tex 0*tex \
		cc/by.pdf \
		bibfile.bib
	pdflatex --enable-write18 ${PREF}.tex
	bibtex ${PREF}
	pdflatex --enable-write18 ${PREF}.tex
	pdflatex --enable-write18 ${PREF}.tex

