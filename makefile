PWD=`pwd`
INCLUDE=$(PWD)/libs

all: out
	@echo "Compiling LaTeX"
	@pdflatex -output-directory=out relatorio.tex > /dev/null
	@echo "Creating Pdf file"
	@cp out/relatorio.pdf ./relatorio.pdf
	@echo "Cleaning project..."
	@rm -rf out

out:
	@mkdir -p out

clean:
	@echo "Cleaning project..."
	@rm -rf out
	@rm -f relatorio.pdf