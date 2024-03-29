% Identification
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{my-resume}[2023/08/13 My Resume class]

% Class options
% Inherit options of article
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}

% Packages
\RequirePackage[margin=1.5cm]{geometry}         % Margin
\RequirePackage[english]{babel}                 % Language styles
\RequirePackage{graphicx}                       % Importing graphics
\RequirePackage{microtype}                      % Tweak typographics
\microtypesetup{
    activate=true,
    babel=true,
}

% Define colors (xcolor)
\RequirePackage[usenames,dvipsnames]{xcolor}
\definecolor{color-title}{gray}{0.10}   % theme color
\definecolor{color-text}{gray}{0.10}    % light black
\definecolor{color-detail}{gray}{0.40}  % dark gray

% Set default text color
% Ref: https://tex.stackexchange.com/a/26560
\makeatletter
\newcommand{\globalcolor}[1]{
    \color{#1}\global\let\default@color\current@color%
}
\makeatother
\AtBeginDocument{\globalcolor{color-text}}

% Unicode fonts
\RequirePackage{fontspec}

% Page styling
\RequirePackage{ragged2e}  % better ragged controls
% Use raggedright instead of RaggedRight will suppress all hypenations,
% but it leads to better layout in this case.
\raggedright
\raggedbottom

% Header and footer formatting (fancyhdr)
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
\fancyhf{}
\makeatletter%
\fancyfoot[R]{%
    \footnotesize
    \color{color-detail}
    \ifnum\thepage=\@abspage@last%
        Last updated: {\Today}%
    \fi
}
\fancyfoot[L]{}
\makeatother

% Section title styling (titlesec)
\RequirePackage{titlesec}
\newcommand{\defaultsectionstyle}{
    \titleformat{\section}
        {\Large\bfseries\color{color-title}}
        {}{0pt}{}
    % original section spacing is:
    %   {3.5ex plus 1ex minus .2ex}{2.3ex plus .2ex}
    \titlespacing{\section}
        {0pt}  % left
        {2ex}  % before
        {0.5ex}  % after
}
\defaultsectionstyle

% Quotes
\RequirePackage[autostyle,english=american]{csquotes}
\MakeOuterQuote{"}

% Hyperlinks (hyperref)
\RequirePackage[hidelinks]{hyperref}
\urlstyle{same}

% Date and time format (datetime2)
% provide \Today
\RequirePackage[style=iso]{datetime2}

% Multi-column settings (multicol)
\RequirePackage{multicol}
\setlength{\columnsep}{12pt}    % default horizontal space between columns
\setlength{\multicolsep}{0pt}   % default vertical margin

% Custom list customization (enumitem)
% define custom list environments
\RequirePackage{enumitem}
\newlist{entrylist}{itemize}{2}
\setlist[entrylist]{
    label={},
    leftmargin=0pt,
    labelindent=\parindent,
    topsep=0pt,
    parsep=0pt,
    partopsep=0pt,
    itemsep=1ex plus .2ex minus .2ex,
}

\newlist{detaillist}{itemize}{1}
\setlist[detaillist]{
    label=\textbullet,
    leftmargin=1.2em,
    topsep=2pt,
    parsep=0pt,
    partopsep=0pt,
    itemsep=2pt plus 0.5pt minus 0.5pt,
    first=\small,
}


% Bibliography and styling
\RequirePackage[
    backend=biber,
    style=nature,
    sorting=ydnt,
    date=year,
    isbn=false,
    url=false,
    doi=false,
    eprint=false,
    minnames=1,
    maxnames=9
]{biblatex}
% use small font for the bibliography
\renewcommand*{\bibfont}{\normalfont\small}
% change the horizontal distance between the numeric label and the reference
\setlength{\biblabelsep}{\labelsep}
\AtBeginBibliography{\vspace*{-\baselineskip}\vspace*{\topsep}\vspace*{0.5ex}}

% Make author name bold in the reference and add co-first author notation
% This solution is based on the manual annotation approach
% (always work in biblatex v3.13+): https://tex.stackexchange.com/a/561064
\renewcommand*{\mkbibcompletename}[1]{%
    {%
        \ifitemannotation{highlight}{\bfseries}{}%
        #1%
    }%
    \ifitemannotation{co-first}{\textsuperscript{*}}{}%
}

% Add link to DOI in every publication's title
\newbibmacro{link-to-doi}[1]{%
    \iffieldundef{doi}{%
        #1%
    }{%
        \href{https://doi.org/\thefield{doi}}{#1}%
    }%
}
\DeclareFieldFormat[article]{title}%
    {\usebibmacro{link-to-doi}{#1}}
