% SPDX-License-Identifier: MIT
\NeedsTeXFormat{LaTeX2e}[2020/10/01]
\ProvidesClass{sdu-thesis}[2026/09/17 v0.2 SDU graduate thesis template]
\newif\ifSDUportable
% All numbered pages follow the guide: school name and degree level.
\DeclareOption{portable}{\SDUportabletrue}
\DeclareOption{guideheader}{} % Compatibility: this is now always enabled.
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions\relax
\LoadClass[UTF8,a4paper,zihao=-4,fontset=none,linespread=1,twoside,openright]{ctexbook}
\RequirePackage{iftex}
\RequireXeTeX
\ifSDUportable
  \setCJKmainfont{FandolSong-Regular.otf}[BoldFont=FandolSong-Bold.otf,ItalicFont=FandolKai-Regular.otf]
  \setCJKsansfont{FandolHei-Regular.otf}[BoldFont=FandolHei-Bold.otf]
  \setCJKmonofont{FandolFang-Regular.otf}
  \setCJKfamilyfont{zhsong}{FandolSong-Regular.otf}[BoldFont=FandolSong-Bold.otf]
  \setCJKfamilyfont{zhhei}{FandolHei-Regular.otf}[BoldFont=FandolHei-Bold.otf]
  \setCJKfamilyfont{zhkai}{FandolKai-Regular.otf}
  \setmainfont{texgyretermes-regular.otf}[BoldFont=texgyretermes-bold.otf,ItalicFont=texgyretermes-italic.otf,BoldItalicFont=texgyretermes-bolditalic.otf]
\else
  \IfFontExistsTF{SimSun}{
    \setCJKmainfont{SimSun}[AutoFakeBold=2.5,ItalicFont=KaiTi]
    \setCJKsansfont{SimHei}[AutoFakeBold=2.5]
    \setCJKmonofont{FangSong}
    \setCJKfamilyfont{zhsong}{SimSun}[AutoFakeBold=2.5]
    \setCJKfamilyfont{zhhei}{SimHei}[AutoFakeBold=2.5]
    \setCJKfamilyfont{zhkai}{KaiTi}
  }{
    \setCJKmainfont{FandolSong-Regular.otf}[BoldFont=FandolSong-Bold.otf,ItalicFont=FandolKai-Regular.otf]
    \setCJKsansfont{FandolHei-Regular.otf}[BoldFont=FandolHei-Bold.otf]
    \setCJKmonofont{FandolFang-Regular.otf}
    \setCJKfamilyfont{zhsong}{FandolSong-Regular.otf}[BoldFont=FandolSong-Bold.otf]
    \setCJKfamilyfont{zhhei}{FandolHei-Regular.otf}[BoldFont=FandolHei-Bold.otf]
    \setCJKfamilyfont{zhkai}{FandolKai-Regular.otf}
    \ClassWarningNoLine{sdu-thesis}{SimSun unavailable; using Fandol fonts}
  }
  \IfFontExistsTF{Times New Roman}{\setmainfont{Times New Roman}}{\setmainfont{texgyretermes-regular.otf}[BoldFont=texgyretermes-bold.otf,ItalicFont=texgyretermes-italic.otf,BoldItalicFont=texgyretermes-bolditalic.otf]}
\fi
\xeCJKDeclareCharClass{CJK}{"2160 -> "2162, "2460 -> "2461}
\providecommand\songti{\CJKfamily{zhsong}}
\providecommand\heiti{\CJKfamily{zhhei}}
\providecommand\kaishu{\CJKfamily{zhkai}}
\RequirePackage[top=28mm,bottom=25mm,left=25mm,right=25mm,headheight=15bp,headsep=21.8bp,footskip=7.5mm]{geometry}
\RequirePackage{amsmath,amssymb,graphicx,booktabs,longtable,array,tabularx,multirow}
\RequirePackage{tikz}
\RequirePackage{caption,subcaption}
\RequirePackage{fancyhdr,etoolbox,enumitem}
\RequirePackage[sort&compress]{gbt7714}
\RequirePackage[perpage]{footmisc}
\RequirePackage[hidelinks,bookmarksnumbered,unicode]{hyperref}
\RequirePackage{bookmark}
\urlstyle{same}
\ctexset{
 chapter={name={第,章},number=\arabic{chapter},format=\centering\heiti\bfseries\fontsize{15bp}{18bp}\selectfont,beforeskip=24bp,afterskip=18bp,fixskip=true},
 section={format=\heiti\bfseries\fontsize{14bp}{17bp}\selectfont,beforeskip=24bp,afterskip=6bp},
 subsection={format=\heiti\bfseries\fontsize{12bp}{15bp}\selectfont,beforeskip=12bp,afterskip=6bp}}
\renewcommand\normalsize{\@setfontsize\normalsize{12bp}{20bp}\abovedisplayskip=10bp\belowdisplayskip=10bp\abovedisplayshortskip=3bp\belowdisplayshortskip=6bp}
\AtBeginDocument{\normalsize\setlength{\parindent}{2em}\raggedbottom}
\setlength{\parskip}{0pt}
\setcounter{tocdepth}{2}
\setcounter{secnumdepth}{2}
\renewcommand\thefigure{\thechapter-\arabic{figure}}
\renewcommand\thetable{\thechapter-\arabic{table}}
\renewcommand\theequation{\thechapter-\arabic{equation}}
\DeclareCaptionFont{sdusize}{\fontsize{10.5bp}{12.6bp}\selectfont}
\captionsetup{font=sdusize,labelsep=space,justification=centering,skip=6bp}
\captionsetup[table]{position=top}
\captionsetup[subfigure]{font=sdusize,skip=3bp}
\renewcommand\headrule{\hrule height 1.4bp\vskip 1bp\hrule height .45bp\vskip -2.85bp}
\fancypagestyle{sdu}{%
 \fancyhf{}%
 \fancyhead[C]{\songti\fontsize{10.5bp}{12bp}\selectfont 山东大学\SDUlevelname 学位论文}%
 \fancyfoot[C]{\fontsize{10.5bp}{12bp}\selectfont\thepage}%
}
\fancypagestyle{plain}{\pagestyle{sdu}}
\newif\ifSDUappendix
\pretocmd{\appendix}{\SDUappendixtrue}{}{}
\renewcommand\chaptermark[1]{\markboth{\ifSDUappendix 附录\thechapter\else 第\thechapter 章\fi\quad #1}{}}
\renewcommand\cleardoublepage{\clearpage\if@twoside\ifodd\c@page\else\hbox{}\thispagestyle{empty}\newpage\fi\fi}
\newcommand\SDUfrontmatter{\cleardoublepage\@mainmatterfalse\pagenumbering{Roman}\pagestyle{sdu}}
\newcommand\SDUmainmatter{\cleardoublepage\@mainmattertrue\pagenumbering{arabic}\pagestyle{sdu}}
% Both directories are generated from the same heading, with the same destination and page.
\newcommand\bichapter[2]{\chapter{#1}\addcontentsline{toe}{englishchapter}{\protect\numberline{\ifSDUappendix Appendix\else Chapter\fi\space\thechapter}#2}}
\newcommand\bisection[2]{\section{#1}\addcontentsline{toe}{section}{\protect\numberline{\thesection}#2}}
\newcommand\bisubsection[2]{\subsection{#1}\addcontentsline{toe}{subsection}{\protect\numberline{\thesubsection}#2}}
\newcommand\SDUaddboth[2]{\addcontentsline{toc}{chapter}{#1}\addcontentsline{toe}{chapter}{#2}}
\newcommand\SDUchapter[2]{\chapter*{#1}\markboth{#1}{}\phantomsection\SDUaddboth{#1}{#2}}
\newcommand\SDUcontents{%
 \SDUchapter{目录}{Contents (Chinese)}{\fontsize{12bp}{14bp}\selectfont\@starttoc{toc}}%
 \SDUchapter{CONTENT}{Contents (English)}{\fontsize{12bp}{14bp}\selectfont\@starttoc{toe}}}
\renewcommand\@pnumwidth{3em}
\renewcommand\@tocrmarg{4em}
% Use regular-weight directory entries, dotted leaders, 6 bp before each item.
\renewcommand*\l@chapter[2]{\vskip6bp{\@dottedtocline{0}{0em}{4.5em}{#1}{#2}}}
\newcommand*\l@englishchapter[2]{\vskip6bp{\@dottedtocline{0}{0em}{6.5em}{#1}{#2}}}
\def\toclevel@englishchapter{0}
\renewcommand*\l@section[2]{\vskip6bp{\@dottedtocline{1}{2em}{2.8em}{#1}{#2}}}
\renewcommand*\l@subsection[2]{\vskip6bp{\@dottedtocline{2}{4em}{3.5em}{#1}{#2}}}
\newcommand\SDUfigurecaption[2]{\caption{#1}\par\nobreak{\centering\fontsize{10.5bp}{12.6bp}\selectfont Fig.~\thefigure\enspace #2\par}\addcontentsline{loe}{figure}{\protect\numberline{\thefigure}#2}}
\newcommand\SDUtablecaption[2]{\caption{#1}\par\nobreak{\centering\fontsize{10.5bp}{12.6bp}\selectfont Tab.~\thetable\enspace #2\par}\addcontentsline{lte}{table}{\protect\numberline{\thetable}#2}\vspace{6bp}}
\newcommand\SDUfigurelists{\SDUchapter{插图目录}{List of Figures (Chinese)}\@starttoc{lof}\SDUchapter{LIST OF FIGURES}{List of Figures (English)}\@starttoc{loe}}
\newcommand\SDUtablelists{\SDUchapter{表格目录}{List of Tables (Chinese)}\@starttoc{lot}\SDUchapter{LIST OF TABLES}{List of Tables (English)}\@starttoc{lte}}
\renewcommand\bibname{引文出处及参考文献}
\renewcommand\bibsection{\SDUchapter{\bibname}{References}}
\setlength{\bibsep}{0pt}
\renewcommand\bibfont{\fontsize{12bp}{20bp}\selectfont}
\setlist{nosep,topsep=6bp,leftmargin=2em}

% The 2024 official cover supplies four doctoral and nine master's variants.
\newcommand\SDUlevel{doctor}
\newcommand\SDUtype{professional}
\newcommand\SDUengineeringtype{research}
\newcommand\SDUlevelname{博士}
\newcommand\SDUdegree{专业学位}
\newcommand\SDUdegreeEN{Dissertation for Doctoral Degree}
\newcommand\SDUworktype{专题研究类论文}
\newcommand\SDUmarkfile{figures/sdu-mark-doctor.jpg}
\newcommand\SDUmarkwidth{85.408mm}
\pgfkeys{/sdu/.is family,/sdu,
 degree-level/.is choice,
 degree-level/doctor/.code={\def\SDUlevel{doctor}},
 degree-level/master/.code={\def\SDUlevel{master}},
 degree-type/.is choice,
 degree-type/academic/.code={\def\SDUtype{academic}},
 degree-type/professional/.code={\def\SDUtype{professional}},
 degree-type/interdisciplinary/.code={\def\SDUtype{interdisciplinary}},
 degree-type/equivalent/.code={\def\SDUtype{equivalent}},
 degree-type/engineering/.code={\def\SDUtype{engineering}},
 engineering-type/.is choice,
 engineering-type/research/.code={\def\SDUengineeringtype{research}\def\SDUworktype{专题研究类论文}},
 engineering-type/design/.code={\def\SDUengineeringtype{design}\def\SDUworktype{方案设计}},
 engineering-type/case/.code={\def\SDUengineeringtype{case}\def\SDUworktype{案例分析报告}},
 engineering-type/survey/.code={\def\SDUengineeringtype{survey}\def\SDUworktype{调研报告}},
 engineering-type/product/.code={\def\SDUengineeringtype{product}\def\SDUworktype{产品设计（作品创作）}}
}
\newcommand\SDUsetup[1]{\pgfkeys{/sdu,#1}}
\AtBeginDocument{%
 \ifdefstring{\SDUlevel}{master}{\def\SDUlevelname{硕士}\def\SDUdegreeEN{Thesis for Master Degree}\def\SDUmarkfile{figures/sdu-mark-master.jpg}\def\SDUmarkwidth{87.471mm}}{}%
 \ifdefstring{\SDUtype}{academic}{\def\SDUdegree{学术学位}}{}%
 \ifdefstring{\SDUtype}{professional}{\def\SDUdegree{专业学位}}{}%
 \ifdefstring{\SDUtype}{interdisciplinary}{\def\SDUdegree{学科交叉}}{}%
 \ifdefstring{\SDUtype}{equivalent}{\edef\SDUdegree{同等学力申请\SDUlevelname 学位}}{}%
 \ifdefstring{\SDUtype}{engineering}{%
   \ifdefstring{\SDUlevel}{master}{\def\SDUdegree{工程硕博士培养改革专项}}%
    {\ClassError{sdu-thesis}{Engineering reform covers in the supplied 2024 file are master's only}{Set degree-level=master or choose another degree-type.}}%
 }{}%
}
% The guide asks for an ellipsis before right-aligned equation numbers.
% Keep inline equation references as (chapter-number), without the ellipsis.
\let\SDUoriginaltagform\tagform@
\renewcommand\tagform@[1]{\maketag@@@{\ldots\quad(\ignorespaces#1\unskip\@@italiccorr)}}
\renewcommand\eqref[1]{\textup{\SDUoriginaltagform{\ref{#1}}}}

\newcommand\SDUfield[1]{\underline{\makebox[7cm][c]{#1}}}
\newcommand\SDUcover{%
 \cleardoublepage\thispagestyle{empty}\begingroup
 \setlength{\parindent}{0pt}\heiti\bfseries\fontsize{14bp}{21bp}\selectfont
 \begin{tabular*}{\textwidth}{@{}l@{\extracolsep{\fill}}l@{}}
 分类号：\SDUclassification&单位代码：10422\\
 密\quad 级：\SDUsecrecy&学\quad 号：\SDUid
 \end{tabular*}
 \vspace{12mm}
 \begin{center}
 \IfFileExists{\SDUmarkfile}{\includegraphics[width=\SDUmarkwidth]{\SDUmarkfile}}{{\fontsize{34bp}{40bp}\selectfont 山东大学\par}\vspace{3mm}{\normalfont\fontsize{18bp}{22bp}\selectfont SHANDONG UNIVERSITY\par}}\par
 \vspace{5mm}
 {\fontsize{60bp}{70bp}\selectfont \SDUlevelname 学位论文\par}
 {\normalfont\fontsize{21bp}{26bp}\selectfont \SDUdegreeEN\par}
 {\fontsize{14bp}{20bp}\selectfont （\SDUdegree）\par}
 \ifdefstring{\SDUtype}{engineering}{\vspace{2mm}{\fontsize{14bp}{20bp}\selectfont 学位论文类型：\SDUworktype\par}}{}
 \vspace{4mm}
 {\fontsize{18bp}{27bp}\selectfont \ifdefstring{\SDUtype}{engineering}{题目：}{论文题目：}\SDUtitle\par}
 \vspace{3mm}
 {\normalfont\bfseries\fontsize{16bp}{20bp}\selectfont\SDUtitleEN\par}
 \vfill
 {\heiti\bfseries\fontsize{14bp}{22bp}\selectfont
 \renewcommand\arraystretch{1.25}
 \begin{tabular}{@{}l l@{}}
 作\quad 者\quad 姓\quad 名&\SDUfield{\SDUauthor}\\
 培\quad 养\quad 单\quad 位&\SDUfield{\SDUschool}\\
 培\quad 养\quad 方\quad 式&\SDUfield{\SDUtraining}\\
 专\quad 业\quad 名\quad 称&\SDUfield{\SDUmajor}\\
 指\quad 导\quad 教\quad 师&\SDUfield{\SDUsupervisor}\\
 合\quad 作\quad 导\quad 师&\SDUfield{\SDUcosupervisor}
 \end{tabular}}
 \vfill
 {\heiti\bfseries\fontsize{14bp}{20bp}\selectfont\SDUdate\par}
 \end{center}\endgroup\cleardoublepage}
\endinput
