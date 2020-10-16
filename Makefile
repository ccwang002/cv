XELATEX := xelatex

CV_LATEST := CV
CV_PDF := $(CV_src:=.pdf)

.PHONY: all
all: CV clean

CV: $(CV_LATEST).tex
	$(XELATEX) $(<)
	$(XELATEX) $(<)

.PHONY: clean
clean:
	rm $(CV_LATEST).{aux,log,out}

install:
	sudo tlmgr install \
		hypernat hyphenat \
		enumitem datetime fmtcount \
		rsfs \
		biber biblatex \
		pgfopts logreq xstring
