% *****************************************************************************
% Copyright 2025 ULFPP

% Author: Aleksander Sandro GRM @fpp.uni-lj.si
% Description: This is an official latex ULFPP thesis class template.
% Version: 1.0
% Date: 22/11/2025
%
% 
% !!! POMEMBNO: class je narejen za prevajanje z pdflatex ukazom !!!
%
% *****************************************************************************
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{fppthesis}[2025/11/21 Zaključno delo na FPP]

% *****************************************************************************
% Nalaganje dodatnih paketov *** 
% *****************************************************************************

\RequirePackage{iftex} % Detect compile engine; if pdflatex
\ifPDFTeX
	\RequirePackage[T1]{fontenc}
	\RequirePackage[utf8]{inputenc}
	\RequirePackage{lmodern}
\fi
% **********************************
\RequirePackage{etoolbox}
\RequirePackage{ifthen}
\RequirePackage{kvoptions}
\RequirePackage{makeidx}
\RequirePackage{setspace}
\RequirePackage{tabularray}
\UseTblrLibrary{booktabs}
% **********************************
\RequirePackage{amsfonts,amsmath,amssymb,amsthm}
\RequirePackage{graphicx}
\RequirePackage{xcolor}
\RequirePackage[slovene]{babel}
% *****************************************************************************


\SetupKeyvalOptions{
	family=fppthesis,
	prefix=fppthesis@
}

\DeclareStringOption[DefaultValue]{PROGRAM}
\DeclareStringOption[DefaultValue]{SMER}
\DeclareStringOption{NASLOVSLO}
\DeclareStringOption{NASLOVANG}
\DeclareStringOption{AVTOR}
\DeclareStringOption{STEVILKA}
\DeclareStringOption{MENTOR}
\DeclareStringOption{LEKTOR}
\DeclareStringOption{LETO}
\DeclareStringOption{MESEC}

% *** Imena naloge ***
\newcommand{\fppthesis@diplomskaNaloga}{DIPLOMSKA NALOGA}
\newcommand{\fppthesis@diplomaThesis}{DIPLOMA THESIS}
\newcommand{\fppthesis@magistrskaNaloga}{MAGISTRSKA NALOGA}
\newcommand{\fppthesis@masterThesis}{MASTER THESIS}


% *** aliasi za program študija ***
\DeclareVoidOption{pomnav}{
	\renewcommand{\fppthesis@PROGRAM}
	{Visokošolski strokovni študijski program 1. stopnje \newline Navtika}
	\newcommand{\fppthesis@imenalogeSLO}{\fppthesis@diplomskaNaloga}
	\newcommand{\fppthesis@imenalogeANG}{\fppthesis@diplomaThesis}
}
\DeclareVoidOption{pomstr}{
	\renewcommand{\fppthesis@PROGRAM}
	{Visokošolski strokovni študijski program 1. stopnje \newline Pomorsko strojništvo}
	\newcommand{\fppthesis@imenalogeSLO}{\fppthesis@diplomskaNaloga}
	\newcommand{\fppthesis@imenalogeANG}{\fppthesis@diplomaThesis}
}
\DeclareVoidOption{promtpl}{
	\renewcommand{\fppthesis@PROGRAM}
	{Univerzitetni študijski program 1. stopnje \newline Tehnologija prometa in logistika}
	\newcommand{\fppthesis@imenalogeSLO}{\fppthesis@diplomskaNaloga}
	\newcommand{\fppthesis@imenalogeANG}{\fppthesis@diplomaThesis}
}
\DeclareVoidOption{prompttl}{
	\renewcommand{\fppthesis@PROGRAM}
	{Visokošolski strokovni študijski program 1. stopnje \newline Prometna tehnologija in transportna logistika}
	\newcommand{\fppthesis@imenalogeSLO}{\fppthesis@diplomskaNaloga}
	\newcommand{\fppthesis@imenalogeANG}{\fppthesis@diplomaThesis}
}
\DeclareVoidOption{pom2}{
	\renewcommand{\fppthesis@PROGRAM}
	{2. stopenjski študijski program Pomorstvo}
	\newcommand{\fppthesis@imenalogeSLO}{\fppthesis@magistrskaNaloga}
	\newcommand{\fppthesis@imenalogeANG}{\fppthesis@masterThesis}
}
\DeclareVoidOption{prom2}{
	\renewcommand{\fppthesis@PROGRAM}
	{2. stopenjski študijski program Promet}
	\newcommand{\fppthesis@imenalogeSLO}{\fppthesis@magistrskaNaloga}
	\newcommand{\fppthesis@imenalogeANG}{\fppthesis@masterThesis}
}

% --- Add a flag to detect explicit user input for SMER ---
\newif\iffppthesis@SMERgiven
\fppthesis@SMERgivenfalse
\AddToKeyvalOption{fppthesis}{SMER}{\fppthesis@SMERgiventrue}
\def\fppthesis@SMER@default{DefaultValue}

\ProcessKeyvalOptions*


% *****************************************************************************
\LoadClass[12pt,a4paper,twoside]{article}
\RequirePackage[slovene]{babel}

% Debug: check SMER status
%\iffppthesis@SMERgiven
%	\typeout{SMER flag true; value=\fppthesis@SMER}
%\else
%	\typeout{SMER flag false; value=\fppthesis@SMER}
%\fi


\def\@zahvala{Ni vnešene zahvale}
\newcommand{\zahvala}[1]{
	\def\@zahvala{#1}
}
\def\@povzetekSLO{Ni vnešene zahvale}
\newcommand{\povzetekSLO}[1]{
	\def\@povzetekSLO{#1}
}
\def\@povzetekANG{Ni vnešene zahvale}
\newcommand{\povzetekANG}[1]{
	\def\@povzetekANG{#1}
}
\def\@kljucnebesedeSLO{Ni vnešene zahvale}
\newcommand{\kljucnebesedeSLO}[1]{
	\def\@kljucnebesedeSLO{#1}
}
\def\@kljucnebesedeANG{Ni vnešene zahvale}
\newcommand{\kljucnebesedeANG}[1]{
	\def\@kljucnebesedeANG{#1}
}

% števec za enačbe zgleda kot (2.7) in se resetira v vsakem razdelku
\numberwithin{equation}{section}  

% bold matematika znotraj \textbf{ }, tudi v naslovih
\g@addto@macro\bfseries{\boldmath}

% Poimenuj kazalo slik kot ``Kazalo slik'' in ne ``Slike''
\addto\captionsslovene{
	\renewcommand{\listfigurename}{Kazalo slik}%
}


% *****************************************************************************
% Dimenzije strani
% *****************************************************************************

\textwidth 15cm
\textheight 24cm
\oddsidemargin.5cm
\evensidemargin.5cm
\topmargin-5mm
\addtolength{\footskip}{10pt}
%\overfullrule=15pt % v primeru če gre tekst čez stran ga obarva črno


% *****************************************************************************
\newcommand{\fppthesis@frontpages}{
	\pagestyle{empty}
	%
	\fppthesis@frontpages@naslovnica@slo
	\cleardoublepage
	\fppthesis@frontpages@naslovnica@ang
	\cleardoublepage
	\fppthesis@frontpages@osebe
	\cleardoublepage
	\fppthesis@frontpages@sklep
	\cleardoublepage
	
	\pagestyle{plain}
	\fppthesis@frontpages@zahvala
	\cleardoublepage
	%
	\fppthesis@common@toc
	%
	\pdfbookmark[1]{Povzetek}{povzetek}
	\fppthesis@frontpages@povzetek
	\fppthesis@frontpages@kljucnebesede
	\cleardoublepage
	\fppthesis@frontpages@abstract
	\fppthesis@frontpages@keywords
	\cleardoublepage
}

% *** Kazalo ***
\newcommand{\fppthesis@common@toc}{
	\pdfbookmark[1]{\contentsname}{kazalo-vsebine}
	\tableofcontents
	\vfill
	\cleardoublepage
}

% *** Naslovna stran SLO  ***
\newcommand{\fppthesis@frontpages@naslovnica@slo}
{	
	\noindent
	\begin{center}
		{\normalsize
			UNIVERZA V LJUBLJANI\\[1mm]
			FAKULTETA ZA POMORSTVO IN PROMET
		}
		
		\vskip 5cm
		
		{\Large
			\fppthesis@imenalogeSLO
		}
		
		\vskip 2cm 
		
		\singlespacing
		{\normalsize
			\textsc{\fppthesis@AVTOR}
		}
		
		\vskip 2cm
		
		\doublespacing		
		{\Large
			\textbf{\MakeUppercase{\fppthesis@NASLOVSLO}}	
		}
	\end{center}
		
	\vfill
		
	\begin{center}
		\noindent
		Portorož, \fppthesis@MESEC~\fppthesis@LETO
	\end{center}
}

% *** Naslovna stran ANG  ***
\newcommand{\fppthesis@frontpages@naslovnica@ang}
{	
	\noindent
	\begin{center}
		{\normalsize
			UNIVERSITY OF LJUBLJANA\\[1mm]
			FACULTY FOR MARITIME STUDIES AND TRANSPORT
		}
		
		\vskip 5cm
		
		{\Large
			\fppthesis@imenalogeANG
		}
		
		\vskip 2cm 
		
		\singlespacing
		{\normalsize
			\textsc{\fppthesis@AVTOR}
		}
		
		\vskip 2cm
		
		\doublespacing		
		{\Large
			\textbf{\MakeUppercase{\fppthesis@NASLOVANG}}	
		}
	\end{center}
	
	\vfill
	
	\begin{center}
		\noindent
		Portorož, \fppthesis@MESEC~\fppthesis@LETO
	\end{center}
}

% *** Naslovna stran SLO osebe  ***
\newcommand{\fppthesis@frontpages@osebe}
{	
	\noindent
	\begin{center}
		{\normalsize
			UNIVERZA V LJUBLJANI\\[1mm]
			FAKULTETA ZA POMORSTVO IN PROMET
		}
		
		\vskip 5cm
		
		{\Large
			\fppthesis@imenalogeSLO
		}
		
		\vskip 2cm 
		
		\doublespacing		
		{\Large
			\textbf{\MakeUppercase{\fppthesis@NASLOVSLO}}	
		}
	\end{center}
	
	\vfill
	
	\begin{center}
		\iffppthesis@SMERgiven
		\begin{tblr}{
				colspec={Q[r,t,40mm]Q[l,t,110mm]},
				row{all}={white},
				rowsep=3pt
			}
			\textit{Mentor}:            & \fppthesis@MENTOR \\
			\textit{Študent}:           & \fppthesis@AVTOR \\
			\textit{Lektor}:            & \fppthesis@LEKTOR \\
			\textit{Vpisna številka}:   & \fppthesis@STEVILKA \\
			\textit{Študijski program}: & \fppthesis@PROGRAM \\
			\textit{Smer študija}:      & \fppthesis@SMER
		\end{tblr}
		\else
		\begin{tblr}{
				colspec={Q[r,t,40mm]Q[l,t,110mm]},
				row{all}={white},
				rowsep=3pt
			}
			\textit{Mentor}:            & \fppthesis@MENTOR \\
			\textit{Študent}:           & \fppthesis@AVTOR \\
			\textit{Lektor}:            & \fppthesis@LEKTOR \\
			\textit{Vpisna številka}:   & \fppthesis@STEVILKA \\
			\textit{Študijski program}: & \fppthesis@PROGRAM
		\end{tblr}
		\fi
	\end{center}
	
	\vskip 2cm
	
	\begin{center}
		\noindent
		Portorož, \fppthesis@MESEC~\fppthesis@LETO
	\end{center}
}

% *** zahvala ***
\newcommand{\fppthesis@frontpages@zahvala}{
	%\ifdefined\@zahvala
	\pdfbookmark[1]{Zahvala}{zahvala}
	\section*{Zahvala}
	\@zahvala
	\vfill
	\cleardoublepage
	%\fi
}

% *** povzetek ***
\newcommand{\fppthesis@frontpages@povzetek}{
	\begin{center}
		\textbf{\fppthesis@NASLOVSLO}\\[3mm]
		\textsc{Povzetek}
	\end{center}
	\@povzetekSLO
	\vfill
}
\newcommand{\fppthesis@frontpages@abstract}{
	\begin{center}
		\textbf{\fppthesis@NASLOVANG}\\[3mm]
		\textsc{Abstract}
	\end{center}
	\@povzetekANG
	\vfill
}

% *** ključne besede ***
\newcommand{\fppthesis@frontpages@kljucnebesede}{
	\noindent
	\def\sep{, } % Pri izpisu ključne besede ločimo z vejico.
	\textbf{Ključne besede:} \@kljucnebesedeSLO
}
\newcommand{\fppthesis@frontpages@keywords}{
	\noindent
	\def\sep{, } % Pri izpisu ključne besede ločimo z vejico.
	\textbf{Keywords:} \@kljucnebesedeANG
}

% *** Sklep KZŠZ ***
\newcommand{\fppthesis@frontpages@sklep}{
	\noindent
	\begin{center}
		\textbf{Sklep komisije za študijske zadeve}
		\\[1cm]
		\IfFileExists{sklep_kzsz.pdf}{
			\fbox{\includegraphics[width=14cm]{sklep_kzsz.pdf}}
		}{
			\ClassError{fppthesis}{PDF sken sklepa KZŠZ ne najdem!}{Preveri, ali je datoteka skle_kzsz.pdf naložena?}
		}
	\end{center}
}


% *****************************************************************************
% potrebno za izdelavo vseh hyper metapodatkov za PDF/A
%\RequirePackage[hidelinks]{hyperref}
\RequirePackage[
bookmarksopen, bookmarksdepth=3, 
colorlinks=true,
linkcolor=blue, anchorcolor=black, citecolor=green, filecolor=red, 
menucolor=blue, runcolor=red, urlcolor=blue,
pdfencoding=auto, breaklinks=true, psdextra]
{hyperref}


% *** izdelava tesesa dokumenta ***
\AfterEndPreamble{
	
	% Doda metadata informacijo za metadata podatke v PDF/A
	\hypersetup{
		pdfauthor={\fppthesis@AVTOR},
		pdftitle={\fppthesis@NASLOVSLO},
		pdfkeywords={\@kljucnebesedeSLO}
	}
	
	% Avoid duplicate 'page.1' by disabling page anchors on title/front matter
	\hypersetup{pageanchor=false}
	\pagenumbering{roman}
	
	
	% *****************************************
	% ***         start title body          ***
	% *****************************************
	
	\pagestyle{empty}
	%
	\fppthesis@frontpages@naslovnica@slo
	\cleardoublepage
	\fppthesis@frontpages@naslovnica@ang
	\cleardoublepage
	\fppthesis@frontpages@osebe
	\cleardoublepage
	\fppthesis@frontpages@sklep
	\cleardoublepage
	
	\pagestyle{plain}
	\fppthesis@frontpages@zahvala
	\cleardoublepage
	%
	\fppthesis@common@toc
	%
	\pdfbookmark[1]{Povzetek}{povzetek}
	\fppthesis@frontpages@povzetek
	\fppthesis@frontpages@kljucnebesede
	\cleardoublepage
	\fppthesis@frontpages@abstract
	\fppthesis@frontpages@keywords
	\cleardoublepage
	
	
	% *****************************************
	% ***        start document body        ***
	% *****************************************
	
	% *** formatiranje odstavka ***
	\setlength{\parskip}{16pt}  % razmak med odstavki
	\setlength{\parindent}{0pt} % poravnava v začetku odstavka
	
	\pagestyle{plain}
	\hypersetup{pageanchor=true}% Re-enable before main content
	\pagenumbering{arabic}%
}

% -----------------------------------------------
% Bookmark package (optional but recommended)
% -----------------------------------------------
\RequirePackage{bookmark} % better outlines; fewer reruns

% *****************************************************************************
%                             *** End of class ***
% *****************************************************************************
