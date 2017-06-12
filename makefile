## Nome do arquivo principal
DOCUMENT = relatorio

## Pasta onde os arquivos compilados são enviados
OUTPUT = out

MAIN_TEX = $(DOCUMENT).tex
MAIN_AUX =$(OUTPUT)/$(DOCUMENT).aux

all: out compile
	@echo "Creating Pdf file"
	@cp out/relatorio.pdf ./relatorio.pdf
	@echo "Cleaning project..."
	@rm -rf out

compile: $(MAIN_TEX)
	@echo "Adding references"
	@pdflatex -output-directory=out $^
	@echo "Compiling LaTeX"
	@bibtex $(MAIN_AUX)
	@pdflatex -output-directory=out $^

out:
	@mkdir -p out

clean:
	@echo "Cleaning project..."
	@rm -rf out
	@rm -f relatorio.pdf