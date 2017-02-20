%
% CUEDthesis v1.1
% By Harish Bhanderi <harish.bhanderi@cantab.net
% Version 1.0 released 15/07/2002
% Version 1.1 released 14/07/2010
%-------------------------- identification ---------------------
%\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{CUEDthesisPSnPDF}[2010/07/14 v1.1 CUED thesis class]
%-------------------------- initial code -----------------------
\newif\ifCU@bookmode
\CU@bookmodetrue

\DeclareOption{report}{\CU@bookmodefalse}
\DeclareOption{book}{\CU@bookmodetrue}
\ProcessOptions\relax%

\ifCU@bookmode
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}%
\ProcessOptions\relax%
\ifx\pdfoutput\undefined%
   \LoadClass[dvips, a4paper]{book}%
\else%
   \LoadClass[pdftex, a4paper]{book}%
\fi%
\else
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}%
\ProcessOptions\relax%
\ifx\pdfoutput\undefined%
  \LoadClass[dvips, a4paper]{report}%
\else%
   \LoadClass[pdftex, a4paper]{report}%
\fi%
%\renewcommand{\refname}{References}%
\fi

%\DeclareOption{book}{%
%}%
\usepackage[latin1]{inputenc} % Permite entrada de tildes
\inputencoding{utf8} % Codificación para que compile las tildes del texto
%\usepackage{hyperref}
\usepackage{setspace}
\usepackage{tocbibind}
\usepackage{amssymb}
\usepackage{fixltx2e} % Muestra el texto en subindice utilizando el comando \textsubscript
%\usepackage{graphicx}
\usepackage{fancyhdr}
\usepackage{multirow}
\usepackage{eucal}
\usepackage[spanish,mexico]{babel}
\usepackage[usenames, dvipsnames]{color}
\usepackage[perpage]{footmisc}
%\usepackage[square, sort, numbers, authoryear]{natbib}
\usepackage{ifthen}
\usepackage{ifpdf}
\usepackage{caption}
\usepackage{amssymb}
\usepackage{lscape}
\usepackage{colortbl}
\usepackage[T1]{fontenc} %Preambulo de notificacion de la fuente Brush Script
\usepackage{pbsi} %Letra Brush Script MT utilizada para el nombre de la universidad en la portada
\usepackage{anyfontsize} %Cambiar el tamaño del nombre de la universidad en la portada (tamaño 20)
\usepackage{pdfpages} % Paquete para ingersar pdf en el documento final. 
\usepackage{booktabs} % Paquete utilizado para modificar estilos de tabla como grosor de linea etc.
\usepackage[usenames]{color} %cambio de color de texto
\usepackage{xcolor} % Color de texto de url por href
\usepackage[normalem]{ulem} % Parametro para delineado usado en modificacion de la URL
\usepackage{footmisc} % Change footnote font.
\usepackage{titlesec} % Used for change chapter title style
\usepackage{pgfgantt} % Used for drawing Gantt charts.
\usepackage{cite} % Used for change cite stile to [a-b]
\usepackage{refcheck} %Used for show the references' keys (dont forget comment on a release or final version). 


%Bibliography
%uncomment next line to change bibliography name to references for Book document class
\renewcommand{\bibname}{Bibliografía}
% note that this doesn't do much if you later define another bibliography style 

%The next line transforms chapter display, can be commented to display as normal book latex style
\titleformat{\chapter}{\normalfont\huge\bf}{\thechapter.}{20pt}{\huge\bf}

%The next line reduce spaces on chapter's title
\titlespacing{\chapter}{0pt}{20pt}{0pt}

%The next line enables to start a chapter on same page
\renewcommand{\cleardoublepage}{}

%The next line disable all page breaks by default
%\renewcommand{\clearpage}{}

% Nomenclature 
\renewcommand{\rmdefault}{phv} % Arial
\renewcommand{\sfdefault}{phv} % Arial
\newenvironment{myfont}{\fontfamily{ptm}\selectfont}{\par}
\usepackage{nomencl}
\makenomenclature
\renewcommand\nomgroup[1]{%
  \ifthenelse{\equal{#1}{A}}{%
   \item[\textbf{Roman Symbols}] }{%             A - Roman
    \ifthenelse{\equal{#1}{G}}{%
     \item[\textbf{Greek Symbols}]}{%             G - Greek
      \ifthenelse{\equal{#1}{R}}{%
        \item[\textbf{Superscripts}]}{%              R - Superscripts
          \ifthenelse{\equal{#1}{S}}{%
           \item[\textbf{Subscripts}]}{{%             S - Subscripts
	    \ifthenelse{\equal{#1}{X}}{%
	     \item[\textbf{Other Symbols}]}{{%    X - Other Symbols
	    \ifthenelse{\equal{#1}{Z}}{%
	     \item[\textbf{Acronyms}]}%              Z - Acronyms
              			{{}}}}}}}}}}

\ifpdf
%-->
%--> Google.com search "hyperref options"
%--> 
%--> http://www.ai.mit.edu/lab/sysadmin/latex/documentation/latex/hyperref/manual.pdf
%--> http://www.chemie.unibas.ch/~vogtp/LaTeX2PDFLaTeX.pdf 
%--> http://www.uni-giessen.de/partosch/eurotex99/ oberdiek/print/sli4a4col.pdf
%--> http://me.in-berlin.de/~miwie/tex-refs/html/latex-packages.html
%-->
    \usepackage[ pdftex, plainpages = false, pdfpagelabels, 
                 pdfpagelayout = OneColumn, % display single page, advancing flips the page - Sasa Tomic
                 bookmarks,
                 bookmarksopen = true,
                 bookmarksnumbered = true,
                 breaklinks = true,
                 linktocpage,
                 pagebackref,
                 colorlinks = true,
                 linkcolor = blue,
                 urlcolor  = blue,
                 citecolor = red,
                 %anchorcolor = green,
                 hyperindex = true,
                 hyperfigures
                 ]{hyperref} 
    %\usepackage[pdftex]{graphicx}
    \DeclareGraphicsExtensions{.png, .jpg, .pdf}

    \pdfcompresslevel=9
    \graphicspath{{ThesisFigs/PNG/}{ThesisFigs/PDF/}{ThesisFigs/}}
\else
    \usepackage[ dvips, 
                 bookmarks,
                 bookmarksopen = true,
                 bookmarksnumbered = true,
                 breaklinks = true,
                 linktocpage,
                 pagebackref,
                 colorlinks = true,
                 linkcolor = blue,
                 urlcolor  = blue,
                 citecolor = red,
                 anchorcolor = green,
                 hyperindex = true,
                 hyperfigures
                 ]{hyperref}


    %\usepackage{epsfig}
    \usepackage{graphicx}
    \DeclareGraphicsExtensions{.eps, .ps}
    \graphicspath{{ThesisFigs/EPS/}{ThesisFigs/}}
\fi

%define the page size including an offset for binding
%\setlength{\topmargin}{0.0in}
%\setlength{\oddsidemargin}{0in}
%\setlength{\evensidemargin}{0in}
%\setlength{\textheight}{700pt}
%\setlength{\textwidth}{500pt}


%A4 settings
\ifpdf
   \pdfpageheight=297mm
   \pdfpagewidth=210mm
\else
   \setlength{\paperheight}{297mm}
   \setlength{\paperwidth}{210mm}
\fi

\setlength{\hoffset}{0.00cm}
\setlength{\voffset}{0.00cm}

\setlength{\evensidemargin}{1.96cm}
%\setlength{\oddsidemargin}{-0.54cm}
\setlength{\topmargin}{1mm}
\setlength{\headheight}{1.36cm}
\setlength{\headsep}{1.00cm}
\setlength{\textheight}{22.00cm}
\setlength{\textwidth}{14.5cm}
\setlength{\marginparsep}{1mm}
\setlength{\marginparwidth}{3cm}
\setlength{\footskip}{1cm}

%Changing URL parameters
%\useunder{\uline}{\ulined}{}%
%\DeclareUrlCommand{\url}{%
%    \def\UrlFont{\color{blue}\ulined}%      Adding blue color and underlining the link
%    }

% SETTING GLOBAL VALUES FOR ALL PAGES
%
% Seting up values for changing white space between caption and tables /
% figures.
\captionsetup{skip=5pt}
% Setting up values for changing white space below caption.
\setlength{\belowcaptionskip}{-25pt}

% SET HEADER AND FOTTER MESSAGES' STRUCTURE
% 
% This section sets the messages that are going to appear for each page
\pagestyle{fancy}
%\renewcommand{\chaptermark}[1]{\markboth{\MakeUppercase{\thechapter. #1 }}{}}
%\renewcommand{\sectionmark}[1]{}
\fancyhf{}
%\fancyhead[RO]{\bfseries\rightmark} % Sets the section title in the rigth header and the page is rigth
%\fancyhead[LE]{\bfseries\leftmark}	% Sets the section title in the rigth header and the page is left
\fancyhead[C]{\@title} % Sets the thesis title in the midle of the header, can make it with \chead{\@title} too
\fancyfoot[RO]{\@university \\ \@researchgroupshortname} % Sets the author in the left of the foter, can make it with \rfoot{\@university \\ \@researchgroupshortname} too.
\fancyfoot[LO]{\@author \ifdefined\@coauthor \\ \@coauthor \fi} % Sets the author in the left of the foter, can make it with \lfoot{\@author} too
\fancyfoot[C]{\thepage} % Sets the page numbers in the midle of the foter
\fancypagestyle{plain}{} % Sets all the pages to the fancy style

% SETTING ENUMERATION FROM NORMAL STYLE TO ONLY NUMBERS
\renewcommand{\labelenumi}{\arabic{enumi}.}
\renewcommand{\labelenumii}{\labelenumi\arabic{enumii}.}
\renewcommand{\labelenumiii}{\labelenumii\arabic{enumiii}.}
\renewcommand{\labelenumiv}{\labelenumiii\arabic{enumiv}.}

\renewcommand{\headrulewidth}{0.5pt}
\renewcommand{\footrulewidth}{0.5pt}
%\addtolength{\headheight}{0.5pt}
%\fancypagestyle{plain}{
%  \fancyhead{}
%  \renewcommand{\headrulewidth}{0pt}
%}
%\chead{\@title}
\newcommand{\submittedtext}{{Anteproyecto de Trabajo de Grado para optar el título de}}
\newcommand{\tutorpreamble}{{\textbf{Director: }}}
\newcommand{\cotutorpreamble}{{\textbf{Codirector: }}}
%
%
% DECLARATIONS
%
% These macros are used to declare arguments needed for the
% construction of the title page and other preamble.

\def\Tiny{ \font\Tinyfont = cmr10 at 3pt \relax  \Tinyfont}
% Research's coauthor
\def\coauthor#1{\gdef\@coauthor{#1}}
% The full (unabbreviated) name of the degree
\def\degree#1{\gdef\@degree{#1}}
% Nombre del director
\def\thesistutor#1{\gdef\@thesistutor{#1}}
% Nombre del codirector
\def\thesiscotutor#1{\gdef\@thesiscotutor{#1}}
% The name of your college
\def\college#1{\gdef\@college{#1}}
% The name of your department
\def\department#1{\gdef\@department{#1}}
% The name of your University
\def\university#1{\gdef\@university{#1}}
% Defining the crest
\def\crest#1{\gdef\@crest{#1}}
% The research group extended line
\def\researchgroupcompletename#1{\gdef\@researchgroupcompletename{#1}}
% The research gruop's name
\def\researchgroupshortname#1{\gdef\@researchgroupshortname{#1}}
% The thesis research line
\def\thesisresearchline#1{\gdef\@thesisresearchline{#1}}

% These macros define an environment for front matter that is always 
% single column even in a double-column document.

\newenvironment{alwayssingle}{%
       \@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
       \else\newpage\fi}
       {\if@restonecol\twocolumn\else\newpage\fi}

%define title page layout
\renewcommand{\maketitle}{%
\pagenumbering{roman} % Sasa Tomic
\setcounter{page}{0}  % Sasa Tomic
\begin{alwayssingle}
    \renewcommand{\footnotesize}{\small}
    \renewcommand{\footnoterule}{\relax}
    %\thispagestyle{empty}
%  \null\vfill
  \begin{center}
    { \LARGE {\bfseries {\@title}} \par}
{\large \vspace*{34mm} {{\@crest} \par} \vspace*{20mm}}
{{{\submittedtext} \par}

%¿Está definida la variable \degree en el .tex principal?
\ifdefined\@degree
	%Si lo está coloquelo
	{\it {\@degree} \par}
\fi


{\large \vspace*{10mm}}
    {{\Large \@author} \par}
%¿Está definida la variable \coauthor en el .tex principal?
\ifdefined\@coauthor
	%Si lo está coloque el preambulo del tutor y el nombre del tutor
	{{\Large \@coauthor} \par}
\fi
	{\large \vspace*{15mm}}
	{{\tutorpreamble}\textbf{{\@thesistutor}} \par}
{\vspace*{0mm}}

%¿Está definida la variable \thesiscotutor en el .tex principal?
\ifdefined\@thesiscotutor
	%Si lo está coloque el preambulo del tutor y el nombre del tutor
	{{\cotutorpreamble}\textbf{{\@thesiscotutor}} \par}
\else
	%Si no lo está solamente agregue el espacio que la variable deja
	{\vspace*{5mm}}
\fi

{\vspace*{20mm}}
	{\fontsize{14}{14}\selectfont {\bsifamily {{\@university}}} \par} %Tipo de fuente de letra: Brush Script MT, tamaño: 20.
{\vspace*{0mm}}
    {{\@college} \par}
{\vspace*{0mm}}
    {{\@department} \par}
{\vspace*{0mm}}
    {{\@researchgroupcompletename} \par}
{\vspace*{0mm}}
    {{\@thesisresearchline} \par}
{\vspace*{0mm}}
    {{\@date} \par}}
  \end{center}
  \null\vfill
\end{alwayssingle}}

% ACKNOWLEDGEMENTS
%
% The acknowledgements environment puts a large, bold, centered 
% "Acknowledgements" label at the top of the page. The acknowledgements
% themselves appear in a quote environment, i.e. tabbed in at both sides, and
% on its own page.

\newenvironment{acknowledgements}
{%\pagestyle{empty}
\pagestyle{fancy}
\begin{alwayssingle}
\begin{center}
\vspace*{1.5cm}
{\Large \bfseries Agradecimientos}
\end{center}
\vspace{0.5cm}
\begin{quote}}
{\end{quote}\end{alwayssingle}}

% The acknowledgementslong environment puts a large, bold, centered 
% "Acknowledgements" label at the top of the page. The acknowledgement itself 
% does not appears in a quote environment so you can get more in.

\newenvironment{acknowledgementslong}
{%\pagestyle{empty}
\pagestyle{fancy}
\begin{alwayssingle}
\begin{center}
\vspace*{1.5cm}
{\Large \bfseries Agradecimientos}
\end{center}
\vspace{0.5cm}\begin{quote}}
{\end{quote}\end{alwayssingle}}

% DEDICATION
%
% The dedication environment makes sure the dedication gets its
% own page and is set out in verse format.

\newenvironment{dedication}
{\begin{alwayssingle}
  \pagestyle{fancy}
  %\pagestyle{empty}
  \begin{center}
  \vspace*{1.5cm}
  {\LARGE \bfseries Dedicatoria}
  \end{center}
  \vspace{0.5cm}
  \begin{quote} \begin{center}}
{\end{center} \end{quote} \end{alwayssingle}}

%ABSTRACT
%
%The abstract environment puts a large, bold, centered "Abstract" label at
%the top of the page. The abstract itself appears in a quote environment,
%i.e. tabbed in at both sides, and on its own page.

\newenvironment{abstracts} {\begin{alwayssingle} %\pagestyle{empty}
  \pagestyle{fancy}
  \begin{center}
  \vspace*{1.5cm}
  {\Large \bfseries Resumen}
  \end{center}
  \vspace{0.5cm}
   \begin{quote}}
{\end{quote}\end{alwayssingle}}

%The abstractlong environment puts a large, bold, centered "Abstract" label at
%the top of the page. The abstract itself does not appears in a quote
%environment so you can get more in.

\newenvironment{abstractslong} {\begin{alwayssingle} %\pagestyle{empty}
  \pagestyle{fancy}
  \begin{center}
  \vspace*{1.5cm}
  {\Large \bfseries  Abstract}
  \end{center}
  \vspace{0.5cm} \begin{quote}}
{\end{quote}\end{alwayssingle}}

%The abstractseparate environment is for running of a page with the abstract
%on including title and author etc as required to be handed in separately

\newenvironment{abstractseparate} {\begin{alwayssingle} %\pagestyle{empty}
  \pagestyle{fancy}
  \vspace*{-1in}
 \begin{center}
    { \Large {\bfseries {\@title}} \par}
    {{\large \vspace*{1ex} \@author} \par}
{\large \vspace*{1ex}
    {{\@collegeordept} \par}
    {{\@university} \par}
\vspace*{1ex}
    {{\it \submittedtext} \par}
    {\it {\@degree} \par}}
  \end{center}}
{\end{alwayssingle}}

% ROMANPAGES
%
% The romanpages environment set the page numbering to lowercase roman one
% for the contents and figures lists. It also resets
% page-numbering for the remainder of the dissertation (arabic, starting at 1).

\newenvironment{romanpages}
{\setcounter{page}{1}
  \renewcommand{\thepage}{\roman{page}}}
{\newpage\renewcommand{\thepage}{\arabic{page}}}
%{\newpage\renewcommand{\thepage}{\arabic{page}}\setcounter{page}{1}}
