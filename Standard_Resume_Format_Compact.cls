\ProvidesClass{mycv}[IITM Standard Template CV]
%Loads the article class as the base template for further changes
\LoadClass{article}
%Following are all the packages required for this class file
\RequirePackage{titlesec}
\RequirePackage{palatino}
\RequirePackage[hmargin=.4in, vmargin=.2in]{geometry}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{graphicx}
\RequirePackage{fontawesome}
\RequirePackage{multicol}
\RequirePackage{array}
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage{lmodern}
\RequirePackage[dvipsnames]{xcolor}
\RequirePackage{vwcol}
\RequirePackage[letterspace=50]{microtype}
\usepackage{color, colortbl, xcolor}
\usepackage{hyperref}
\RequirePackage{parcolumns}
\RequirePackage{tabularx}
\definecolor{Gray}{rgb}{0.9,0.9,0.9}
%Define fields that the user can set

\renewcommand{\familydefault}{\sfdefault}

\newcommand{\colorsection}[1]{%
    \hrulefill
    \colorbox{Gray}{\parbox{\columnwidth}{\bfseries \scshape \large #1 \strut}}
    \hrulefill
}

\newcommand{\notopcolorsection}[1]{%
    \colorbox{Gray}{\parbox{\textwidth}{\scshape \large #1 \strut}}
    \hrule
}
  

\makeatletter
  \newcommand{\RollNumber}[1]{\def \@RollNumber {#1}}
  \newcommand{\Address}[1]{\def \@Address {#1}}
  \newcommand{\PhoneNumber}[1]{\def \@PhoneNumber {#1}}
  \newcommand{\Email}[1]{\def \@Email {  \href{mailto:#1}{\nolinkurl{#1}}      } } %%dhuredit  
  \newcommand{\CourseVar}[1]{\def \@CourseVar {#1}}
  \newcommand{\Linkedin}[2]{\def \@Linkedin {\href{#1}{#2}}}
  \newcommand{\Github}[1]{\def \@Github {\href{https://www.github.com/#1}{#1}}}
  \RollNumber{}
  \Address{}
  \PhoneNumber{}
  \Email{}
  \CourseVar{}
\makeatother

%Defines how the title will look
\makeatletter
\def \maketitle{%
    \thispagestyle{empty}
    \pagestyle{empty}
    \begin{minipage}[1.0\textwidth]{1.0\textwidth}
        \raggedright %\vspace{1em} 
        {\large  \@author {}  \bfseries \@RollNumber} %Puts name and roll number
    {\normalsize \\B V Raju Institute of Technology} %Puts insti name
    \vspace{-0.2em}
    
    \hrulefill
    \vspace{-1.4em}
    \begin{multicols}{2}
    {\small \faicon{phone} \@PhoneNumber}
    %{\small \faicon{github} \@Github}\\
    {\small \faicon{linkedin} \@Linkedin}\href{https://www.linkedin.com/in/vinay-sanda-}{vinay sanda}\\
    {\small \faicon{envelope} \@Email}
    \end{multicols}
    \vspace{-1.4em}
    \end{minipage}
    %\begin{minipage}[0.5\textwidth]{.4\textwidth}
	%\vspace{.2em}    
    %\raggedright
    %\@Address %Address of the student
    %\\[0.2em]
    %\begin{minipage}[0.5\textwidth]{\textwidth}
	    %\raggedright    
	    %\@PhoneNumber \ $|$ \@Email%\href{mailto:\@Email}\@Email %dhuredit%
	%\end{minipage}	
    %\end{minipage}
    \vspace{1.0em} \hrule
}
\makeatother

%Define lengths that might be used later on in the document
\newlength{\EduTableOne}
\newlength{\EduTableTwo}
\newlength{\EduTableThree}
\newlength{\EduTableFour}
\newlength{\EduTableFive}

%\setlength{\fboxsep}{1pt}%
\setlength{\fboxrule}{0.1pt}%

%Create a new variable TwoColumn to check for two-column format
\newif\ifLeftTwoColumn
\newif\ifRightTwoColumn
\newif\ifTwoColumn
\newif\ifCourse

%Set paragraph indent and lengths of previously defined variables
\setlength{\parindent}{0em}
\settowidth{\EduTableOne}{Dual Degree in Mechanical Engineering}
\settowidth{\EduTableTwo}{Indian Institute of Technology Madras}
\settowidth{\EduTableThree}{\%/CGPA}
\settowidth{\EduTableFour}{Completion}
\settowidth{\EduTableFive}{Rank}

%Reformat section, subsection and subsubsection as needed
\titleformat{\section}{\large\scshape\raggedright\lsstyle}{}{0em}{}[\titleline{\titlerule}]
\titleformat{\subsection}{\normalsize\raggedright}{}{0em}{}[\titleline{\hrulefill\vspace{-0.1em}}]
%\titleformat{\subsection}{\normalsize\bf\scshape\raggedright}{}{.5em}{}
\titleformat{\subsubsection}[runin]{\bf\large\raggedright}{$\vcenter{\hbox{{$\cdot$}}}$}{0em}{}

%Change the spacing options for section, subsection and subsubsection
%The first parameter specifies the gap from the margin in the default case
%and the indentation just before the title for runin
%The second parameter specifies the vertical space before the title
%The third parameter specifies the separation between title and text
\titlespacing{\section}{0em}{0.25em}{0.1em}
\titlespacing{\subsection}{0em}{.25em}{.15em}
\titlespacing{\subsubsection}{0pt}{0em}{0em}



%Defines a new environment called Education that is dedicated for 
%creating the table for filling in details about education. The command
%\EduDetails must be used in order to enter stuff in here
\newenvironment{EducationTable}{%%
\begin{tabular*}{0.99\textwidth}{l @{\extracolsep{\fill}} l  r r}%p{\EduTableOne} @{\extracolsep{\fill}} p{\EduTableTwo} p{\EduTableThree} p{\EduTableFour} p{\EduTableFive}
      {\bfseries Program} & {\bfseries Institution} & {\bfseries CGPA} & {\bfseries Completion}\\%[0.1em] %
}
{
\end{tabular*}%
}
      
%Create a new environment specifically for course related content

\newenvironment{Course}{%
  \TwoColumntrue
  \vspace{-1em}
  \begin{multicols}{2}
    \raggedright
}
{
\end{multicols}
\TwoColumnfalse
}
%\newenvironment{Course}[1]{%
%  \LeftTwoColumntrue
%  \RightTwoColumnfalse
%  \Coursetrue
%  \section{#1}
%%  \begin{tabular*}{.8\textwidth}{p{0.4\textwidth} p{0.4\textwidth}}
%}
%{\end{tabular*}
%\RightTwoColumntrue
%\LeftTwoColumnfalse
%\Coursefalse
%}


%Define new commands
%Define a new dated section type (NOT needed for IITM format)
\newcommand{\datedsection}[2]{%
	%\vspace{-0.5em}  
  \subsection[#1]{\normalsize$\bullet$ #1 \hfill \raggedleft{\itshape{\small #2}}}
}

%Define a new dated subsection that can be used for filling in project 
%durations etc.
\newcommand{\datedsubsection}[2]{%
  \subsubsection[#1]{#1 \hfill #2}%
}

\newcommand{\multitable}[2]{%
  %\subsubsection[#1]{#1 \hfill #2}%
	%\fbox{
  \vspace{0em}
  \begin{minipage}[\textwidth]{0.12\textwidth}
	\raggedright  
	
	  { \small  \bf #1 }
	
  \end{minipage}
  \hspace{0.001\textwidth}
  \begin{minipage}[\textwidth]{0.86\textwidth}
  \raggedleft
  {\small \raggedright #2 }
  \end{minipage}
  %}
  
%  \\[0.1em] \titlerule
 
}
\newcommand{\multitablenl}[2]{%
  %\subsubsection[#1]{#1 \hfill #2}%
\fbox{  
  \vspace{0.1em}
  \begin{minipage}[\textwidth]{0.12\textwidth}
	\raggedright  
	
	  { \small  \bf #1 }
	
  \end{minipage}
  \hspace{0.001\textwidth}
  \begin{minipage}[\textwidth]{0.86\textwidth}
  \raggedleft
  {\small \raggedright #2 }
  \end{minipage}
  }
 
}
%Define a new command called \Point which will take care of indentation and 
%allow you to fill in stuff inside a subsection
\newcommand{\Point}[1]{%
  \subsubsection{\tiny}%
  \raggedright
  \hangindent=0em\hangafter=1\noindent%
  \ifTwoColumn
    \parbox[t]{\textwidth}{#1}
  \else{\hspace{0.1em} \small #1}%
  \fi
  \par%
}
\newcommand{\subPoint}[1]{% 
  \subsubsection{\tiny}%
  \raggedright
  \hangindent=0em\hangafter=1\noindent%
  \ifTwoColumn
    \parbox[t]{\textwidth}{#1}
  \else{\hspace{0.1em} \small #1}%
  \fi
  \par%
}
\newcommand{\dPoint}[2]{%
  \subsubsection{}%
  \raggedright
  \hangindent=0em\hangafter=1\noindent%
  \ifTwoColumn
    \parbox[t]{.4\textwidth}{#1 \hfill #2}
  \else{\hspace{0.1em} #1\hfill#2}%
  \fi
  \par%
}
%\newcommand{\Point}[1]{%
%  %\subsubsection{}
%  \ifCourse
%    \ifLeftTwoColumn
%      
%      \begin{minipage}{.4\textwidth}
%	\subsubsection{} #1
%      \end{minipage}
%      \RightTwoColumntrue
%      \LeftTwoColumnfalse
%    %\fi
%    %\ifRightTwoColumn%
%    \else
%      \begin{minipage}{.4\textwidth}
%	\subsubsection{} #1
%      \end{minipage}
%      \RightTwoColumnfalse
%      \LeftTwoColumntrue
%    \fi
%  \else
%    \subsubsection{} 
%    \hangindent=3.45em\hangafter=1\noindent%
%    #1
%  \fi
%}


%Define the \EduDetails command that must be used inside an Education
%environment defined above
\newcommand{\EduDetails}[4]{%
\small {#1}  & {#2}  & {#3}  & {#4}\\ %
}

\newcommand{\Body}[2]{%
%\begin{minipage}[t]{0.645\textwidth}
%#2
%\end{minipage}
%\hspace{1em}
%\begin{minipage}[t]{0.33\textwidth}
%#1
%\end{minipage}
%\begin{multicols}{2}
  #1
  #2
%\end{multicols}
}
