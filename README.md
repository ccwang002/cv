# My CV
The CV template is based on [dcetin/Simple-CV] under MIT license, with the notable changes below.

Style changes:
- All elements are aligned to the document margin
- Use normal fontsize instead of small for most elements
- Use custom (sans-)serif font (require XeLaTeX)
- Implement author highlight and co-first author notation through biblatex annotation
- Custom horizontal margins of the list environments
- Show the last update date at the footer of the last page

Technical changes:
- Use `latexmk` to build the document
- CV template is defined through a document class instead of a package
- Consolidate package dependencies
- Prefer original latex syntax over custom commands
- Custom list environments are built by `enumitem` package
- Use `\hfill` instead of `tabular` tables for layout
- Custom vertical margin spaces are set globally; fewer `\vspace` overrides


Fonts in use are included in the repo:

- [Source Serif 4] (SIL Open Font License 1.1)
- [Source Sans 3] (SIL Open Font License 1.1)

[dcetin/Simple-CV]: https://github.com/dcetin/Simple-CV
[Source Serif 4]: https://github.com/adobe-fonts/source-serif
[Source Sans 3]: https://github.com/adobe-fonts/source-sans


### Installation
On macOS:

    brew install basictex
    sudo tlmgr install \
        latexmk \
        biber biblatex biblatex-nature \
        titlesec enumitem lastpage \
        fancyhdr csquotes \
        datetime fmtcount


### Build

    latexmk -xelatex main.tex