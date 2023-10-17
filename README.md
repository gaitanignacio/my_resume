# My Resume Repository

This repository contains my resume and provides a convenient way to compile and manage it using LaTeX. You can customize and use this structure for your own resume.

## Prerequisites

Before building your resume, ensure you have the following tools installed:

- [MacTeX (No GUI version)](https://www.tug.org/mactex/mactex-no-gui.html) (for macOS users)
- [pdflatex](https://www.tug.org/applications/pdftex/)

## Usage

### Setup

To set up your environment and ensure you have the necessary dependencies, run the following command:

```bash
make setup
```

This command installs MacTeX and checks the version of pdflatex.


### Build The Resume

To build your resume, run the following command:

```bash
make build
```

This command compiles your LaTeX source (defined in the TEX_SOURCE variable) into a PDF file, with the current month and year included in the filename. It also resolves references and citations by running LaTeX twice.

The PDF will be generated in the build/ directory.

### Clean Auxiliary Files

To remove auxiliary files generated during the build process, you can run:

```bash
make clean
```

This command deletes the PDF output, log files, and other temporary LaTeX files.

### Build and Clean

For a one-command solution to build and then clean up auxiliary files, use:

```bash
make all
```

## License

This repository is open-source and available under the [MIT License](LICENSE).

## Acknowledgments

This repository setup was inspired by common LaTeX build practices.