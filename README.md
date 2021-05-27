# My CV
The CV template is based on [dcetin/Simple-CV] under MIT license.

[dcetin/Simple-CV]: https://github.com/dcetin/Simple-CV


### Installation
On macOS:

    brew install basictex
    sudo tlmgr install \
        latexmk \
        biber biblatex biblatex-nature \
        titlesec enumitem lastpage \
        fancyhdr csquotes


### Build

    latexmk -xelatex main.tex