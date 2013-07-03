\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{tktltiki2}[2013/04/28 v1.04 Template for theses and seminar papers at University of Helsinki CS department]
\RequirePackage{calc}
\RequirePackage[pass]{geometry}[2010/09/12 v5.6 Page Geometry]
\RequirePackage{babel}

\newif\if@grading
\newif\if@lastpagecounter
\newif\if@useclassification
\@lastpagecountertrue

% -- Language options --

\DeclareOption{finnish}{}
\DeclareOption{swedish}{}
\DeclareOption{english}{}
\DeclareOption{grading}{\@gradingtrue}
\DeclareOption{disablelastpagecounter}{\@lastpagecounterfalse}

% -- Options passed to article --

\DeclareOption{10pt}{\PassOptionsToClass{10pt}{article}}
\DeclareOption{11pt}{\PassOptionsToClass{11pt}{article}}
\DeclareOption{12pt}{\PassOptionsToClass{12pt}{article}}
\DeclareOption{final}{\PassOptionsToClass{final}{article}}
\DeclareOption{draft}{\PassOptionsToClass{draft}{article}}
\DeclareOption{oneside}{\PassOptionsToClass{oneside}{article}}
\DeclareOption{twoside}{\PassOptionsToClass{twoside}{article}}
\DeclareOption{openright}{\PassOptionsToClass{openright}{article}}
\DeclareOption{openany}{\PassOptionsToClass{openany}{article}}
\DeclareOption{onecolumn}{\PassOptionsToClass{onecolumn}{article}}
\DeclareOption{twocolumn}{\PassOptionsToClass{twocolumn}{article}}
\DeclareOption{leqno}{\PassOptionsToClass{leqno}{article}}
\DeclareOption{fleqn}{\PassOptionsToClass{fleqn}{article}}
\ProcessOptions
\LoadClass[titlepage,a4paper,11pt]{article}


% -- Setup for string commands --

\newcommand{\@university}{UNIVERSITY OF HELSINKI}
\newcommand{\@faculty}{Faculty of Science}
\newcommand{\@department}{Department of Computer Science}
\newcommand{\@subject}{Computer Science}
\newcommand{\@city}{Helsinki}
\newcommand{\@level}{}
\newcommand{\@depositeplace}{}
\newcommand{\@additionalinformation}{}
\newcommand{\@numberofpagesinformation}{\numberofpages}
\newcommand{\@classification}{}
\newcommand{\@keywords}{}
\newcommand{\@abstract}{}
\newcommand{\@universitylong}{HELSINGIN YLIOPISTO --- HELSINGFORS UNIVERSITET --- UNIVERSITY OF HELSINKI}


\newcommand{\@dateofacceptance}{Date of acceptance}%
\newcommand{\@grade}{Grade}%
\newcommand{\@instructor}{Instructor}%
\newcommand{\@ccs}{ACM Computing Classification System (CCS):}%


% -- External commands for setup --

\newcommand{\university}[1]{\renewcommand{\@university}{#1}}
\newcommand{\universitylong}[1]{\renewcommand{\@universitylong}{#1}}
\newcommand{\city}[1]{\renewcommand{\@city}{#1}}
\newcommand{\faculty}[1]{\renewcommand{\@faculty}{#1}}
\newcommand{\department}[1]{\renewcommand{\@department}{#1}}
\newcommand{\subject}[1]{\renewcommand{\@subject}{#1}}
\newcommand{\level}[1]{\renewcommand{\@level}{#1}}
\newcommand{\depositeplace}[1]{\renewcommand{\@depositeplace}{#1}}
\newcommand{\additionalinformation}[1]{\renewcommand{\@additionalinformation}{#1}}
\newcommand{\numberofpagesinformation}[1]{\renewcommand{\@numberofpagesinformation}{#1}}
\newcommand{\classification}[1]{
    \renewcommand{\@classification}{#1}
    \@useclassificationtrue
}
\newcommand{\keywords}[1]{\renewcommand{\@keywords}{#1}}
\renewcommand{\abstract}[1]{\renewcommand{\@abstract}{#1}}


% -- Language-dependent strings --

\iflanguage{finnish}{
    \renewcommand{\@dateofacceptance}{hyv\"aksymisp\"aiv\"a}%
    \renewcommand{\@grade}{arvosana}%
    \renewcommand{\@instructor}{arvostelija}%
    \university{HELSINGIN YLIOPISTO}
    \faculty{Matemaattis-luonnontieteellinen}
    \department{Tietojenk\"asittelytieteen laitos}
    \subject{Tietojenk\"asittelytiede}
}{}
\iflanguage{swedish}{
    \renewcommand{\@dateofacceptance}{godk.datum}%
    \renewcommand{\@grade}{vitsord}%
    \renewcommand{\@instructor}{bed\"omare}%
    \university{HELSINGFORS UNIVERSITET}
    \faculty{Matematisk-naturvetenskapliga fakulteten}
    \department{Institutionen f\"or datavetenskap}%
    \subject{Datavetenskap}
    \city{Helsingfors}
}{}


% -- Automatic page counting magic --

\newcommand{\lastpage}{%
  \label{lastpage}%
}

\newcommand{\numberofpages}{%
  \@ifundefined{r@lastpage}{0}{\pageref{lastpage}}%
}

\if@lastpagecounter
\AtEndDocument{%
    \lastpage
}
\fi


% -- Front matter and main matter --

\newcommand\frontmatter{%
    \pagenumbering{roman}}
  
\newcommand\mainmatter{%
    \clearpage
    \pagenumbering{arabic}}


% -- Title page --

\newcommand{\@maketitle}{
\begin{titlepage}%
{
    \newgeometry{scale=0.7,marginratio={1:1, 1:1},ignoreall}
    \setlength{\parindent}{0pt}
    \newlength{\sideindent}%
    \setlength{\sideindent}{\textwidth - 15mm - \widthof{\@dateofacceptance \@grade}}%
    \newlength{\lowerspace}%
    \setlength{\lowerspace}{0.6\textheight-10\baselineskip}%
    \large
    \if@grading
        \hspace{\sideindent} \@dateofacceptance \hspace{10mm} \@grade

        \vspace{2\baselineskip}
  
        \hspace{\sideindent} \@instructor
    \fi
  
    \vspace*{\fill}


    {\Large\bfseries \@title}

    \vspace{2\baselineskip}

    \@author

    \vspace{\lowerspace}

    \@level\\
    \@university\\
    \@department

    \vspace{2\baselineskip}

    \@city,\ \@date
    \restoregeometry
}
\end{titlepage}%

}

% If hyperref is loaded, we'll disable pageanchors before printing the title page
% and enable them again afterwards. Due to the way article handles title pages,
% hyperref will create duplicate page anchors and complain without this workaround.
% Though that would be harmless even if it happened, it's nicer if it does not.

\AtBeginDocument{
    \@ifpackageloaded{hyperref}{
        \renewcommand{\maketitle}{
            \hypersetup{pageanchor=false}
            \@maketitle
            \hypersetup{pageanchor=true}
        }
    }
    {
        \renewcommand{\maketitle}{\@maketitle}
    }
}

% -- "Tiivistelmasivu" --
% the following code is mostly inherited from the Old Ones
% approach with caution


\newcommand{\abst@small}{\fontsize{10}{12}\selectfont}
\newcommand{\abst@tiny}{\fontsize{6}{7}\selectfont}

\newcommand{\makeabstract}{%
\thispagestyle{empty}
\newgeometry{textwidth=580pt, textheight=845pt}
\noindent
\begin{picture}(580,845)
\put(58,  784){\makebox(100, 8)[l]{\abst@small\@faculty}}
\put(289, 784){\makebox(100, 8)[l]{\abst@small\@department}}
\put(58,  761){\makebox(100, 8)[l]{\abst@small\@author}}
\put(58,  727){\makebox(200, 8)[l]{\abst@small\@title}}
\put(58,  704){\makebox(100, 8)[l]{\abst@small\@subject}}
\put(58,  681){\makebox(100, 8)[l]{\abst@small\@level}}
\put(212, 681){\makebox(100, 8)[l]{\abst@small\@date}}
\put(366, 681){\makebox(100, 8)[l]{\abst@small\@numberofpagesinformation}}
\put(58,  94) {\makebox(100, 8)[l]{\abst@small\@keywords}}
\put(58,  72) {\makebox(100, 8)[l]{\abst@small\@depositeplace}}
\put(58,  35) {\makebox(100, 8)[l]{\abst@small\@additionalinformation}}
\put(83, 640){
    \parbox[t]{402pt}{
        \abst@small\setlength{\parindent}{2em}\noindent\@abstract
        
        \if@useclassification
          \vspace{2\baselineskip}
          \noindent \@ccs \\\@classification
        \fi
    }
}
\put(53,30){\framebox(462,786){}}
\put(53,779){\line(1,0){462}}
\put(53,756.24){\line(1,0){462}}
\put(53,722.1){\line(1,0){462}}
\put(53,699.34){\line(1,0){462}}
\put(53,676.58){\line(1,0){462}}
\put(53,67){\line(1,0){462}}
\put(53,89.76){\line(1,0){462}}
\put(53,112.52){\line(1,0){462}}
\put(284,779){\line(0,1){37}}
\put(207,676.58){\line(0,1){22.76}}
\put(361,676.58){\line(0,1){22.76}}
\put(58,809){\makebox(150,6)[l]{\abst@tiny Tiedekunta --- Fakultet --- Faculty}}
\put(289,809){\makebox(100,6)[l]{\abst@tiny Laitos --- Institution --- Department}}
\put(58,773){\makebox(100,5)[l]{\abst@tiny Tekij\"a --- F\"orfattare --- Author}}
\put(58,750){\makebox(100,5)[l]{\abst@tiny Ty\"on nimi --- Arbetets titel --- Title}}
\put(58,716){\makebox(100,5)[l]{\abst@tiny Oppiaine --- L\"aro\"amne --- Subject}}
\put(58,693){\makebox(100,5)[l]{\abst@tiny Ty\"on laji --- Arbetets art --- Level}}
\put(212,693){\makebox(100,5)[l]{\abst@tiny Aika --- Datum --- Month and year }}
\put(366,693){\makebox(100,5)[l]{\abst@tiny Sivum\"a\"ar\"a --- Sidoantal ---
    Number of pages}}
\put(58,670){\makebox(100,5)[l]{\abst@tiny Tiivistelm\"a --- Referat --- Abstract}}
\put(58,106){\makebox(100,5)[l]{\abst@tiny Avainsanat --- Nyckelord --- Keywords}}
\put(58,83){\makebox(100,5)[l]{\abst@tiny S\"ailytyspaikka --- F\"orvaringsst\"alle
--- Where deposited}}
\put(58,61){\makebox(100,5)[l]{\abst@tiny Muita tietoja --- \"Ovriga uppgifter
--- Additional information}}
\put(53,821){\makebox(100,8)[l]{\abst@small \@universitylong}}
\end{picture}
\restoregeometry
\newpage
}

