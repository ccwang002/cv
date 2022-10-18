% Identification
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{my-resume}[2022/10/16 My Resume class]

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
\raggedbottom
\raggedright

% Section title styling (titlesec)
\RequirePackage{titlesec}
\titleformat{\section}
    {\Large\bfseries\color{color-title}}
    {}{0pt}{}
% original section spacing is:
%   {3.5ex plus 1ex minus .2ex}{2.3ex plus .2ex}
\titlespacing{\section}
    {0pt}
    {5ex plus 1ex minus .2ex}
    {1ex plus .2ex minus .2ex}

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
\newlist{outerlist}{itemize}{2}
\setlist[outerlist]{
    label={},
    leftmargin=0pt,
    labelindent=\parindent,
    itemsep=1ex minus 0.25ex,
    parsep=0ex,
}

\newlist{denseouterlist}{itemize}{1}
\setlist[denseouterlist]{
    label=\textbullet,
    leftmargin=*,
    labelindent=\parindent,
    parsep=0pt,
    itemsep=2pt,
}

\newlist{innerlist}{itemize}{1}
\setlist[innerlist]{
    label=\textbullet,
    leftmargin=1.5em,
    topsep=0pt,
    itemsep=1pt minus 0.5pt,
    parsep=0pt,
    first=\small
}


% Bibliography and styling
\RequirePackage[
    backend=biber,
    style=nature,
    sorting=ydnt,
    date=year,
    isbn=false,
    url=false,
    doi=true,
    eprint=false,
    minnames=1,
    maxnames=9
]{biblatex}
% use small font for the bibliography
\renewcommand*{\bibfont}{\normalfont\small}
% change the horizontal distance between the numeric label and the reference
\setlength{\biblabelsep}{\labelsep}

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
