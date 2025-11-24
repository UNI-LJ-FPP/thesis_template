% *****************************************************************************
% Copyright 2025 ULFPP

% Author: Aleksander Sandro GRM @fpp.uni-lj.si
% Description: This is an official latex ULFPP thesis disposition class template.
% Version: 2.0
% Date: 24/11/2025
% *****************************************************************************
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{fppdisp}[2025/11/24 Zaključno delo na ULFPP]

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
	family=fppdisp,
	prefix=fppdisp@
}

\DeclareStringOption[DefaultValue]{PROGRAM}
\DeclareStringOption[DefaultValue]{SMER}
\DeclareStringOption{NASLOV}
\DeclareStringOption{AVTOR}
\DeclareStringOption{STEVILKA}
\DeclareStringOption{MENTOR}
\DeclareStringOption{LEKTOR}
\DeclareStringOption{LETO}
\DeclareStringOption{MESEC}

% *** Imena naloge ***
\newcommand{\fppdisp@diplomskaNaloga}{DIPLOMSKA NALOGA}
\newcommand{\fppdisp@diplomaThesis}{DIPLOMA THESIS}
\newcommand{\fppdisp@magistrskaNaloga}{MAGISTRSKA NALOGA}
\newcommand{\fppdisp@masterThesis}{MASTER THESIS}


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


% *****************************************************************************
\LoadClass[12pt,a4paper,twoside]{article}
\RequirePackage[slovene]{babel}


% Debug: check SMER status
%\iffppdisp@SMERgiven
%	\typeout{SMER flag true; value=\fppdisp@SMER}
%\else
%	\typeout{SMER flag false; value=\fppdisp@SMER}
%\fi


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


% *** Naslovna stran  ***
\newcommand{\fppdisp@naslovnica}
{	
	\noindent
	\begin{center}
		UNIVERZA V LJUBLJANI\\[1mm]
		FAKULTETA ZA POMORSTVO IN PROMET
		
		\vskip 50mm
		
		{\Large
			\doublespacing
			\textbf{\MakeUppercase{\fppdisp@NASLOV}}
			\singlespacing
		}
		
		\vskip 20mm
		
		{\large
			\textbf{Dispozicija zaklju\v{c}nega dela}
		}
		
		\vskip 20mm
		
		{\large
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

% *****************************************************************************

% potrebno za izdelavo vseh hyper metapodatkov
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
		pdfauthor={\fppdisp@AVTOR},
		pdftitle={\fppdisp@NASLOV}
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

% *****************************************************************************
%                             *** End of class ***
% *****************************************************************************

