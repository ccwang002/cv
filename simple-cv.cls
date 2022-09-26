% Identification
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{simple-cv}[2021/05/30 Simple CV class]

% Class options
% Inherit options of article
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}

% Packages
\RequirePackage[margin=1.5cm]{geometry}         % Margin
\RequirePackage{lastpage}                       % Page numbering
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

% Header and footer formatting (fancyhdr)
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
\fancyhf{}
\fancyfoot[R]{\small Page \thepage\ of \pageref{LastPage}}
\fancyfoot[L]{
    \small \ifthenelse{\value{page}=\pageref{LastPage}}{Last updated: {\Today}}{}
}

% Section title styling (titlesec)
\RequirePackage{titlesec}
\titleformat{\section}
    {\scshape\Large\color{color-title}}
    {}{0pt}{}
    [\titlerule]
% original section spacing is:
%   {3.5ex plus 1ex minus .2ex}{2.3ex plus .2ex}
\titlespacing{\section}
    {0pt}
    {3.0ex plus 1ex minus .2ex}
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
\setlength{\columnsep}{12pt}  % default space between columns
\setlength{\multicolsep}{0pt plus 2pt minus 1.5pt}  % default vertical margin

% Custom list customization (enumitem)
% define custom list environments
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
}

\newlist{innerlist}{itemize}{1}
\setlist[innerlist]{
    label=\textbullet,
    leftmargin=1.5em,
    topsep=0pt,
    itemsep=0.2ex plus .1ex minus .1ex,
    first=\small
}

% Shorthand
\newcommand{\email}[1]{\href{mailto:#1}{#1}}
\newcommand{\detail}{\color{color-detail}}

% Inline heading
\newcommand{\headinginline}[2]{
    \begin{minipage}[t]{0.60\textwidth}
    \vspace*{\fill}
    {\Huge\color{color-title} #1}

    \vspace{5mm}
    \end{minipage}%
    % Make sure there isn't any space between two minipages
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
    {\Huge\color{color-title} #1}

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
% This solution is based on:
%   1. an automatic approach but not always work (define \boldmyname):
%      https://tex.stackexchange.com/a/327046
%   2. manual annotation approach (always work in biblatex v3.13+):
%      https://tex.stackexchange.com/a/561064
\newcommand*{\boldmyname}[3]{%
    \def\myfamilyname{#1}%
    \def\mygivenname{#2}%
    \def\mygiveninitial{#3}}
\boldmyname{}{}{}
\renewcommand*{\mkbibcompletename}[1]{%
    {%
        \ifitemannotation{highlight}{\bfseries}{}%
        \ifboolexpr{ ( test {\ifdefequal{\mygivenname}{\namepartgiven}} or test {\ifdefequal{\mygiveninitial}{\namepartgiven}} ) and test {\ifdefequal{\myfamilyname}{\namepartfamily}} }%
        {\bfseries}{}%
        #1%
    }%
    \ifitemannotation{co-first}{\textsuperscript{*}}{}%
}
