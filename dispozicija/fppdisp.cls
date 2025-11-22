% **********************************************************************
% Copyright 2025 ULFPP

% Author: Aleksander Sandro GRM @fpp.uni-lj.si
% Description: This is an official latex ULFPP thesis disposition
%              class template.
% Version: 1.0
% Date: 22/11/2025
% **********************************************************************

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{fppdisp}[2025/11/21 Dispozicija zaključnega dela na FPP]

% ******************************************************************
% !!! POMEMBNO: class je narejen za prevajanje z pdflatex ukazom !!!
% ******************************************************************

% **********************************
% *** Nalaganje dodatnih paketov *** 
% **********************************

\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage[slovene]{babel}
\RequirePackage{lmodern}
% **********************************
\RequirePackage{etoolbox}
\RequirePackage{ifthen}
\RequirePackage{kvoptions}
\RequirePackage{makeidx}
\RequirePackage{setspace}
% **********************************
\RequirePackage{amsfonts,amsmath,amssymb,amsthm}
\RequirePackage{graphicx}
\RequirePackage{tabularray}
\RequirePackage{xcolor}

%\definecolor{linkcolor}{RGB}{0,0,0}
%\definecolor{linkcolor}{RGB}{0,84,147}

% ******************************************************************

\SetupKeyvalOptions{
	family=fppdisp,
	prefix=fppdisp@
}

\DeclareStringOption[DefaultValue]{PROGRAM}
\DeclareStringOption[DefaultValue]{SMER}
\DeclareStringOption{NASLOV}
\DeclareStringOption{AVTOR}
\DeclareStringOption{STEVILKA}
\DeclareStringOption{MENTOR}
\DeclareStringOption{LETO}
\DeclareStringOption{MESEC}

% *** aliasi za program študija ***
\DeclareVoidOption{pomnav}{
	\renewcommand{\fppdisp@PROGRAM}
	{Visokošolski strokovni študijski program 1. stopnje \newline Navtika}
}
\DeclareVoidOption{pomstr}{
	\renewcommand{\fppdisp@PROGRAM}
	{Visokošolski strokovni študijski program 1. stopnje \newline Pomorsko strojništvo}
}
\DeclareVoidOption{promtpl}{
	\renewcommand{\fppdisp@PROGRAM}
	{Univerzitetni študijski program 1. stopnje \newline Tehnologija prometa in logistika}
}
\DeclareVoidOption{prompttl}{
	\renewcommand{\fppdisp@PROGRAM}
	{Visokošolski strokovni študijski program 1. stopnje \newline Prometna tehnologija in transportna logistika}
}
\DeclareVoidOption{pom2}{
	\renewcommand{\fppdisp@PROGRAM}
	{2. stopenjski študijski program Pomorstvo}
}
\DeclareVoidOption{prom2}{
	\renewcommand{\fppdisp@PROGRAM}
	{2. stopenjski študijski program Promet}
}

% --- Add a flag to detect explicit user input for SMER ---
\newif\iffppdisp@SMERgiven
\fppdisp@SMERgivenfalse
\AddToKeyvalOption{fppdisp}{SMER}{\fppdisp@SMERgiventrue}
\def\fppdisp@SMER@default{DefaultValue}

\ProcessKeyvalOptions*
% ******************************************************************

\LoadClass[12pt,a4paper]{article}
\RequirePackage[slovene]{babel}

\iffppdisp@SMERgiven
	\typeout{SMER flag true; value=\fppdisp@SMER}
\else
	\typeout{SMER flag false; value=\fppdisp@SMER}
\fi


% ******************************************************************
% *** Dimenzije strani
% ******************************************************************

\textwidth 15cm
\textheight 24cm
\oddsidemargin.5cm
\evensidemargin.5cm
\topmargin-5mm
\addtolength{\footskip}{10pt}
%\overfullrule=15pt % v primeru če gre tekst čez stran ga obarva črno


% *** Naslovna stran  ***
\newcommand{\fppdisp@naslovnica}
{	
	\noindent
	\begin{center}
		UNIVERZA V LJUBLJANI\\[1mm]
		FAKULTETA ZA POMORSTVO IN PROMET
		\\[5cm]
		
		{\Large
			\doublespacing
			\textbf{\MakeUppercase{\fppdisp@NASLOV}}
			\singlespacing
		}
		
		\vskip 20mm
		
		{\large
			\textbf{Dispozicija zaklju\v{c}nega dela}\\[20mm]
			\fppdisp@AVTOR
		}
	\end{center}
	
	\vfill
	
	\begin{center}
		\iffppdisp@SMERgiven
			\begin{tblr}{
					colspec={Q[r,t,40mm]Q[l,t,110mm]},
					row{all}={white},
					rowsep=3pt
				}
				% *** začetek podatko ***
				\textit{Mentor}:            & \fppdisp@MENTOR \\
				\textit{Študijski program}: & \fppdisp@PROGRAM \\
				\textit{Smer}:              & \fppdisp@SMER \\
				\textit{Vpisna številka}:   & \fppdisp@STEVILKA
			\end{tblr}
		\else
			\begin{tblr}{
					colspec={Q[r,t,40mm]Q[l,t,110mm]},
					row{all}={white},
					rowsep=3pt
				}
				% *** začetek podatko ***
				\textit{Mentor}:            & \fppdisp@MENTOR \\
				\textit{Študijski program}: & \fppdisp@PROGRAM \\
				\textit{Vpisna številka}:   & \fppdisp@STEVILKA
			\end{tblr}
		\fi
	\end{center}
	
	\vskip 2cm
	
	\begin{center}
		\noindent
		Portorož, \fppdisp@MESEC~\fppdisp@LETO
	\end{center}
}

% ******************************************************************


% ******************************************************************
%                *** Izdelava PDF/A dokument ***
% ******************************************************************
%
% pdfLatex generira navaden PDF, ki ga je potrebno pretvorit v PFD/A
%
% pretvorba v PDF/A online: 
%           https://www.pdfforge.org/online/en/pdf-to-pdfa
% 
% validacija PDF/A: 
%           https://www.pdfforge.org/online/en/validate-pdfa
%
% ******************************************************************

% potrebno za izdelavo vseh hyper metapodatkov
\RequirePackage[hidelinks]{hyperref}


% *** izdelava tesesa dokumenta ***
\AfterEndPreamble{
	
	% Doda metadata informacijo za metadata podatke v PDF/A
	\hypersetup{
		pdfauthor={\fppdisp@AVTOR},
		pdftitle={\fppdisp@NASLOV},
		bookmarksopen, bookmarksdepth=3, 
		%colorlinks,
		%linkcolor={RGB}{0,0,0}, anchorcolor={RGB}{0,0,0}, citecolor={RGB}{0,0,0}, filecolor={RGB}{0,0,0},
		%menucolor={RGB}{0,0,0}, runcolor={RGB}{0,0,0}, urlcolor={RGB}{0,0,0}, pdfencoding=auto,
		%breaklinks=true, psdextra
	}
	
	% Avoid duplicate 'page.1' by disabling page anchors on title/front matter
	\hypersetup{pageanchor=false}
	\pagenumbering{roman}


% *****************************************
% ***         start title body          ***
% *****************************************
	
	\pagestyle{empty}
	\fppdisp@naslovnica


% *****************************************
% ***        start document body        ***
% *****************************************

	\clearpage
	\pagestyle{plain}
	%\cleardoublepage % if twosided
	\hypersetup{pageanchor=true}% Re-enable before main content
	\pagenumbering{arabic}%
}

% -----------------------------------------------
% Bookmark package (optional but recommended)
% -----------------------------------------------
\RequirePackage{bookmark} % better outlines; fewer reruns

% ********************
% *** End of class ***
% ********************

