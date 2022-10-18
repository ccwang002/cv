# My CV and Resume

## My CV
The CV template is based on [dcetin/Simple-CV] under MIT license, with modifications below.

Style changes:
- All elements are aligned to the document margin
- Use normal fontsize instead of small for most elements
- Use custom (sans-)serif font (require LuaLaTeX)
- Implement author highlight and co-first author notation through biblatex annotation
- Define custom horizontal margins of the list environments
- Show the last update date at the footer of the last page

Technical changes:
- Define CV template through a document class instead of a package
- Consolidate package dependencies
- Prefer original latex syntax over custom commands
- Custom list environments are built by `enumitem` package
- Layout by `\hfill` instead of `tabular` environment
- Set custom vertical margin spaces globally; fewer `\vspace` overrides
- Use `microtype` package to tweak text kerning and spacing
- Use `latexmk` to build the document
- Set up GitHub Workflow to automatically build the PDF

[dcetin/Simple-CV]: https://github.com/dcetin/Simple-CV


## My Resume
My resume is inspired from [sansquoi/PlushCV] under Apache License 2.0.

[sansquoi/PlushCV]: https://github.com/sansquoi/PlushCV


## Dependencies
Fonts in use are included in the repo:

- [Source Serif 4] (SIL Open Font License 1.1)
- [Source Sans 3] (SIL Open Font License 1.1)

[Source Serif 4]: https://github.com/adobe-fonts/source-serif
[Source Sans 3]: https://github.com/adobe-fonts/source-sans


## Installation
On macOS:

    brew install basictex
    sudo tlmgr install \
        latexmk \
        biber biblatex biblatex-nature \
        titlesec enumitem lastpage \
        fancyhdr csquotes \
        datetime2 datetime2-english \
        tracklang fmtcount


## Build
Build both documents by LuaLaTeX.
It may work on XeLaTeX as well but untested.

    latexmk -lualatex cv.tex resume.tex

To clean up the intermediates build files:

    latexmk -c
    latexmk -C  # also remove the compiled documents

This template also sets up a GitHub Workflow that automatically builds PDF online when the status of this badge says passing: [![Build LaTeX PDF status](https://github.com/ccwang002/cv/actions/workflows/build_latex.yml/badge.svg)][workflow-status].


[workflow-status]: https://github.com/ccwang002/cv/actions
