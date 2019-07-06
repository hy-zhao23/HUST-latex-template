%% HUSTmasterthesis.cls 2019.3.5
%% 转换自Feng Jiang（2005.v1.0）and Huikan Liu<2006 v2.0>
%% Contributors:Haiyan Zhao
%% *******************************************
% Available class options
% (e.g., \documentclass[draftformat,dvips]{HUSTPHDthesis})
% draftformat, finalformat

% 提交草稿打开draftformat选项，提交最后版打开finalformat选项。
% 草稿正文页包括页眉（“华中科技大学硕士学位论文”），页眉修饰线（双线）。
% 页脚（页码），页脚修饰线（单线）。
% 最终版正文页包不包括页眉、页眉修饰线和页脚修饰线，仅包含页脚。
%
%
%
% mathtimes，mathCMR
% 公式字体选项，mathtimes选项让公式启用Times Roman字体
% mathCMR 选项让公式启用CM Roman字体
% 目前学校尚未规定公式选用什么字体，推荐使用CM Roman字体，
% 因为Times Roman 数学字体不支持黑体。
% 如果使用Times Roman字体，需加载bm宏包用于支持黑体（不推荐）
%
% arial
%	打开选项启 用arial字体，若无字体宏包，则默认采用helvet字体。
%
% ********
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}[2018/04/01]%[1999/12/01]
\ProvidesClass{HUSTMthesis}
[2019/03/05 V1.0 Huazhong University of Science and Technology Thesis Template]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 定义选项
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 启用真正的arial字体
\newif\ifHUST@arial
\DeclareOption{arial}{\HUST@arialtrue}

% 公式是否使用 Times Roman 字体
\newif\ifHUST@mathtimes
\DeclareOption{mathtimes}{\HUST@mathtimestrue}
\DeclareOption{mathCMR}{\HUST@mathtimesfalse}

% draftformat 包含全部的页眉页脚，最终版本的页眉为空页脚仅有页码
\newif\ifHUST@finalformat
\DeclareOption{draftformat}{\HUST@finalformatfalse}
\DeclareOption{finalformat}{\HUST@fianlformattrue}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax
\LoadClass[12pt,a4paper,openany]{book}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 加载宏包
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{ifthen}
\RequirePackage{calc}
\RequirePackage{xeCJK}
\RequirePackage[UTF8]{ctex}

%%%？？？？？？
\ifHUST@arial
	\IfFileExists{arial.sty}{\RequirePackage{arial}}%
\else
	\RequirePackage[scaled=0.92]{helvet}
\fi

% 若不想在公式环境中使用Times Roman 字体而使用 Computer Modern Roman 字体，
% 必须分别加载三种字族
% 另外为了消除警告，需要适当增加字体替代的警告忍受度
\ifHUST@mathtimes
	\RequirePackage{mathptmx}
	\RequirePackage{courier}
	\RequirePackage{bm}
\else
	\renewcommand{\sfdefault}{phv}
	\renewcommand{\rmdefault}{ptm}
	\renewcommand{\ttdefault}{pcr}
	\def\fontsubfuzz{2.0pt}
\fi

% 加载 AMSLaTex 宏包，增高对数学环境的支持
\RequirePackage{amsmath, amssymb}

% 加载图形宏包
\RequirePackage{graphicx}

% 加载此宏包以支持并排图形，打开 config 选项以兼容过时宏包subfigure  
\RequirePackage[config]{subfig}

% 首行缩进宏包
\RequirePackage{indentfirst}

%导言区支持中文

%%%%%%%%%%%%%mac不可以使用pdflatex，直接关闭
% 生成支持复制和查询的 pdf 文档，需要用 pdflatex 编译
\RequirePackage[pdfpagelabels]{hyperref}
\RequirePackage{titlesec}

%加强定理环境的宏包
\RequirePackage[hyperref,thmmarks,amsmath]{ntheorem}
% 表格宏包
\RequirePackage{array}

% 支持三线表表格的宏包，方便水平表格线的粗细控制
\RequirePackage{booktabs}

% 控制目录风格的宏包
\RequirePackage{titletoc}

% 支持引用缩写的宏包
\RequirePackage[numbers,super,sort&compress]{natbib}


% 加载 hypernat 宏包是 hyperref 和 natbib 可以配合正常工作	
\hypersetup{%
	CJKbookmarks=true,
	bookmarksnumbered=true,,
	bookmarksopen=true,
	breaklinks=true,
	colorlinks=true,
	citecolor=black,
	linkcolor=black,
	anchorcolor=black,
	filecolor=black,
	menucolor=black,
	urlcolor=black,
	plainpages=false,
	pdfstartview=FitH}
\RequirePackage{hypernat}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 定义版面尺寸，可根据情况调整
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\AtBeginDvi{\special{papersize=\the\paperwidth,\the\paperheight}}
\AtBeginDvi{\special{!%
			\@percentchar\@percentchar BeginPaperSize: a4
			^^Ja4^^J\@percentchar\@percentchar EndPaperSize}}
\setlength{\textwidth}{\paperwidth}
\setlength{\textheight}{\paperheight}
\setlength\marginparwidth{0cm}
\setlength\marginparsep{0cm}
\addtolength{\textwidth}{-5.6cm}
\setlength{\oddsidemargin}{2.8cm-1in}
\setlength{\evensidemargin}{\oddsidemargin}
\setlength{\headheight}{0.9cm}
\setlength{\topskip}{0pt}
\setlength{\skip\footins}{15pt}
\setlength{\footskip}{1.2cm}
\setlength{\topmargin}{2.5cm-1in}
\setlength{\headsep}{0.5cm}
\addtolength{\textheight}{-7.5cm}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 定制公式样式
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 允许长公式断行、分页
\allowdisplaybreaks[4]

% 设置公式与上下文的间距
\abovedisplayskip=10bp plus 2bp minus 2bp
\abovedisplayshortskip=10bp plus 2bp minus 2bp
\belowdisplayskip=\abovedisplayskip
\belowdisplayshortskip=\abovedisplayshortskip

% 设置公式的编号形式，形式为 (式1.1)，\tagform@ 参考 amsmath 中的命令
\renewcommand{\theequation}{\arabic{chapter}.\arabic{equation}}
\let\reftagform@\tagform@
\def\tagform@#1{\maketag@@@{(式\hspace{0.2em}\ignorespaces#1\unskip\@@italiccorr)}}
\renewcommand{\eqref}[1]{\textup{\reftagform@{\ref{#1}}}}

% 设置子公式的编号形式，形式为(式1.1a)/(式1.1b)
\@ifundefined{ignorespacesafterend}{%
  \def\ignorespacesafterend{\global\@ignoretrue}%
}{}
\renewenvironment{subequations}{%
  \refstepcounter{equation}%
  \protected@edef\theparentequation{\theequation}%
  \setcounter{parentequation}{\value{equation}}%
  \setcounter{equation}{0}%
  \def\theequation{\theparentequation\alph{equation}}%
  \ignorespaces
}{%
  \setcounter{equation}{\value{parentequation}}%
  \ignorespacesafterend
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 设定浮动对象
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 对于 h 参数，浮动对象与前后正文间的距离
\setlength{\intextsep}{0.7\baselineskip plus 0.1\baselineskip minus 0.1\baselineskip}

% 顶部或底部的浮动对象与正文间的距离
\setlength{\textfloatsep}{0.8\baselineskip plus 0.1\baselineskip minus 0.2\baselineskip}

% 设定浮动对象的比例
% 下面这组命令使浮动对象的缺省值稍微宽松一点，从而防止浮动
% 对象占据过多的文本页面，也可以防止在很大空白的浮动页上放置
% 很小的图形。
\renewcommand{\textfraction}{0.15}
\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{0.65}
\renewcommand{\floatpagefraction}{0.60}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 定制浮动图形和表格的样式
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 表格中的字体比正文小半号，为大五号，11pt，同时表格中的行距为 1.4 倍行距

% 重定义 tabular 环境
\let\HUST@tabular\tabular
\renewcommand\tabular{\dawu[1.4]\HUST@tabular}
\let\endHUST@tabular\endtabular

% 重定义 tabular* 环境
\@namedef{tabular*}#1{\dawu[1.4]%
 \setlength\dimen@{#1}%
 \edef\@halignto{to\the\dimen@}\@tabular}

%% 设置标题样式
%\long\def\@makecaption#1#2{%
%  % 图表标题字体比正文小半号，为大五号，11pt
%  \dawu
%  \rmfamily
%  \vskip\abovecaptionskip
%  % 去掉图表号后面的":"
%  \setbox\@tempboxa\makebox{#1~~#2}%
%  \ifdim \wd\@tempboxa >\hsize
%  % 如果图表标题的长度超过一行，则采用悬挂缩进的方式
%    %\@hangfrom{#1~~}#2
%  \else
%  % 如果图表标题的长度不超过一行，则采用居中方式
%    \global \@minipagefalse
%    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
%  \fi
%  \vskip\belowcaptionskip}

% 设置标题标签的样式
\def\thefigure{\@arabic\c@figure}
\def\fnum@figure{\figurename~\thefigure}
\def\thetable{\@arabic\c@table}
\def\fnum@table{\tablename~\thetable}

% 设置标题前后间距
\setlength\abovecaptionskip{12bp}
\setlength\belowcaptionskip{12bp}

% 下面两条命令可以使图表的标题编号随着每开始新的一章而重新开始，即按章的顺序编号
\renewcommand{\thetable}{\arabic{chapter}.\arabic{table}}
\renewcommand{\thefigure}{\arabic{chapter}-\arabic{figure}}


% 定义新命令\hlinewd 来改变水平线的粗细
\def\hlinewd#1{%
  \noalign{\ifnum0=`}\fi\hrule \@height #1 \futurelet
    \reserved@a\@xhline}

% 表格行间距增大10%
\renewcommand{\arraystretch}{1.1}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 重定义 itemize, enumerate 和 description 环境，
% 使列表项的间距更紧凑。
% 这个定义和 paralist 宏包不兼容，所以不能加载 paralist 宏包
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% save original itemize, enumerate and description
\let\LaTeXitemize\itemize
\let\endLaTeXitemize\enditemize
\let\LaTeXenumerate\enumerate
\let\endLaTeXenumerate\endenumerate
\let\LaTeXdescription\description
\let\endLaTeXdescription\enddescription

% Space between first item and preceding paragraph
\newskip\HUSTtopsep
\HUSTtopsep 2pt plus 1pt minus 1pt

% the space between the end of the label box
% and the text of the first item.
% Its default value is 0.5em.
\newdimen\HUSTnormlabelsep
\HUSTnormlabelsep 0.5em

% new dimension the list labels are indented to the right.
% Normally, this is the same as the paragraph indention
\newdimen\labelindent
\labelindent \parindent

% the default amount of \labelindent.
% Normally, this is the same as the paragraph indention
\newdimen\HUSTlabelindent
\HUSTlabelindent \parindent

% This command provides an easy way to set \leftmargin based
% on the \labelwidth, \labelsep and the argument \labelindent
% Usage: \calcleftmargin{width-to-indent-the-label}
% output is in the \leftmargin variable, i.e., effectively:
% \leftmargin = argument + \labelwidth + \labelsep
\def\calcleftmargin#1{\setlength{\leftmargin}{#1}%
\addtolength{\leftmargin}{\labelwidth}%
\addtolength{\leftmargin}{\labelsep}}

% The actual amount labels will be indented is
% \labelindent multiplied by the factors below
% corresponding to the level of nesting depth
% This provides a means by which the user can
% alter the effective \labelindent for deeper
% levels
% The first list level almost always has full indention.
% The second levels I've seen have only 75% of the normal indentation
% Three level or greater nestings are very rare. I am guessing
% that they don't use any indentation.
% excerpted from IEEEtrantools.sty
\def\HUSTlabelindentfactori{1.2}   %
\def\HUSTlabelindentfactorii{0.75} % 0.0 or 1.0 may be used in some cases
\def\HUSTlabelindentfactoriii{0.0} % 0.75? 0.5? 0.0?
\def\HUSTlabelindentfactoriv{0.0}
\def\HUSTlabelindentfactorv{0.0}
\def\HUSTlabelindentfactorvi{0.0}

% factor value actually used within lists, it is auto
% set to one of the 6 values above
% global changes here have no effect
\def\labelindentfactor{1.0}

% provide original LaTeX itemize, enumerate and description
% environment from article.cls
\def\itemize{\@ifnextchar[{\@HUSTitemize}{\@HUSTitemize[\relax]}}
\def\enumerate{\@ifnextchar[{\@HUSTenumerate}{\@HUSTenumerate[\relax]}}
\def\description{\@ifnextchar[{\@HUSTdescription}{\@HUSTdescription[\relax]}}
\def\enditemize{\endlist}
\def\endenumerate{\endlist}
\def\enddescription{\endlist}

\def\@HUSTitemize[#1]{%
                \ifnum\@itemdepth>3\relax\@toodeep\else%
                \ifnum\@listdepth>5\relax\@toodeep\else%
                \advance\@itemdepth\@ne%
                \edef\@itemitem{labelitem\romannumeral\the\@itemdepth}%
                \advance\@listdepth\@ne%
                \edef\labelindentfactor{\csname HUSTlabelindentfactor\romannumeral\the\@listdepth\endcsname}%
                \advance\@listdepth-\@ne%
                \list{\csname\@itemitem\endcsname}{%
                \topsep\HUSTtopsep%
                \labelindent\HUSTlabelindent%
                \labelsep\HUSTnormlabelsep%
                \partopsep\z@%
                \parsep\z@%
                \itemsep\z@%
                \rightmargin\z@%
                \listparindent\z@%
                \itemindent\z@%
                \settowidth{\labelwidth}{\csname labelitem\romannumeral\the\@itemdepth\endcsname}%
                \def\makelabel##1{\makebox[\labelwidth][r]{\normalfont ##1}}%
                #1\relax%
                \labelindent=\labelindentfactor\labelindent%
                \calcleftmargin{\labelindent}%
                }
                \fi\fi}

% commands generating enumerate labels
\def\labelenumi{\theenumi.}\def\theenumi{\arabic{enumi}}
\def\labelenumii{(\theenumii)}\def\theenumii{\arabic{enumii}}
\def\labelenumiii{\theenumiii.}\def\theenumiii{\alph{enumiii}}
\def\labelenumiv{(\theenumiv)}\def\theenumiv{\alph{enumiv}}

\def\@HUSTenumerate[#1]{%
                \ifnum\@enumdepth>3\relax\@toodeep\else%
                \ifnum\@listdepth>5\relax\@toodeep\else%
                \advance\@enumdepth\@ne%
                \edef\@enumctr{enum\romannumeral\the\@enumdepth}%
                \advance\@listdepth\@ne%
                \edef\labelindentfactor{\csname HUSTlabelindentfactor\romannumeral\the\@listdepth\endcsname}%
                \advance\@listdepth-\@ne%
                \list{\csname label\@enumctr\endcsname}{
                \usecounter{\@enumctr}%
                \topsep\HUSTtopsep%
                \labelindent\HUSTlabelindent%
                \labelsep\HUSTnormlabelsep%
                \partopsep\z@%
                \parsep\z@%
                \itemsep\z@%
                \rightmargin\z@%
                \listparindent\z@%
                \itemindent\z@%
                \settowidth{\labelwidth}{(9)}%
                \def\makelabel##1{\makebox[\labelwidth][r]{\normalfont ##1}}%
                #1\relax%
                \labelindent=\labelindentfactor\labelindent%
                \calcleftmargin{\labelindent}%
                }\fi\fi}%

\def\@HUSTdescription[#1]{%
                \ifnum\@listdepth>5\relax\@toodeep\else%
                \advance\@listdepth\@ne%
                \edef\labelindentfactor{\csname HUSTlabelindentfactor\romannumeral\the\@listdepth\endcsname}%
                \advance\@listdepth-\@ne%
                \list{}{
                \topsep\HUSTtopsep%
                \labelindent\HUSTlabelindent%
                \labelsep\HUSTnormlabelsep%
                \partopsep\z@%
                \parsep\z@%
                \itemsep\z@%
                \rightmargin\z@%
                \listparindent\z@%
                \itemindent\z@%
                \settowidth{\labelwidth}{Hellohello}%
                \def\makelabel##1{\makebox[\labelwidth][r]{\normalfont ##1}}%
                #1\relax%
                \labelindent=\labelindentfactor\labelindent%
                \calcleftmargin{\labelindent}}\fi}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 重定义字体命令
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newCJKfontfamily[song]\song{Songti SC Regular}
\newCJKfontfamily[fs]\fs{STFangsong}
\newCJKfontfamily[hei]\hei{SimHei}
\newCJKfontfamily[kai]\kai{KaiTi}
\newCJKfontfamily[li]\li{LiSu}
\newCJKfontfamily[you]\you{YouYuan}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 重定义字号命令，采用薛瑞尼版本中关于字号命令的定义，
% 消除了字体大小和行距的紧耦合
% 命令中的可选参数用于指定行距，默认为单倍行距。
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newlength\HUST@linespace
\newcommand{\HUST@choosefont}[2]{%
  \setlength{\HUST@linespace}{#2*\real{#1}}%
  \fontsize{#2}{\HUST@linespace}\selectfont}
\newcommand{\chuhao}[1][\baselinestretch]{\HUST@choosefont{#1}{42pt}}
\newcommand{\xiaochu}[1][\baselinestretch]{\HUST@choosefont{#1}{36pt}}
\newcommand{\yihao}[1][\baselinestretch]{\HUST@choosefont{#1}{26pt}}
\newcommand{\xiaoyi}[1][\baselinestretch]{\HUST@choosefont{#1}{24pt}}
\newcommand{\erhao}[1][\baselinestretch]{\HUST@choosefont{#1}{22pt}}
\newcommand{\xiaoer}[1][\baselinestretch]{\HUST@choosefont{#1}{18pt}}
\newcommand{\sanhao}[1][\baselinestretch]{\HUST@choosefont{#1}{16pt}}
\newcommand{\xiaosan}[1][\baselinestretch]{\HUST@choosefont{#1}{15pt}}
\newcommand{\sihao}[1][\baselinestretch]{\HUST@choosefont{#1}{14pt}}
\newcommand{\banxiaosi}[1][\baselinestretch]{\HUST@choosefont{#1}{13pt}}
\newcommand{\xiaosi}[1][\baselinestretch]{\HUST@choosefont{#1}{12pt}}
\newcommand{\dawu}[1][\baselinestretch]{\HUST@choosefont{#1}{11pt}}
\newcommand{\wuhao}[1][\baselinestretch]{\HUST@choosefont{#1}{10.5pt}}
\newcommand{\xiaowu}[1][\baselinestretch]{\HUST@choosefont{#1}{9pt}}
\newcommand{\liuhao}[1][\baselinestretch]{\HUST@choosefont{#1}{7.5pt}}
\newcommand{\xiaoliu}[1][\baselinestretch]{\HUST@choosefont{#1}{6.5pt}}
\newcommand{\qihao}[1][\baselinestretch]{\HUST@choosefont{#1}{5.5pt}}
\newcommand{\bahao}[1][\baselinestretch]{\HUST@choosefont{#1}{5pt}}


% 正文小四号（12pt）字，行距为固定值18 pt，18/12=1.5倍行距
\renewcommand\normalsize{\fontsize{12pt}{18pt}\selectfont}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 用于中文段落缩进和正文版式
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newlength\CJKtwospaces
\def\CJKindent{%
  \settowidth\CJKtwospaces{{\hskip \f@size \p@}\CJKglue}%
  \parindent\CJKtwospaces}
 \newcommand{\Eindent}{\CJKindent\parindent2\CJKtwospaces}

% 段落之间的竖直距离
\setlength{\parskip}{0pt plus2pt minus1pt}

% 定理环境
\gdef\@endtrivlist#1{%  % from \endtrivlist
  \if@inlabel \indent\fi
  \if@newlist \@noitemerr\fi
  \ifhmode
     \ifdim\lastskip >\z@ #1\unskip \par  %<<<<<<<<<<<<<<<<<<<<<<
           \else #1\unskip \par \fi
  \fi
  \if@noparlist \else
    \ifdim\lastskip >\z@
       \@tempskipa\lastskip \vskip -\lastskip
      \advance\@tempskipa\parskip \advance\@tempskipa -\@outerparskip
      \vskip\@tempskipa
    \fi
    \@endparenv
  \fi #1}
\theoremstyle{plain}
\theorembodyfont{\song\rmfamily}
\theoremheaderfont{\hei\rmfamily}
%\theoremsymbol{\ensuremath{\blacksquare}}
\theoremsymbol{}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 定义正文中段落章节标题的格式
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 正文涉及 4 层，即: x.x.x.x
% chapter(0), section(1), subsection(2), subsubsection(3)
\setcounter{secnumdepth}{3}

% 章序号与章名之间空一个汉字符，黑体三号字，居中书写，单倍行距，
% 段前空24磅，段后	空20磅。
\def\@makechapterhead#1{%
 \vspace*{24bp}%
  \begingroup
  \hei\sanhao[1]\centering
    \ifnum \c@secnumdepth >\m@ne
      \thechapter\hskip1em
    \fi
    \interlinepenalty\@M
    #1\par\endgroup
    \nobreak
    \vskip 20bp
  }

\def\@makeschapterhead#1{%
  \vspace*{24bp}%
  \begingroup
  \hei\sanhao[1]\centering
  \interlinepenalty\@M
  #1\par\endgroup
  \nobreak
  \vskip 20bp
  }


% 一级节标题，例如：“2.1  理论分析”。
% 节标题序号与标题名之间空一个汉字符。
% 采用黑体四号（14pt）字居左书写，1.5倍行距（21pt），
% 段前空18磅，段后空6磅。
\def\@seccntformat#1{\csname the#1\endcsname\hskip 1em\relax}
\renewcommand\section{\@startsection {section}{1}{\z@}%
                                   {24bp}%
                                   {6bp}%
                                   {\hei\sihao[1.5]}}
% 二级节标题，例如：“2.1.1  理论分析”。
% 节标题序号与标题名之间空一个汉字符。
% 采用黑体半小四号（13.5pt）字居左书写，1.5倍行距（19.5pt），
% 段前空12磅，段后空6磅。
\renewcommand\subsection{\@startsection {subsection}{2}{\z@}%
                                   {12bp}%
                                   {6bp}%
                                   {\hei\banxiaosi[1.5]}}

% 三级节标题，例如：“2.1.1.1  理论分析”。
% 节标题序号与标题名之间空一个汉字符。
% 采用黑体小四号（12pt）字居左书写，1.5倍行距（18pt），
% 段前空12磅，段后空6磅。
\renewcommand\subsubsection{\@startsection {subsubsection}{3}{\z@}%
                                   {12bp}%
                                   {6bp}%
                                   {\hei\xiaosi[1.5]}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 应用 titletoc 宏包定义标题的目录项格式
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 目录涉及 2 层，即: x.x
% chapter(0), section(1), subsection(2), subsubsection(3)
\setcounter{tocdepth}{1}

%适当增加目录项的右边距
\contentsmargin{2.0em}

% 分别正文一级标题的两种目录项格式
\newcommand{\enabledottedtoc}{%仅显示标题，不显示指引线和页码
  \titlecontents{chapter}
              [0.0em]
              {\bfseries\song\addvspace{6bp minus6bp}}
              {\thecontentslabel\hspace{1em}}
              {}
              {\normalfont\dotfill\textrm{\contentspage[(\thecontentspage)]}}}
\newcommand{\disabledottedtoc}{%显示标题、指引线和页码
  \titlecontents{chapter}
              [1.5em]
              {\bf\song\addvspace{6bp minus6bp}}
              {\contentslabel{1.5em}}
              {}
              {}}

% 定义其它各级子标题的目录项格式
\titlecontents{section}
              [2.0em]
              {}
              {\contentslabel{2.0em}}
              {}
              {\dotfill\textrm{\contentspage[(\thecontentspage)]}}

\titlecontents{subsection}
              [0.0em]
              {}
              {\contentslabel{2.8em}}
              {}
              {\dotfill\textrm{\contentspage[(\thecontentspage)]}}

\titlecontents{subsubsection}
              [0.0em]
              {}
              {\thecontentslabel\hspace{1.0em}}
              {}
              {\dotfill\textrm{\contentspage[(\thecontentspage)]}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 定义页眉页脚，参考 fancyhdr 宏包的代码
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\headrulewidth}{0.4pt}
\newcommand{\footrulewidth}{0.4pt}
\def\ps@plain{%
  \ifHUST@finalformat
    \def\@oddhead{}
  \else
    \def\@oddhead{%
      \centering\vbox{%
      \setlength\titlewidth\textwidth
      \addtolength{\titlewidth}{-2cm}
        \centering\parbox[b]{\titlewidth}{\centering\color{mymauve}\sihao%
        \ziju{1.2pt}\kai\HUST@schoolename\HUST@apply}
%	\hbox to \titlewidth{\centering\sihao%
%        \ziju{0.5pt}\kai\HUST@schoolename\HUST@apply}
        \vskip3pt
        \vbox{\color{mymauve}\hrule width\textwidth height\headrulewidth depth0pt\vskip2pt\hrule width\textwidth}}}\fi%
    \let\@evenhead=\@oddhead
  \ifHUST@finalformat
   \def\@oddfoot{%
     \hbox to\textwidth{%
     \vbox{%
      \hfill\parbox[t]{\textwidth}{\centering\color{mymauve}\wuhao\thepage\strut}\hfill
      }}}
   \else
   \def\footrule{{\color{mymauve}\hrule\@width\textwidth\@height\footrulewidth\vskip0.3\normalbaselineskip}}
   \def\@oddfoot{%
     \vbox{%
      \footrule
      \parbox[b]{\textwidth}{
      \hfill\parbox[t]{\textwidth}{\centering\wuhao\thepage\strut}\hfill
      }}}
   \fi
      \let\@evenfoot=\@oddfoot}
\pagestyle{plain}
\renewcommand{\chaptermark}[1]{\markboth{\@chapapp \ ~~#1}{}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 定义脚注
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% 定义脚注修饰线
\def\footnoterule{\vskip-3\p@\hrule\@width0.3\textwidth\@height0.4\p@\vskip2.6\p@}

% 定义脚注大小
\let\HUST@footnotesize\footnotesize
\renewcommand\footnotesize{\HUST@footnotesize\xiaowu[1.3]} % 单倍行距太丑了，还是用1.3吧

% 重新定义生成脚注的命令
\let\HUST@fnsymbol\@fnsymbol
\renewcommand{\thefootnote}{\HUST@fnsymbol\c@footnote}
\renewcommand{\thempfootnote}{\HUST@fnsymbol\c@mpfootnote}
\def\@makefnmark{\textsuperscript{\makebox{\normalfont\@thefnmark}}}
\long\def\@makefntext#1{
    \bgroup
      \sbox\@tempboxa\makebox{%
          \hb@xt@ 2em{\@thefnmark\hss}}
      \leftmargin\wd\@tempboxa
      \rightmargin\z@
      \linewidth \columnwidth
      \advance \linewidth -\leftmargin
      \parshape \@ne \leftmargin \linewidth
      \footnotesize
      \@setpar{{\@@par}}%
      \leavevmode
      \llap{\box\@tempboxa}%
      #1
    \par\egroup}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 定义封面和封底
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\classno#1{\def\HUST@classno{#1}}\def\HUST@classno{}
\def\xuehao#1{\def\HUST@xuehao{#1}}\def\HUST@xuehao{}
\def\schoolcode#1{\def\HUST@schoolcode{#1}}\def\HUST@schoolcode{}
\def\caffiliate#1{\def\HUST@caffiliate{#1}}\def\HUST@caffiliate{}
\def\caffiliatename#1{\def\HUST@caffiliatename{#1}}\def\HUST@caffiliatename{}
\def\ctitle#1{\def\HUST@ctitle{#1}}\def\HUST@ctitle{}
\def\cdegree#1{\def\HUST@cdegree{#1}}\def\HUST@cdegree{}
\def\csubjectname#1{\def\HUST@csubjectname{#1}}\def\HUST@csubjectname{}
\def\cauthorname#1{\def\HUST@cauthorname{#1}}\def\HUST@cauthorname{}
\def\csupervisorname#1{\def\HUST@csupervisorname{#1}}\def\HUST@csupervisorname{}
\def\cassosupervisorname#1{\def\HUST@cassosupervisorname{#1}}\def\HUST@cassosupervisorname{}
\def\csupervisortitle#1{\def\HUST@csupervisortitle{#1}}\def\HUST@csupervisortitle{}
\def\cassosupervisortitle#1{\def\HUST@cassosupervisortitle{#1}}\def\HUST@cassosupervisortitle{}
\def\defencedate#1{\def\HUST@defencedate{#1}}\def\HUST@defencedate{}
\def\grantdate#1{\def\HUST@grantdate{#1}}\def\HUST@grantdate{}
\def\chair#1{\def\HUST@chair{#1}}\def\HUST@chair{}
\def\firstreviewer#1{\def\HUST@firstreviewer{#1}}\def\HUST@firstreviewer{}
\def\secondreviewer#1{\def\HUST@secondreviewer{#1}}\def\HUST@secondreviewer{}
\def\thirdreviewer#1{\def\HUST@thirdreviewer{#1}}\def\HUST@thirdreviewer{}
\long\def\cabstract#1{\long\def\HUST@cabstract{#1}}\long\def\HUST@cabstract{}
\def\ckeywords#1{\def\HUST@ckeywords{#1}}\def\HUST@ckeywords{}
\def\etitle#1{\def\HUST@etitle{#1}}\def\HUST@etitle{}
\def\edegree#1{\def\HUST@edegree{#1}}\def\HUST@edegree{}
\def\eaffil#1{\def\HUST@eaffil{#1}}\def\HUST@eaffil{}
\def\esubject#1{\def\HUST@esubject{#1}}\def\HUST@esubject{}
\def\eauthor#1{\def\HUST@eauthor{#1}}\def\HUST@eauthor{}
\def\esupervisor#1{\def\HUST@esupervisor{#1}}\def\HUST@esupervisor{}
\def\eassosupervisor#1{\def\HUST@eassosupervisor{#1}}\def\HUST@eassosupervisor{}
\def\ecosupervisor#1{\def\HUST@ecosupervisor{~ & #1\\}}\def\HUST@ecosupervisor{}
\def\edate#1{\def\HUST@edate{#1}}\def\HUST@edate{}
\newcommand{\tabincell}[2]{\begin{HUST@tabular}{@{}#1@{}}#2\end{HUST@tabular}}
\long\def\eabstract#1{\long\def\HUST@eabstract{#1}}\long\def\HUST@eabstract{}
\def\ekeywords#1{\def\HUST@ekeywords{#1}}\def\HUST@ekeywords{}

% 中文封面
\newcommand{\HUST@ctitlepage}{

  \begin{center}
  \vspace*{-2cm}
    \parbox[t][2cm][t]{\textwidth}{\sihao
    \begin{center}\song
    \setlength{\tabcolsep}{0pt}
    \setlength{\extrarowheight}{3pt}
    \let\textwidthcol\textwidth
    \addtolength{\textwidthcol}{-20em}
    \begin{HUST@tabular}{p{4em}p{5em}p{\textwidthcol}p{2em}p{9em}}
    \HUST@classno & \makebox[0pt][l]{\rule[-2.0pt]{5em}{1pt}} & \hfill &  \HUST@studentno & \makebox[0pt][l]{\rule[-2.0pt]{9em}{1pt}}{\hspace{2em}\ttfamily\HUST@xuehao} \tabularnewline
    \HUST@UDC & \makebox[0pt][l]{\rule[-2.0pt]{5em}{1pt}}{\hspace{1em}\ttfamily\HUST@schoolcode\hfill} & \hfill & \HUST@secrettitle & \makebox[0pt][l]{\rule[-2.0pt]{9em}{1pt}} \tabularnewline
    \end{HUST@tabular}
    \end{center}}
    
    \parbox[t][6cm][t]{\textwidth}{
    \vspace*{2cm}
    \begin{center}
    \includegraphics[height=1.5cm]{hust-flash-eps-crop.eps}\\
    \vspace*{0.5cm}
    \ziju{0.5pt}\chuhao{\hei\HUST@apply}%\CJKfamily{fzcs}
    \end{center}}
    
    
    \parbox[t][4cm][t]{25em}{
    \vspace*{2cm}
    \begin{center}
    \erhao[1.8] {\hei\HUST@ctitle}%\CJKfamily{fzcs}
   \end{center}}
   
   \parbox[t][7.4cm][t]{\textwidth}{\vspace*{2cm}\xiaoer[1.5]
    \begin{center}\song
    \setlength{\extrarowheight}{2.5pt}
    \begin{HUST@tabular}{p{7em}llp{12em}}
    \HUST@cauthor & \HUST@title@sep & {\HUST@cauthorname}\\
    \HUST@csubject & \HUST@title@sep & {\HUST@csubjectname}\\
    \HUST@csupervisor & \HUST@title@sep & {\HUST@csupervisorname\hspace{1em}\HUST@csupervisortitle}\\
    \HUST@cdefencedate & \HUST@title@sep & {\ziju{3bp}\HUST@defencedate}
    \end{HUST@tabular}
    \end{center}}

    \end{center}}

% 英文封面
\newcommand{\HUST@etitlepage}{%
    \vspace*{-1cm}
    \begin{center}
    \parbox[t][5.2cm][t]{\textwidth}{
      \renewcommand{\baselinestretch}{1.5}
      \begin{center}
        \sanhao[1.1] \textbf{A Thesis Submitted in Partial Fulfillment of the Requirements\\
         for the Degree for \HUST@edegree}
      \end{center}}
	
	%\vspace*{-1.5cm}
    \parbox[t][4cm][t]{\textwidth}{
      \renewcommand{\baselinestretch}{1.3}
      \begin{center}
        \xiaoer \textbf{\HUST@etitle}
     \end{center}}

    \vspace*{0.9cm}
    \let\textwidthcol\textwidth
    \addtolength{\textwidthcol}{-4cm}
    \begin{center}
    \parbox[t][2.1cm][t]{\textwidthcol}{
      \xiaosan[1.2]\bfseries%
      \begin{HUST@tabular}{llp{10em}}
        Candidate & : & \HUST@eauthor\\ \\
        Major & : & \HUST@esubject\\ \\
        Supervisor & : & \HUST@esupervisor 
      \end{HUST@tabular}}
      \end{center}
     
     \vspace*{2cm}
    \let\textwidthcol\paperwidth
    \addtolength{\textwidthcol}{-7.2cm}     
    \parbox[t][5cm][b]{\textwidthcol}{
    \begin{center}
    \sihao[2.0] {\bf{Huazhong University of Science \& Technology\\
    Wuhan~430074, P.~R.~China\\
    \HUST@edate}}
    \end{center}}
    
    \end{center}}

% 版权页
\newcommand{\HUST@authorization@mk}{%
    
    \begin{center}
    \parbox[t]{\textwidth}{{\sanhao \hei \centerline{\HUST@declare}}}
    
    \vspace*{1cm}
    \parbox[t]{\textwidth}{\xiaosi[2]\HUST@declaretext}

    \vspace*{1cm}
    \parbox[t]{\textwidth}{\xiaosi[1.5]
    \hfill\begin{HUST@tabular}{ll}
        \HUST@authorsig & \hspace{2em}\\
        \HUST@frontdate & \hspace{2em}\\
    \end{HUST@tabular}}
    \end{center}

    
    \begin{center}
     \vspace*{0.5cm}
    \parbox[t][0.5\normalbaselineskip][c]{\textwidth}{\sanhao \hei \centerline{\HUST@authtitle}}
   % \vspace*{cm}
       \parbox[t][5cm][c]{\textwidth}{\xiaosi[2]\HUST@authorization}\\
    \vspace*{2pt}
    \hspace*{2em}\parbox[t][1.5cm][c]{\textwidth}{\xiaosi[2]\HUST@authorizationaddon}
    \hspace*{2em}\parbox[t][1.5cm][c]{\textwidth}{\xiaosi[2]\HUST@authorizationcheck}
    \hspace*{2em}\parbox[t][1.5cm][b]{\textwidth-2em}{\xiaosi[1.5]
    \begin{HUST@tabular}{ll}
        \HUST@authorsig & \hspace{2em}\\
        \HUST@frontdate & \hspace{2em}\\
    \end{HUST@tabular}
    \hfill
    \begin{HUST@tabular}{ll}
        \HUST@teachersig & \hspace{2em}\\
        \HUST@frontdate & \hspace{2em}\\
    \end{HUST@tabular}}
    \end{center}
    \end{center}}


% 定义 \makecover
\newcommand{\makecover}{
    \begin{titlepage}
    \pagebreak[0]\raggedbottom
    \HUST@ctitlepage
    \clearpage\thispagestyle{empty}\pagebreak[0]\raggedbottom\HUST@etitlepage
    \end{titlepage}
    \clearpage\thispagestyle{empty}\HUST@authorization@mk
    \pagenumbering{Roman}
    \HUST@makeabstract}

%% 为了符合学校单面打印的要求，重定义 \mainmatter
\renewcommand\mainmatter{%
 \clearpage
  \@mainmattertrue
  \pagenumbering{arabic}}
  

% 定义中英文摘要
\newcommand{\HUST@makeabstract}{%

    % 定义中文摘要
    \clearpage
    \setcounter{page}{1}
    \phantomsection
    \titlecontents{chapter}%重定义摘要的目录项格式
                           %有指引线，有页码，页码无括号
           [0.0em]
           {\bfseries\addvspace{6bp minus6bp}}
           {\thecontentslabel\hspace{1em}}
           {}
           {\normalfont\dotfill\textrm{\bfseries\contentspage}}
    \addcontentsline{toc}{chapter}{摘~~~~要}
    \chapter*{\abstractname}
    \markboth{\abstractshortname}{\abstractshortname}
    \HUST@cabstract
    \\[1em]
    \noindent\begin{HUST@tabular}{@{}p{4em}@{}p{\textwidth-4em}}
    {\hei\HUST@keywords} & \HUST@ckeywords \\
    \end{HUST@tabular}
    
    % 定义英文摘要
    \clearpage
    \phantomsection
    \addcontentsline{toc}{chapter}{Abstract}
    \normalsize
    \chapter*{{\sffamily\bfseries Abstract}}
    \markboth{Abstract}{Abstract}
    \HUST@eabstract
    \\[1em]
    \noindent\begin{HUST@tabular}{@{}p{5em}@{}p{\textwidth-5em}}
    {\textbf{Key words:}} & \HUST@ekeywords\\
    \end{HUST@tabular}
    \disabledottedtoc%
    }

% 定义“符合对照表”环境，可选
\newenvironment{denotation}{
    %\cleardoublepage
    %\phantomsection
    %\addcontentsline{toc}{chapter}{Abstract}
    \chapter*{\HUST@denotation@name}
    \markboth{\HUST@denotation@name}{\HUST@denotation@name}
    \xiaosi[1.6]
    \noindent\begin{list}{}%
                {\renewcommand\makelabel[1]{##1\hfil}
                \setlength{\labelwidth}{2.5cm} %标签盒子宽度
                \setlength{\labelsep}{0.5cm} %标签与列表文本距离
                \setlength{\itemindent}{0cm} %标签缩进量
                \setlength{\leftmargin}{\labelwidth+\labelsep} %左边界
                \setlength{\rightmargin}{0cm}
                \setlength{\parsep}{0cm} %段落间距
                \setlength{\itemsep}{0cm} %标签间距
                \setlength{\listparindent}{0cm} %段落缩进量
                \setlength{\topsep}{0pt} %标签与上文的间距
    }}
    {\end{list}}%%%%%
    
% 定义封底的“致谢”
\newenvironment{ack}{
    \clearpage
    \phantomsection
    \enabledottedtoc
    \addcontentsline{toc}{chapter}{\HUST@ackname}
    \normalsize
    \chapter*{\HUST@ackname}}
   {}

% 定义附录及其目录项格式
\let\HUST@appendix\appendix 
\renewenvironment{appendix}{%
  \HUST@appendix
  %\gdef\@chapapp{\appendixname}~\thechapter
  \def\@makechapterhead##1{%重定义附录章节标题格式
  \vspace*{24bp}
  \begingroup
    \ifnum \c@secnumdepth >\m@ne
      \hei\sanhao[1]\centering
      \appendixname~\thechapter\hskip1em
    \fi
    \interlinepenalty\@M
    ##1\par\endgroup
    \nobreak
    \vskip 20bp
  }
  \gdef\thechapter{\@arabic\c@chapter}
  \renewcommand\theequation{\ifnum \c@chapter>\z@ \thechapter-\fi \@arabic\c@equation}
  \titlecontents{chapter}
              [0.0em]
              {\bf\addvspace{6bp minus6bp}}
              {\appendixname~\thecontentslabel\hspace{1em}}
              {}
              {\normalfont\dotfill\textrm{\contentspage[(\thecontentspage)]}}
  }{}
  
% 定义封底的“攻读博士学位期间发表的学术论文目录”
\newenvironment{publications}{
   \clearpage
   \phantomsection
   \chapter{\HUST@publication@title}
   \renewcommand{\labelenumi}{[\arabic{enumi}]}
   \begin{enumerate}
   }{\end{enumerate}}

% 定义封底的“攻读博士学位期间申请的发明专利和其他成果”
\newenvironment{patent}{
   \clearpage
   \phantomsection
   \chapter{\HUST@patent@title}
   \renewcommand{\labelenumi}{[\arabic{enumi}]}
   \begin{enumerate}
   }{\end{enumerate}}

% 定义封底的“攻读博士学位期间参与的科研项目”
\newenvironment{project}{
   \clearpage
   \phantomsection
   \chapter{\HUST@project@title}
   \renewcommand{\labelenumi}{[\arabic{enumi}]}
   \begin{enumerate}
   }{\end{enumerate}}
   

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 定义参考文献样式
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 结合 natbib 宏包定义参考文献样式
\bibpunct{[}{]}{,}{s}{}{,}
\renewcommand\NAT@citesuper[3]{\ifNAT@swa
\unskip\kern\p@\textsuperscript{\NAT@@open #1\NAT@@close}%
   \if*#3*\else\ (#3)\fi\else #1\fi\endgroup}
\DeclareRobustCommand\inlinecite{\@inlinecite}
\def\@inlinecite#1{\begingroup\let\@cite\NAT@citenum\citep{#1}\endgroup}
\renewenvironment{thebibliography}[1]{
     \clearpage
     \phantomsection % make sure the hyperlink is correct
     \enabledottedtoc%
     \addcontentsline{toc}{chapter}{\bibname}%
     \chapter*{\bibname}%
      \markboth{\bibname}{\bibname}%
      \wuhao[1.5]
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \addtolength{\itemsep}{-0.6em}
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \interlinepenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}
\urlstyle{same}% 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 定义生成索引的命令，暂时用不到
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\iffalse \newcommand{\bs}{\symbol{'134}}%Print backslash
 % \newcommand{\bs}{\ensuremath{\mathtt{\backslash}}}%Print backslash
 % Index entry for a command (\cih for hidden command index
\newcommand{\cih}[1]{%
\index{commands!#1@\texttt{\bs#1}}%
\index{#1@\texttt{\hspace*{-1.2ex}\bs #1}}
}
\newcommand{\ci}[1]{\cih{#1}\texttt{\bs#1}}
 % Package
\newcommand{\pai}[1]{%
\index{packages!#1@\textsf{#1}}%
\index{#1@\textsf{#1}}%
\textsf{#1}}
 % Index entry for an environment
\newcommand{\ei}[1]{%
\index{environments!\texttt{#1}}%
\index{#1@\texttt{#1}}%
\texttt{#1}}
 % Indexentry for a word (Word inserted into the text)
\newcommand{\wi}[1]{\index{#1}#1}
\fi


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 自定义命令
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 定义破折号
\newcommand{\pozhehao}{\kern0.3ex\rule[0.8ex]{2em}{0.1ex}\kern0.3ex}

% 定义关键字的间距
\newcommand{\keyspace}{\hspace{2em}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 开启 CJK 环境，加载 HUSTthesis.cpx 中文配置文件
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\AtBeginDocument{%
	\setCJKmainfont{Songti SC-Regular}
       \sloppy\Eindent
   }
\AtEndDocument{}
\endinput


%%%%%%%%%%%%%%%%%%%%%%%%%%%%% End of HUSTthesis.cls  %%%%%%%%%%%%%%%%%%%%%%%%%%%%
% That's all folks!



