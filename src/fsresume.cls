% A simple template for a CV/resume using minipages.
%
% The class file has been written in a as simple way as possible to make it
% easy for the user to edit it according to his/her needs.
%
% This template has been downloaded from:
% https://github.com/fileds/fsresume
%
% Original author:
% Filip Edström <filip.edstrom@gmail.com>
%
% Template license:
% CC BY-SA 4.0 (https://creativecommons.org/licenses/by-sa/4.0/)
%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{fsresume}[2019/11/21, v1.0]
\RequirePackage{ifthen}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions*
\LoadClass{article}

% Included packages
\RequirePackage{ifpdf}
\RequirePackage[utf8]{inputenc}
\RequirePackage{array}
\RequirePackage{xcolor}
\RequirePackage{fancyhdr}
\RequirePackage{graphicx}
\RequirePackage{fontawesome}

% Ruler and column types for experiences
\definecolor{lightgray}{gray}{0.8}
\newcolumntype{L}{>{\raggedleft}p{0.14\textwidth}}
\newcolumntype{R}{p{0.8\textwidth}}
\newcommand{\GrayVRule}{{\color{lightgray}\vrule width 0.5pt}}

% Header and footer settings
\newcommand{\MyFooter}[1]{\def\@MyFooter{#1}}
\fancypagestyle{plain}
  {%
    \fancyhf{} % clear all header and footer fields
    \fancyfoot[C]{\footnotesize\@MyFooter} % except the center
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footrulewidth}{0pt}
  }

% Points command for printing skill oints 1/5
\newcount\my@repeat@count
\newcommand{\Points}[1]
  {%
    \begingroup
    \my@repeat@count=\z@
    \@whilenum\my@repeat@count<#1\do{$\bullet$\advance\my@repeat@count\@ne}%
    \@whilenum\my@repeat@count<5\do{$\circ$\advance\my@repeat@count\@ne}%
    \endgroup
  }

% Defining the different blocks of the resume as environments
\newenvironment{LeftColumn}
  {%
    \begin{minipage}[b][\textheight][t]{0.7\textwidth}
  }
  {%
    \end{minipage}
  }

\newenvironment{TitleBlock}
  {%
    \begin{minipage}[t][0.1\textheight][t]{\textwidth}
      \begin{center}
  }
  {%
      \end{center}
    \end{minipage}
     \vfill
     \null
  }

% Commands to print the title
\newcommand{\MyName}[1]{\def\@MyName{#1}}
\newcommand{\MyEmail}[1]{\def\@MyEmail{#1}}
\newcommand{\MyPhoneNumber}[2]{\def\@MyPhoneNumber{#1}\def\@LinkNumber{#2}}
\newcommand{\MyAdress}[1]{\def\@MyAdress{#1}}
\newcommand{\MakeCvTitle}{%
      {\Huge\bf \@MyName} \\
      \vspace{10pt}
      \ifthenelse{\isundefined{\@MyEmail}}{ }{%
        \faEnvelope \,
        \href{mailto:\@MyEmail}{\@MyEmail} \,
      }
      \ifthenelse{\isundefined{\@MyPhoneNumber}}{ }{%
        \faPhone \,
        \href{tel:\@LinkNumber}{\@MyPhoneNumber}
      }
      \ifthenelse{\isundefined{\@MyAdress}}{ }{%
        \\ \faHome \, \@MyAdress
      }
}

\newenvironment{ExperienceBlock}
  {%
    \begin{minipage}[b][0.88\textheight][b]{\textwidth}
  }
  {%
      \vfill
      \null
    \end{minipage}
  }

\newenvironment{ExperienceSection}[1]
  {%
    \section*{#1}
    \begin{tabular}{L!{\GrayVRule}R}
  }
  {%
    \end{tabular}
  }

% Skips to separate experiences
\newcommand{\ExpTitleSkip}[1]{\def\@ExpTitleSkip{#1}}
\newcommand{\ExpSkip}[1]{\def\@ExpSkip{#1}}
\newcommand{\Experience}[4][\@ExpSkip]{%
  #2  & {\it\large #3} \@ExpTitleSkip
      & #4 #1
}

\newcommand{\MyPhoto}[2][6cm]{\def\@MyPhotoHeight{#1}\def\@MyPhoto{#2}}
\newenvironment{ProfileColumn}
  {%
    \begin{minipage}[b][\textheight][b]{0.23\textwidth}
      \ifthenelse{\isundefined{\@MyPhoto}}{ }{%
        \begin{center}
          \includegraphics[width=\textwidth,%
                           height=\@MyPhotoHeight,%
                           keepaspectratio]{\@MyPhoto}
        \end{center}
      }
    }
  {%
      \vfill
      \null
    \end{minipage}
  }

\newenvironment{SkillsSection}[1]
  {%
    \section*{#1}
    \begin{tabular}{@{}p{0.5\textwidth}l}
  }
  {%
    \end{tabular}
  }

  \newcommand{\Skill}[3][\\]{%
  #2  & \Points{#3} #1
}

\AtBeginDocument{%
  \pagestyle{plain}
}
