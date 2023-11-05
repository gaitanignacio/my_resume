# Define the main LaTeX source file (without the .tex extension)
TEX_SOURCE = resume

# Get the current month and year in MM_YYYY format
CURRENT_DATE := $(shell date +'%m_%Y')

# Define the PDF output file with MM_YYYY
PDF_OUTPUT = build/$(TEX_SOURCE)_$(CURRENT_DATE).pdf

# LaTeX compiler
LATEX = pdflatex

# Flags for LaTeX compiler (optional, adjust as needed)
LATEX_FLAGS = -interaction=nonstopmode

OS := $(shell uname)
macOS := Darwin

# Setup
.PHONY: setup
setup:
ifeq ($(OS), $(macOS))
	brew install --cask mactex-no-gui
	pdflatex --version
else
	sudo apt-get update
	sudo apt-get install -y texlive-full
endif

# Default target: build the PDF
.PHONY: build
build:
	$(LATEX) $(LATEX_FLAGS) src/$(TEX_SOURCE)
	$(LATEX) $(LATEX_FLAGS) src/$(TEX_SOURCE)
	# Run LaTeX twice to resolve references and citations
	mv $(TEX_SOURCE).pdf $(PDF_OUTPUT)
	mv *.aux *log *.out logs/

# Clean auxiliary files
.PHONY: clean
clean:
	rm -f $(PDF_OUTPUT) *.log *.aux *.out

# Phony target to build and then clean
.PHONY: all
all: build clean