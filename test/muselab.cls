% muselab.cls  (C) 2024-2026 muse-lab, The University of Fukuchiyama
% Rebuilt from muselabtech.sty to a document class extending ipsj.cls / ipsjtech.sty
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{muselab}[2026/01/21 v0.2 muselab class for Fukuchiyama Univ. (muse-lab)]

% --- Pass unknown options to ipsj.cls ---
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ipsj}}
\ProcessOptions\relax
\LoadClass{ipsj}
% --- common utilities used by muselab sample/docs ---
\RequirePackage{fancyvrb} % provides \Verb
\RequirePackage{capt-of}  % provides \CaptionType for captions in minipage
\RequirePackage{url}      % safer URL typesetting (often used with \Verb)

% --- muselab extras (for student template robustness) ---
\RequirePackage{graphicx} % \includegraphics
\RequirePackage{amssymb}  % provides \Box etc.

% Quote environment used in the template
\newenvironment{musequote}{\begin{quote}\small}{\end{quote}}
% Source / attribution inside musequote
\newcommand{\from}[1]{\par\hfill{\small（#1）}\par}


% --- muselab customizations (ported from muselabtech.sty) ---

% muselabtech.sty  (C) 2024 muse-lab, The University of Fukuchiyama
% Copyright (C) 2023-2025 by Mitsuyo Hashida



% [2024/06/15 v3.01 muselabTECH.STY for Fukuchiyama Univ.]
% [2012/03/26-05/02 v1.00-2.00 muselabTECH.STY]
% [2012/06/01 v3.00 muselabTECH.STY]


\RequirePackage[normalem]{ulem} % \soutを有効化
\newcommand{\red}[1]{\textcolor{red}{#1}}
\newcommand{\cut}[1]{\textcolor{red}{\sout{\textcolor{black}{#1}}}}

% ==============================================
% 年度・提出日・改訂日の設定
% ==============================================
% (muselab) thesis-year/date definitions (optional)
\IfFileExists{../_date.tex}{\input{../_date}}{%
  \IfFileExists{_date.tex}{\input{_date}}{%
    % Fallbacks (if _date.tex is not provided)
    \providecommand{\thesisyear}{\number\year}%
    \providecommand{\submitdate}{\number\year 年 \number\month 月 \number\day 日}%
    \providecommand{\revisedate}{}%
    \providecommand{\showReviceDate}{}%
  }%
}
% ==============================================
% ヘッダ
% ==============================================
%%
\def\SIGHead{\ifDS@english%
      %{IPSJ SIG Technical Report}%
   \else 福知山公立大学情報学部 地域情報PBLプロジェクト報告書\fi}%%
%


\def\signame@DAM{\ifDS@english%
      %IPSJ SIG Technical Report%
   \else 福知山公立大学情報学部 地域情報PBLプロジェクト報告書\fi}%%



%%%%%%%%%
%%%
\def\ps@IPSJTITLEheadings{%
\def\@oddhead{\@Ltop%
   \rlap{\small%
      %%
      {\HeadfontJ{\signame}}%%
      %%%%%
      {%%
         \ifDS@abstract\else\fi
      }}%
   %%%%
   \smash{\raisebox{-4mm}{\rlap{%
            {\DOIHeadfont%%
                  （\thesisyear 年度）%
               }%
         }}}%
   \hfil\@Rtop}%
%%
\let\@evenhead\@oddhead
\def\@oddfoot{\@Lbot%
\rlap{%
{\bothashira%
{\textcopyrighttx} \ {\@footyear} Department of Informatics, The University of Fukuchiyama, Japan%
}}%
\hfil%
{\botnomble%
   {\thepage}}%
\@Rbot}%
\let\@evenfoot\@oddfoot
\let\@mkboth\@gobbletwo
}
%%%
\def\ps@muselabTITLEheadings{%
\def\@oddhead{\@Ltop%
   \rlap{\small%
      %%
      {\HeadfontJ{\signame}}%%
      %%%%%
      {%%
         \ifDS@abstract\else\fi
      }}%
   %%%%
   \smash{\raisebox{-4mm}{\rlap{%
            {\DOIHeadfont%%
                  （\thesisyear 年度）%
               }%
         }}}%
   \hfil\@Rtop}%
%%
\let\@evenhead\@oddhead
\def\@oddfoot{\@Lbot%
\rlap{%
{\bothashira%
{\textcopyrighttx} \ {\@footyear} Department of Informatics, The University of Fukuchiyama, Japan%
}}%
\hfil%
{\botnomble%
   {\thepage}}%
\@Rbot}%
\let\@evenfoot\@oddfoot
\let\@mkboth\@gobbletwo
}

\def\@maketitle{%
   \newpage\null
   %%%%%%%%%%
   \ifDS@english
      %%
      \vskip-1.3mm%<--
      \ifx\SHUBETUname\relax%
         {\SHUBETUfontE{\vphantom{\SHUBETUname@DEF}}}%%
      \else
         {\SHUBETUfontE{\vphantom{\SHUBETUname}}}%%
      \fi
      %%
   \else
      \ifx\SHUBETUname\relax%
         {\SHUBETUfontJ{\SHUBETUname@DEF}}%%
      \else
         {\SHUBETUfontJ{\SHUBETUname}}%%
      \fi\fi
   %%%%%%%%%%%%%%%%%
   %%%%%%%%%%%%%%%%%%%%%%%%
   \vskip\shubetutitlesep%
   %%%%%%%%%%%%%%%%%%%%%%%%
   %%
   %\vskip 10mm%
   \begin{center}
      \authortitle %%<---
   \end{center}
   %%%%%%%%%%%%%%%%%%%
   %    
   \thispagestyle{muselabTITLEheadings}

}


% ==============================================
% 著者欄
% ==============================================
\def\authortitle{%
   \vspace{5cm}
   {\jtitlefont%
      {\@title}\par}%
   \vspace{1cm}

   \vskip\Jtitlejauthorsep%
   %======
   {\authorfont%
      \authoroutput{}\par}%
   \vskip\Jauthorjreceivesep%
   %======
   {\juketukefont%
      {\@uketsuke}\par}%
   \vskip\Jreceivejabstsep%
   % \mbox{\box\@abstractbox}\par%
   \vskip\JEhonbunsep%
}

\def\authoroutput#1{%
   \bgroup
   \offsetemail\z@
   \count@\@ne
   \advance\author@count\@ne
   \@whilenum{\count@<\author@count}\do{%
      \mbox{% start
         福知山公立大学 情報学部情報学科}\par%
      \vspace{5mm}
      \mbox{
         \csname #1authorname\the\count@\endcsname
      }%% end
      \par\vspace{5mm}
      \mbox{指導教員 \quad 橋田光代　准教授}
      \par\vspace{7mm}
      \mbox{\begin{tabular}{rl}
            提出日 & \submitdate \\
            \showReviceDate
         \end{tabular}
      }
      %
      \csname #1break@or@oneskip\endcsname
      %
      \advance\count@\@ne
      %%%
   }%
   \egroup
}

% ==============================================
% 要旨
% ==============================================

\pagestyle{muselabTITLEheadings}

% ==============================================
% 目次
% ==============================================
\RequirePackage{color}

\setcounter{tocdepth}{3}
\newcommand{\@pnumwidth}{1.55em}
\newcommand{\@tocrmarg}{2.55em}
\newcommand{\@dotsep}{4.5}
\newdimen\toclineskip
\setlength\toclineskip{\z@}
\newdimen\@lnumwidth
\def\numberline#1{\hb@xt@\@lnumwidth{#1\hfil}}
\def\@dottedtocline#1#2#3#4#5{%
   \ifnum #1>\c@tocdepth \else
      \vskip\toclineskip \@plus.2\p@
      {\leftskip #2\relax \rightskip \@tocrmarg \parfillskip -\rightskip
         \parindent #2\relax\@afterindenttrue
         \interlinepenalty\@M
         \leavevmode
         \@lnumwidth #3\relax
         \advance\leftskip \@lnumwidth \null\nobreak\hskip -\leftskip
         {#4}\nobreak
         \leaders\hbox{$\m@th \mkern \@dotsep mu.\mkern \@dotsep mu$}%
         \hfill\nobreak
         \hb@xt@\@pnumwidth{\hss\normalfont \normalcolor #5}%
         \par}%
   \fi}
\providecommand*\protected@file@percent{}
\def\addcontentsline#1#2#3{%
   \protected@write\@auxout
   {\let\label\@gobble \let\index\@gobble \let\glossary\@gobble
      \@temptokena{\thepage}%
   }{\string\@writefile{#1}%
      {\protect\contentsline{#2}{#3}{\the\@temptokena}{}%
         \protected@file@percent}}%
}
\newcommand{\tableofcontents}{%
   \par\par
   \section*{\contentsname
     \@mkboth{\contentsname}{\contentsname}%
    }\@starttoc{toc}%
}
\newcommand*{\l@part}[2]{%
   \ifnum \c@tocdepth >-2\relax
      \addpenalty{\@secpenalty}%
      \addvspace{2.25em \@plus\p@}%
      \begingroup
      \parindent\z@\rightskip\@pnumwidth
      \parfillskip-\@pnumwidth
      {\leavevmode\large\bfseries
         \setlength\@lnumwidth{4zw}%
         #1\hfil\nobreak
         \hb@xt@\@pnumwidth{\hss#2}}\par
      \nobreak
      \if@compatibility
         \global\@nobreaktrue
         \everypar{\global\@nobreakfalse\everypar{}}%
      \fi
      \endgroup
   \fi}
\newcommand*{\l@section}[2]{%
   \ifnum \c@tocdepth >\z@
      \addpenalty{\@secpenalty}%
      \addvspace{1.0em \@plus\p@}%
      \begingroup
      \parindent\z@ \rightskip\@pnumwidth \parfillskip-\rightskip
      \leavevmode\bfseries
      \setlength\@lnumwidth{1.5em}%
      \advance\leftskip\@lnumwidth \hskip-\leftskip
      #1\nobreak\hfil\nobreak\hb@xt@\@pnumwidth{\hss#2}\par
      \endgroup
   \fi}
\newcommand*{\l@subsection}   {\@dottedtocline{2}{1.5em}{2.3em}}
\newcommand*{\l@subsubsection}{\@dottedtocline{3}{3.8em}{3.2em}}
\newcommand*{\l@paragraph}    {\@dottedtocline{4}{7.0em}{4.1em}}
\newcommand*{\l@subparagraph} {\@dottedtocline{5}{10em}{5em}}
\newcommand{\listoffigures}{%
   \section*{\listfigurename}%
   \@mkboth{\listfigurename}{\listfigurename}%
   \@starttoc{lof}%
}
\newcommand*{\l@figure}{\@dottedtocline{1}{1.5em}{2.3em}}
\newcommand{\listoftables}{%
   \section*{\listtablename}%
   \@mkboth{\listtablename}{\listtablename}%
   \@starttoc{lot}%
}
\let\l@table\l@figure
\newcommand{\contentsname}{--- 目次 ---------}
\newcommand{\listfigurename}{--- 図目次 ---------}
\newcommand{\listtablename}{--- 表目次 ---------}

\pagestyle{muselabTITLEheadings}

% ==============================================
% .bblファイルで挟み込まれる \newblock がエラーを起こす場合の対策
% ==============================================
\makeatletter
\newcommand\newblock{\hskip .11em\@plus.33em\@minus.07em}
\makeatother


% ============================================================
% Front-matter helpers (title page / TOC page as standalone pages)
% ============================================================

% ============================================================
% Auto front-matter helpers (no manual \title/\author needed)
% ============================================================
\makeatletter
% Read a text file if it exists; otherwise use fallback text.
% The file is expected to contain plain text (not \title{} etc.).
\newcommand{\muselab@readtextfile}[2]{%
  \begingroup
  \def\muselab@tmp{#2}%
  \IfFileExists{#1}{%
    % Use \input to preserve line breaks in a simple way
    \edef\muselab@tmp{\noexpand\input{#1}}%
  }{}%
  \muselab@tmp
  \endgroup
}%
% Set default title/author from ../credit if the user didn't set them.
\newcommand{\muselab@ensuretitleauthor}{%
  \ifx\@title\@empty
    \title{\muselab@readtextfile{../credit/author-title.tex}{（題目未設定）}}%
  \fi
  \ifx\@author\@empty
    \author{\muselab@readtextfile{../credit/author-name.tex}{（氏名未設定）}}%
  \fi
}%
\makeatother

\newcommand{\muselabtitlepage}{%
  \muselab@ensuretitleauthor%
  \begingroup\makeatletter
  % If title/author not set yet, try conventional credit files automatically.
  \ifx\@title\@empty
    \IfFileExists{../credit/author-title.tex}{\input{../credit/author-title.tex}}{}%
  \fi
  \ifx\@author\@empty
    \IfFileExists{../credit/author-name.tex}{\input{../credit/author-name.tex}}{}%
  \fi
  % Still empty? Provide placeholders so compilation never stops.
  \ifx\@title\@empty
    \ClassWarning{muselab}{No \string\title given; using placeholder title}%
    \title{（タイトル未設定）}%
  \fi
  \ifx\@author\@empty
    \ClassWarning{muselab}{No \string\author given; using placeholder author}%
    \author{（著者未設定）}%
  \fi
  \maketitle
  \endgroup
  \thispagestyle{empty}%
  \clearpage
}
\newcommand{\muselabtocpage}{%
  % TOC in Roman numerals (no claim on the main text page count)
  \pagenumbering{roman}%
  \setcounter{page}{1}%
  \tableofcontents
  \thispagestyle{empty}%
  \clearpage
}
\newcommand{\muselabmainmatter}{%
  \pagenumbering{arabic}%
  \setcounter{page}{1}%
}
\newcommand{\muselabfrontmatter}{%
  \muselabtitlepage
  \muselabtocpage
  \muselabmainmatter
}

\endinput