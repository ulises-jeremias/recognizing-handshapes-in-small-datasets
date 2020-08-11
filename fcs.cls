\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{fcs}
[2012/01/21 v0.1 Frontier of Computer Science in China LaTeX document class]
\LoadClass[twoside,twocolumn,a4paper]{article}
\RequirePackage{amsmath,amssymb,amsthm,amsfonts,latexsym}
\RequirePackage{txfonts}
\RequirePackage{helvet}
\RequirePackage{courier}
\RequirePackage[mathscr]{eucal}
\RequirePackage[OT2,T1]{fontenc}
\RequirePackage{titlesec}
\RequirePackage{graphicx}
\RequirePackage[usenames]{color}
\RequirePackage{flushend,cuted}
\RequirePackage{cite}
\RequirePackage{wrapfig}
\RequirePackage{calc}

\setlength{\paperwidth}{210truemm}
\setlength{\paperheight}{300truemm}
\setlength{\textwidth}{176truemm}
\setlength{\textheight}{235truemm}
\setlength{\headsep}{6mm}
\setlength{\footskip}{11mm}
\setlength{\headheight}{6mm}
\setlength{\hoffset}{-9mm}
\setlength{\oddsidemargin}{3mm}
\setlength{\evensidemargin}{3mm}

\catcode`@=11
\setlength{\parindent}{4mm}
\setlength{\arraycolsep}{0.5mm}
\setlength{\columnsep}{5mm}

\definecolor{lightblue}{rgb}{0, 0, 0}
\newcommand*{\volumn}[1]{\gdef\@volumn{#1}}
\newcommand*{\doi}[1]{\gdef\@doi{#1}}
\newcommand*{\address}[1]{\gdef\@address{#1}}
\newcommand*{\copynote}[1]{\gdef\@copynote{#1}}
\newcommand*{\ratime}[1]{\gdef\@ratime{#1}}
\newcommand*{\email}[1]{\gdef\@email{#1}}
\newcommand*{\articletype}[1]{\gdef\@articletype{#1}}
\newcommand{\Keywords}[1]{\noindent{\bfseries Keywords}\quad #1}
\newcommand{\xff}{\raisebox{-.05cm}{\includegraphics{xf}}}

\def\ps@first{%
\def\@oddhead{
$\left.
  \begin{array}{l}\\[-0.5mm]
  \hspace*{-2mm}{\rm Front. Comput. Sci. \@volumn}\\
  \hspace*{-2mm}{\rm DOI \@doi}\\
  \end{array}
\right.$
\hfill}
\def\@oddfoot{}
\def\@evenhead{}
\def\@evenfoot{}}

\def\ps@icm{%
\def\@oddhead{\hfill \raisebox{2mm}{\footnotesize\itshape \leftmark} \hfill%
\footnotesize\thepage}
\def\@evenhead{\footnotesize\thepage \hfill \raisebox{2mm}{\footnotesize\itshape \rightmark}%
\hfill}
\def\@oddfoot{}
\def\@evenfoot{}}
\pagestyle{icm}

\renewcommand\maketitle{\par
\begingroup
    \renewcommand\thefootnote{}
    \twocolumn[\@maketitles]%
    \thispagestyle{first}
    \footnote{\hspace*{-0.5cm}\@ratime\\$\overline{\hspace*{86mm}}$\\E-mail: \@email}
    \vspace{-4.5mm}
\endgroup
\setcounter{footnote}{0}}

\def\@maketitles{%
\vspace*{1.5mm}
\hrulefill\vspace{-.5mm}\\
\colorbox{lightblue}{
\arraycolsep=132pt \normalsize\hspace*{-10mm}{\color[cmyk]{.0, 0.0, 0, .0}%
$\begin{array}{l}\\[-3.5mm] \hspace*{-37mm}
\mathbf{\@articletype}
\end{array}$}}\vspace{1mm}\\

\begin{center}
{\LARGE \bfseries \@title}\\[6mm]
{\bfseries \@author}\\[3mm]
\normalsize\@address
\end{center}
\vspace*{12mm}
\noindent\@copynote
\vspace*{10mm}}

\renewenvironment{abstract}{
\noindent{\bfseries Abstract}\quad}{\vspace{1mm}}

%% list
\def\list#1#2{%
\ifnum \@listdepth >5\relax \@toodeep
\else \global \advance \@listdepth\@ne
\fi \rightmargin \z@ \listparindent\z@
\itemindent\z@ \csname @list\romannumeral\the\@listdepth\endcsname
\def\@itemlabel{#1}\let\makelabel\@mklab \@nmbrlistfalse #2\relax
\@trivlist \parskip -\parsep \parindent\listparindent \advance
\linewidth -\rightmargin \advance\linewidth -\leftmargin \advance
\@totalleftmargin \leftmargin \parshape \@ne \@totalleftmargin
\linewidth \ignorespaces}

%% Caption of table and figure
\def\tabletype{table}
\long\def\@makecaption#1#2{%
\ifx\@captype\tabletype
\begin{footnotesize}
\vskip\abovecaptionskip
\sbox\@tempboxa{#2}%
#1\quad
   \global \@minipagefalse
   \hb@xt@\hsize{\box\@tempboxa\hfil}%
\vskip\belowcaptionskip
\end{footnotesize}
\else
\begin{footnotesize}
  \vskip\abovecaptionskip
  \sbox\@tempboxa{{\bfseries #1}\quad{\normalfont #2}}%
  \ifdim \wd\@tempboxa >\hsize
   {\bfseries #1}\quad{\normalfont #2}\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip
\end{footnotesize}
\fi}

%% footnote
\renewcommand\footnoterule{%
\noindent\hrulefill\\[-2mm]
\kern2.6\p@
}
\renewcommand\@makefntext[1]{%
    \parindent 1em%
    \noindent
    \hb@xt@1.8em{\hss\@makefnmark} #1}
\renewcommand{\thefootnote}{\arabic{footnote})}

%% Section
\setcounter{secnumdepth}{4}
\setcounter{subsection}{0}

\renewcommand\theparagraph{\arabic{paragraph}}
\renewcommand\thesection{\arabic{section}}
\renewcommand\thesubsection{\arabic{subsection}}
\renewcommand\thesubsubsection{\arabic{subsubsection}}
\renewcommand{\theequation}{\arabic{equation}}

\titleformat{\section}{%
\vspace*{4mm}%
\titlerule%
\vspace{2mm}%
\normalfont\large\bfseries}{\thesection}{1em}{}[\vspace{-0.5mm}]
\titleformat{\subsection}{\normalfont}{\thesection.\thesubsection}{1em}{}
\titleformat{\subsubsection}{\normalfont}{\thesection.\thesubsection.\thesubsubsection}{1em}{}
\titleformat{\paragraph}{\normalfont}{\thesection.\thesubsection.\thesubsubsection.\theparagraph}{1em}{}[\vspace{-2.5mm}]

%% bibliography
\renewcommand{\refname}{References}
\renewenvironment{thebibliography}[1]
     {\section*{\refname}%
      \renewcommand{\baselinestretch}{1}
      \footnotesize
      \setlength{\baselineskip}{12.8pt}
      \list{\setlength{\labelsep}{8pt}
      \setlength{\topsep}{10bp}%
      \setlength{\partopsep}{5pt}%
      \setlength{\itemsep}{0pt}%
      \setlength{\leftmargin}{\labelwidth+\labelsep}%
      \@arabic\c@enumiv.}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}

%% Acknowledgement
\newcommand{\Acknowledgements}[1]{%
\vspace*{4mm}%
\noindent%
\baselineskip 10.5pt%
\renewcommand{\baselinestretch}{1.05}%
{\footnotesize {\bfseries Acknowledgements}\quad#1}%

\baselineskip 14pt%
\renewcommand{\baselinestretch}{1}}

%% Biogrphy
\newcommand{\Biography}[2]{
\vspace*{4mm}%
\parskip=0mm%
\parindent=1em%
\baselineskip 15pt%
\renewcommand{\baselinestretch}{1.25}%
\normalsize%

\begin{wrapfigure}[9]{l}{3.1cm}\vspace{-2mm}
\includegraphics{#1}
\end{wrapfigure}

\ \vspace{-.3cm}

\noindent\small #2}

\def\qed{\hfill$\Box$}

\renewcommand\figurename{\bfseries Fig.}
\renewcommand\tablename{\bfseries Table}
