all: clean en zh

en: cv.typ metadata.toml
	mkdir -p output
	typst compile cv.typ output/resume-en.pdf

zh: cv.typ metadata.toml
	mkdir -p output
	typst compile --input language=zh cv.typ output/resume-zh.pdf

billryan-en: cv-billryan.typ metadata.toml
	mkdir -p output
	typst compile cv-billryan.typ output/resume-billryan-en.pdf

billryan-zh: cv-billryan.typ metadata.toml
	mkdir -p output
	typst compile --input language=zh cv-billryan.typ output/resume-billryan-zh.pdf

billryan: clean billryan-en billryan-zh

watch-en:
	typst watch cv.typ output/resume-en.pdf

watch-zh:
	typst watch --input language=zh cv.typ output/resume-zh.pdf

watch-billryan-en:
	typst watch cv-billryan.typ output/resume-billryan-en.pdf

watch-billryan-zh:
	typst watch --input language=zh cv-billryan.typ output/resume-billryan-zh.pdf

clean:
	rm -f output/*.pdf
