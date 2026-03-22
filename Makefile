all: clean en zh

en: cv.typ metadata.toml
	mkdir -p output
	typst compile cv.typ output/resume-en.pdf

zh: cv.typ metadata.toml
	mkdir -p output
	typst compile --input language=zh cv.typ output/resume-zh.pdf

watch-en:
	typst watch cv.typ output/resume-en.pdf

watch-zh:
	typst watch --input language=zh cv.typ output/resume-zh.pdf

clean:
	rm -f output/*.pdf
