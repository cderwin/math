\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{solutions}

\LoadClass[11pt]{exam}

\def\Author{}
\newcommand{\setauthor}[1]{
    \author{#1}\let\Author\@author
}

\def\Title{}
\newcommand{\settitle}[1]{
    \title{#1}\let\Title\@title
}

% Prefix for numedquestions
\newcommand{\questiontype}{Question}

% Use this if your "written" questions are all under one section
% For example, if the homework handout has Section 5: Written Questions
% and all questions are 5.1, 5.2, 5.3, etc. set this to 5
% Use for 0 no prefix. Redefine as needed per-question.
\newcommand{\writtensection}{0}

% Uncomment the following line to get Solarized-themed source listings
% You will have had to already installed the solarized-light package
% https://github.com/jez/latex-solarized
%
%\usepackage{solarized-light}

\setlength{\parindent}{0pt}
\setlength{\parskip}{5pt plus 1pt}
\pagestyle{empty}

\def\indented#1{\list{}{}\item[]}
\let\indented=\endlist

\newcounter{questionCounter}
\newcounter{partCounter}[questionCounter]

\newenvironment{namedquestion}[1][\arabic{questionCounter}]{%
    \addtocounter{questionCounter}{1}%
    \setcounter{partCounter}{0}%
    \vspace{.2in}%
        \noindent{\bf #1}%
    \vspace{0.3em} \hrule \vspace{.1in}%
}{}

\newenvironment{question}[0]{%
	\stepcounter{questionCounter}%
    \vspace{.2in}%
        \ifx\writtensection\undefined
        \noindent{\bf \questiontype \; \arabic{questionCounter}. }%
        \else
          \if\writtensection0
          \noindent{\bf \questiontype \; \arabic{questionCounter}. }%
          \else
          \noindent{\bf \questiontype \; \writtensection.\arabic{questionCounter} }%
        \fi
    \vspace{0.3em} \hrule \vspace{.1in}%
}{}

\newenvironment{tquestion}[1]{
    \addtocounter{questionCounter}{1}
    \setcounter{partCounter}{0}
    \vspace{.2in}
        \noindent{\bf \questiontype \; #1}
    \vspace{0.3em} \hrule \vspace{.1in}
}{}

\newenvironment{alphaparts}[0]{%
  \begin{enumerate}[label=\textbf{(\alph*)}]
}{\end{enumerate}}

\newenvironment{arabicparts}[0]{%
  \begin{enumerate}[label=\textbf{\arabic{questionCounter}.\arabic*})]
}{\end{enumerate}}

\newenvironment{questionpart}[0]{%
  \item
}{}

\newcommand{\answerbox}[1]{
\begin{framed}
\vspace{#1}
\end{framed}}

\pagestyle{head}

\headrule
\header{\Author}
{\Title}
{Section \thesection}

\renewcommand{\maketitle}[0]{
    \thispagestyle{plain}
    \begin{center}
        {\Large \Title} \\
        \Author \\
        \today
    \end{center}
}
