% Identification
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{simple-cv}[2021/05/30 Simple CV class]

% Class options
% Inherit options of article
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}
}
\ProcessOptions\relax
\LoadClass{article}

% Packages
\RequirePackage[margin=1.5cm]{geometry}         % Margin
\RequirePackage{lastpage}                       % Page numbering
\RequirePackage[english]{babel}                 % Language styles
\RequirePackage{graphicx}                       % Importing graphics

% Define colors
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
\RequirePackage{fontspec}                       % Fonts and Unicode
\setmainfont{SourceSerif4}[
    Path=./fonts/source-serif/,
    Ligatures=TeX,
    UprightFont=*-Regular, ItalicFont=*-It,
    BoldFont=*-Bold, BoldItalicFont = *-BoldIt
]
\newfontfamily\lightmainfont{SourceSerif4}[
    Path=./fonts/source-serif/,
    Ligatures=TeX,
    UprightFont=*-Light, ItalicFont=*-LightIt,
    BoldFont=*-Semibold, BoldItalicFont=*-SemiboldIt
]
\setsansfont{SourceSans3}[
    Path=./fonts/source-sans/,
    Ligatures=TeX,
    UprightFont=*-Regular, ItalicFont=*-It,
    BoldFont=*-Bold, BoldItalicFont = *-BoldIt
]
% Enable this to use sans-serif by default instead of serif
% \renewcommand{\familydefault}{\sfdefault}

% Page styling
\raggedbottom
\raggedright

% Header and footer formatting (fancyhdr)
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
\fancyhf{}
\fancyfoot[R]{
    \small
    Page \thepage\ of \pageref{LastPage}}
\fancyfoot[L]{
    \small
    \ifthenelse{\value{page}=\pageref{LastPage}}
    {Last updated: {\today}}
    {}
}

% Section title styling (titlesec)
\RequirePackage{titlesec}
\titleformat{\section}
    {\scshape\Large\color{color-title}}
    {}{0pt}{}
    [\titlerule]
% default:
% {3.5ex plus 1ex minus .2ex}{2.3ex plus .2ex}
\titlespacing{\section}
    {0pt}
    {3.5ex plus 1ex minus .5ex}
    {1ex plus .2ex minus .2ex}

% Quotes
\RequirePackage[autostyle,english=american]{csquotes}
\MakeOuterQuote{"}

% Hyperlinks
\RequirePackage[hidelinks]{hyperref}
\urlstyle{same}
\newcommand{\link}[2]{\href{#1}{#2}}

% Date and time format
\RequirePackage[yyyymmdd,24hr]{datetime}
\renewcommand{\dateseparator}{-}

% Shorthand
\newcommand{\email}[1]{\href{mailto:#1}{#1}}
\newcommand{\detail}{\color{color-detail}}
\newcommand{\fillyear}[1]{\phantom{#1}}         % Fill year

% Dummy environment
\newenvironment*{dummyenv}{}{}

% Multi-column settings
\RequirePackage{multicol}
\setlength{\columnsep}{12pt}  % default space between columns
\setlength{\multicolsep}{0.5\baselineskip plus 2pt minus 1.5pt}  % default vertical margin

% List customization
\RequirePackage{enumitem}
\newlist{outerlist}{itemize}{2}
\setlist[outerlist]{
    label={},
    leftmargin=0pt,
    labelindent=\parindent,
    itemsep=1ex plus 0.5ex minus 0.5ex,
}

\newlist{denseouterlist}{itemize}{1}
\setlist[denseouterlist]{
    label=\textbullet,
    leftmargin=*,
    labelindent=\parindent,
    parsep=0pt,
    itemsep=2pt,
    % first=\small
}

\newlist{innerlist}{itemize}{1}
\setlist[innerlist]{
    label=\textbullet,
    leftmargin=1.5em,
    topsep=0pt,
    itemsep=0.2ex plus .1ex minus .1ex,
    first=\small
}

% List items
\newcommand{\entrymid}[3]{
    \item #1 \hfill #2\\
    \textit{#3}
}

% Inline heading
\newcommand{\headinginline}[2]{
    \begin{minipage}[t]{0.60\textwidth}
    \vspace*{\fill}
    % \mainlightfont \bfseries
    \Huge \textcolor{color-title}{#1}
    \vspace{5mm}
    \end{minipage}%
    % Make sure there is paragraph break between two minipages
    % Ref: https://tex.stackexchange.com/a/114521
    \begin{minipage}[t]{0.4\textwidth}
    \begin{flushright}
    #2
    \end{flushright}
    \end{minipage}
}

% Photo heading
\newcommand{\headingphoto}[3]{
    \begin{minipage}[t]{0.60\textwidth}

    \vspace*{\fill}
    \begin{dummyenv}
    \Huge \textcolor{color-title}{#1}
    \end{dummyenv}

    \vspace{1.5\baselineskip}
    #2
    \end{minipage}%
    % Align the image at the bottom
    % Ref: https://tex.stackexchange.com/a/132240
    \begin{minipage}[t][][b]{0.4\textwidth}
    \begin{flushright}
    \includegraphics[height=4cm,keepaspectratio]{#3}
    \end{flushright}
    \end{minipage}
}

% Bibliography and styling
\RequirePackage[
    backend=biber,
    style=numeric-comp,
    sorting=ydnt,
    date=year,
    isbn=false,
    url=false,
    doi=true,
    minnames=1,
    maxnames=9
]{biblatex}
% use small font for the bibliography
\renewcommand*{\bibfont}{\normalfont\small}
% style the custom notes (addendum in the biblatex entry) at the end of each reference
\DeclareFieldFormat{addendum}{\lightmainfont\color{color-title}\bfseries\itshape (#1)}
% change the horizontal distance between the numeric label and the reference
\setlength{\biblabelsep}{\labelsep}

% Make author name bold: https://tex.stackexchange.com/a/327046
\newcommand*{\boldname}[3]{%
  \def\lastname{#1}%
  \def\firstname{#2}%
  \def\firstinit{#3}}
\boldname{}{}{}

\renewcommand{\mkbibnamegiven}[1]{%
  \ifboolexpr{ ( test {\ifdefequal{\firstname}{\namepartgiven}} or test {\ifdefequal{\firstinit}{\namepartgiven}} ) and test {\ifdefequal{\lastname}{\namepartfamily}} }
  {\mkbibbold{#1}}{#1}%
}

\renewcommand{\mkbibnamefamily}[1]{%
  \ifboolexpr{ ( test {\ifdefequal{\firstname}{\namepartgiven}} or test {\ifdefequal{\firstinit}{\namepartgiven}} ) and test {\ifdefequal{\lastname}{\namepartfamily}} }
  {\mkbibbold{#1}}{#1}%
}