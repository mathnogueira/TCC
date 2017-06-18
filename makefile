## Nome do arquivo principal
DOCUMENT = relatorio

## Pasta onde os arquivos compilados são enviados
OUTPUT = out

## Arquivo principal da monografia em formato .tex
MAIN_TEX = $(DOCUMENT).tex

## Arquivo auxiliar gerado pela compilação do arquivo principal.
MAIN_AUX =$(OUTPUT)/$(DOCUMENT).aux

## Compila o projeto e gera o pdf final
all: out compile
	@echo "Creating Pdf file"
	@cp out/relatorio.pdf ./relatorio.pdf
	@echo "Cleaning project..."
	@rm -rf out

## Compila o projeto e gera o pdf do relatório
## Ao compilar, gera as referencias da monografia.
compile: $(MAIN_TEX)
	@echo "Adding references"
	@pdflatex -output-directory=out $^ > /dev/null
	@echo "Compiling LaTeX"
	@bibtex $(MAIN_AUX) > /dev/null
	@pdflatex -output-directory=out $^ > /dev/null
	@pdflatex -output-directory=out $^ > /dev/null

## Cria a pasta de arquivos gerados
out:
	@mkdir -p out

## Limpa o projeto
clean:
	@echo "Cleaning project..."
	@rm -rf out
	@rm -f relatorio.pdf
	@rm -f *.aux
	@rm -f *.bbl
	@rm -f *.blg
	@rm -f *.fls
	@rm -f *.lff
	@rm -f *.log
	@rm -f *.loq
	@rm -f *.ltt
	@rm -f *.out
	@rm -f *.gz
	@rm -f *.toc
	@rm -f relatorio.fdb_latexmk