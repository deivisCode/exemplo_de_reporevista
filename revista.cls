
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{revista}[2025/01/01 Clase para a revista de Fisica USC]

% NOTA: poderíase usar a clase 'memoir'. Ten varias vantaxes, pero deume pereza
% meterme con eso. Para mellorar o estilo 'twocolumn' pode usarse o paquete
% 'multicols'. Véxase:
% https://www.overleaf.com/learn/latex/Multiple_columns
% https://tex.stackexchange.com/a/285444
\LoadClass[12pt,a4paper,twocolumn,twoside]{book}

% Tipo de letra. Cortesía de LuaLaTeX. É extremadamente fácil:
% \RequirePackage{fontspec}
% \setmainfont{FiraCodeNerdFont-Regular}

% usar galego (como debe ser)
\RequirePackage[galician]{babel}
% Usar babel pode fastidiar as citas con biblatex, asique hai que usar 'csquotes'
\RequirePackage{csquotes}

% BIBLIOGRAFIAAAA
\RequirePackage[
    style = alphabetic,
    natbib = true
]{biblatex}
\addbibresource{bibliografia.bib}

% cores
\RequirePackage{xcolor}

\RequirePackage[
% XERAL ---------------------------------------------------------
    paper          = a4paper, % tamaño do papel
    % landscape      = false,   % orientación do papel
    % portrait       = true,    % outra maneira de dar a orientacion
    % layout         = a6paper, % area útil, independente do tamaño do papel
    % layouthoffset  = 10mm,    % desplazamento independente do papel
    % layoutvoffset  = 10mm,    % tamaños independentes
    % layoutwidth    = 150mm,   % (non sei como explicar qué fan XD)
    % layoutheight   = 190mm,   %
% MARXES DO CORPO -----------------------------------------------
    top            = 20mm,  % marxe superior
    left           = 20mm,  % marxe esquerdo
    right          = 20mm,  % marxe dereito
    bottom         = 20mm,  % marxe inferior
% NOTAS AO MARXE ------------------------------------------------
    marginparsep   = 6mm,     % separacion co corpo
    marginparwidth = 15mm,    % grosor
    % nomarginpar    = true,    % desactivar notas no marxe (tamaño 0)
% ENCABEZADO ----------------------------------------------------
    headsep        = 5mm,   % separación co corpo
    headheight     = 10mm,  % grosor
    % nohead         = true,  % desactivar o encabezado
% PE DE PAXINA --------------------------------------------------
    footnotesep    = 10mm,  % separacion corpo inferior e parte superior do pe de paxina
    footskip       = 15mm,  % separacion corpo inferior e parte inferior do do pe de paxina
    % nofoot         = true,  % desactivar o pe de paxina
% INCLUIR ENCABEZADOS E PES DE PAXINA NO CORPO DO DOCUMENTO -----
    % includehead,
    % includefoot,
    % includemp,
% DEBUG ---------------------------------------------------------
    % showframe,  % mostra estructura
    % showcrop,   % mostrar tamaño útil (ver opcions layout=xxx)
    % pass        % desactivar todo excepto showframe
]{geometry}

% Varias opcións do formato a maiores
\setlength\parindent{0pt}               % tamaño da indentación
\setlength\parskip{0.7em}               % aumentar o tamaño do interlineado entre párrafos
% \renewcommand*{\baselinestretch}{2.0}   % interlineado global

% Para graficos
\RequirePackage{graphicx}
% \RequirePackage{float}       % permite a colocación 'H' dos floats
% \RequirePackage{subcaption}  % para colcar varias imaxes xuntas e tal
% \RequirePackage{transparent} % imaxes transparentes
% \RequirePackage{eso-pic}     % Imaxes encima do texto

% Esto pa cambiar facilmente o estilo das 'captions' das cousas
\RequirePackage{caption}
\captionsetup[figure]{ labelfont=bf }
\captionsetup[table]{ labelfont=bf }

% Encabezados e pe de paxina
% Pa facilitar a creacion cun par de comandos
\RequirePackage{fancyhdr}
\pagestyle{fancy}

% Por defecto temos o seguinte formato no header
% [1.2 SECCION   CAP.1 CAPITULO][CAP.1 CAPITULO  1.2 SECCION]
% Esquematicamente
% [SEC    CAP][CAP    SEC]
% As marcas por defecto están en maiscula, teñen texto de máis, e son feas. Pa
% empezar cambiamolas
%
% Primeiro cambiamos a marca do CAP. \markboth mostrará o capitulo (#1) en
% ambas paxinas na mesma posicion que antes. Agora será solo o nome do CAP
\renewcommand{\chaptermark}[1]{ \markboth{#1}{} }

% E agora a marca da SEC. Será o nome da sección simplemente
\renewcommand{\sectionmark}[1]{ \markright{#1}{} }

% Por desgraza esto solo nos permite cambiar algo o formato, non a posicion.
% Para eso uso \fancyhead.
%
% \leftmark corresponde a \chaptermark de antes.
% \rightmark corresponde a \sectionmark de antes.

\fancyhead[EL]{\chaptername\ \thechapter} % par esquerda
\fancyhead[ER]{\leftmark}                 % par dereita
\fancyhead[OL]{}                          % impar esquerda
\fancyhead[OR]{\rightmark}                % impar dereita

% Para customizar a liña do encabezado solo hai que facer esto. Podeselle poñer
% simbolos matematicos ou ornamentos de todo tipo
\renewcommand\headrule{
    \vspace{-6pt}
    {\color{violet} \hrulefill}
    \raisebox{-5.4pt}
    {$E=mc^2$}
    {\color{violet} \hrulefill}
}
\renewcommand\footrule{
    \vspace{-6pt}
    {\color{violet} \hrulefill}
    \raisebox{-5.4pt}
    {Esta é a liña do pe de paxina!}
    {\color{violet} \hrulefill}
}
% Tamén se poderian cambiar de forma máis sutil, no casode que non se queira
% meter texto no medio
% \let\Oldfoot\footrule
% \renewcommand\footrule{\color{violet}\Oldfoot}

% Para os grosores das liñas. Como antes estaba usando \hrulefill, hai que
% editar este para cambiar o grosor da \headrule. Para a liña do pe de paxina
% simplemente usar \headrulewidth. Véxase:
% https://tex.stackexchange.com/a/65734
\def\hrulefill{\leavevmode\leaders\hrule height 2pt\hfill\kern\z@}

% Para que o texto ao pe de paxina non esté indentado (quitarlle sangrías)
\RequirePackage[hang,flushmargin]{footmisc}

% Tipografia preciosa. Xoga cos espaciados moi ben para xustificar o texto
\RequirePackage{microtype}

% Texto de proba
\RequirePackage{lipsum}

\RequirePackage{hyperref}
\hypersetup{
    colorlinks,  % Colorear os links
    linkcolor = {red!55!black},   % links internos
    citecolor = {green!45!black}, % citas bibliográficas
    urlcolor  = {blue!80!black}   % URLs e links externos
}
