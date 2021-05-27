# My CV
The CV template is based on [dcetin/Simple-CV] under MIT license.

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