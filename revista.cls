\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{revista}[2025/01/01 Clase para a revista de Fisica USC]

\LoadClass[11pt,a4paper,twocolumn]{extarticle}

% Tipo de letra. Cortesía de LuaLaTeX. É extremadamente fácil:
\RequirePackage[no-math]{fontspec}
\newfontfamily\FonteTitulo[
    Path      = ./fontes/QualiType/,
    Extension = .otf,
    BoldFont  = *-Bold,
]{QTBengal}
\newfontfamily\FonteInfo[
    Path      = ./fontes/LatinModernMono/,
    Extension = .otf,
]{lmmono10-regular}
\setmainfont[
    Path           = ./fontes/CMUserif/,
    Extension      = .ttf,
    ItalicFont     = cmunti.ttf,
    BoldFont       = cmunbx.ttf,
    BoldItalicFont = cmunbi.ttf,
]{cmunrm}

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

% Cores. En cada artigo usamos \definecolor{}{} pa coller o que queremos
\RequirePackage{xcolor}

% Graficos e tal
\RequirePackage{tikz}
\usetikzlibrary{calc} % para facer calculos cas posicions

% pa ter fondos con \AddToShipoutPicture
\RequirePackage{eso-pic}

% pa ter alphas
\RequirePackage{transparent}

\RequirePackage{qrcode}

% Para poder usar os marxes de referencia para colocar nodos. Usase na portada
% con 'text area'
\RequirePackage{tikzpagenodes}

% Para recuadros, fondos, etc.
\RequirePackage{tcolorbox}

\RequirePackage{geometry}
\geometry{
    paper       = a4paper, % tamaño do papel
    top         = 20mm,    % marxe superior
    left        = 10mm,    % marxe esquerdo
    right       = 10mm,    % marxe dereito
    bottom      = 20mm,    % marxe inferior
    nomarginpar = true,    % desactivar marxe para notas
    % showframe,            % mostra estructura
}
% esto é pa mostrar as box, hyphenation points, glues, etc.
% \RequirePackage{lua-visual-debug}

% Por agora usamos a opcion 'twocolumn' da clase 'article'. Eventualmente
% poderíamos pasar a usar os entornos de dúas columnas deste paquete.
% Véxase:
% https://www.overleaf.com/learn/latex/Multiple_columns
% https://tex.stackexchange.com/a/285444
\RequirePackage{multicol}

% Pa cambiar interlineados no momento usando \setstrech{}
\usepackage{setspace}

\setlength\parindent{5mm} % tamaño da indentación
% \setstretch{1.5}

% Para graficos
\RequirePackage{graphicx}
% \RequirePackage{svg}

% Mates e todo eso
\RequirePackage{mathtools}  % mates xerais
\RequirePackage{amssymb}    % simbolos adicionais
\RequirePackage{amsthm}     % definir teoremas
\RequirePackage{diffcoeff}  % derivadas
\RequirePackage{esint}      % integrais diferentes
\RequirePackage{mathrsfs}   % letras reviradas \mathcal
\RequirePackage{polynomial} % polinomios simples
\RequirePackage{tensor}     % indices e eso

\RequirePackage{svrsymbols} % simbolos variados
\RequirePackage{adforn}     %

\newcommand{\titular}[4]{%
    % #1: nome do artigo,
    % #2: nome do autor,
    % #3: estilo (divulgacion,historia,etc.)
    % #4: subtítulo do artigo
    \pagestyle{#3}
    \twocolumn[%
        \begin{@twocolumnfalse}
            \begin{center}
                \noindent
                {\color{Resalte}\Huge \textbf{#1}} \\
                \vspace{3mm}
                {\Large #2} \\
                \vspace{3mm}
                \textit{#4}
            \end{center}
        \end{@twocolumnfalse}
    ]
    % aprobeito pa meter esto aquí. Resetea números nas ecuacións e figuras
    \setcounter{equation}{0}
    \setcounter{figure}{0}
}

% Esto pa cambiar facilmente o estilo das 'captions' das cousas
\RequirePackage[justification=centering]{caption}
% \captionsetup[figure]{ labelfont=bf }
% \captionsetup[table]{ labelfont=bf }

% Uns paquetes varios que non organicei
\RequirePackage{subcaption}
\RequirePackage{booktabs}
\RequirePackage{comment}
\RequirePackage{lettrine}
\RequirePackage{ragged2e}
\RequirePackage[scr]{rsfso}

% Encabezados e pe de paxina
% Pa facilitar a creacion cun par de comandos
\RequirePackage{fancyhdr}

% :FACER: documentacion para quenes fagan os artigos

% ESTILOS DE PÁXINA.
% Estos estilos cambian os encabezados das páxinas dependendo dos artigos que
% haxa.

% artigos de DIVULGACION
\fancypagestyle{divulgacion}{
    \fancyhf{}
    \renewcommand{\headrulewidth}{0.4pt}
    \fancyhead[RE,LO]{DIVULGACIÓN}
    \fancyfoot[LE,RO]{\thepage}
    \fancyfoot[RE,LO]{\imprimeTitulo}
    \renewcommand{\footrulewidth}{0pt}
}

% artigos de HISTORIA
\fancypagestyle{historia}{
    \fancyhf{}
    \renewcommand{\headrulewidth}{0.4pt}
    \fancyhead[RE,LO]{HISTORIA}
    \fancyfoot[LE,RO]{\thepage}
    \fancyfoot[RE,LO]{\imprimeTitulo}
    \renewcommand{\footrulewidth}{0pt}
}

% artigos de ACTUALIDADE DA FACULTADE
\fancypagestyle{actualidadeFacultade}{
    \fancyhf{}
    \renewcommand{\headrulewidth}{0.4pt}
    \fancyhead[RE,LO]{ACTUALIDADE DA FACULTADE}
    \fancyfoot[LE,RO]{\thepage}
    \fancyfoot[RE,LO]{\imprimeTitulo}
    \renewcommand{\footrulewidth}{0pt}
}

% artigos de ACTUALIDADE CIENTIFICA
\fancypagestyle{actualidadeCientifica}{
    \fancyhf{}
    \renewcommand{\headrulewidth}{0.4pt}
    \fancyhead[RE,LO]{ACTUALIDADE CIENTÍFICA}
    \fancyfoot[LE,RO]{\thepage}
    \fancyfoot[RE,LO]{\imprimeTitulo}
    \renewcommand{\footrulewidth}{0pt}
}

% artigos de FILOSOFIA
\fancypagestyle{filosofia}{
    \fancyhf{}
    \renewcommand{\headrulewidth}{0.4pt}
    \fancyhead[RE,LO]{FILOSOFÍA}
    \fancyfoot[LE,RO]{\thepage}
    \fancyfoot[RE,LO]{\imprimeTitulo}
    \renewcommand{\footrulewidth}{0pt}
}

% artigos de ENTREVISTAS
\fancypagestyle{entrevistas}{
    \fancyhf{}
    \renewcommand{\headrulewidth}{0.4pt}
    \fancyhead[RE,LO]{ENTREVISTAS}
    \fancyfoot[LE,RO]{\thepage}
    \fancyfoot[RE,LO]{\imprimeTitulo}
    \renewcommand{\footrulewidth}{0pt}
}

% artigos de PROGRAMACIÓN
\fancypagestyle{programacion}{
    \fancyhf{}
    \renewcommand{\headrulewidth}{0.4pt}
    \fancyhead[RE,LO]{PROGRAMACIÓN}
    \fancyfoot[LE,RO]{\thepage}
    \fancyfoot[RE,LO]{\imprimeTitulo}
    \renewcommand{\footrulewidth}{0pt}
}

% seccions de PASATEMPOS
\fancypagestyle{pasatempos}{
    \fancyhf{}
    \renewcommand{\headrulewidth}{0.4pt}
    \fancyhead[RE,LO]{PASATEMPOS}
    \fancyfoot[LE,RO]{\thepage}
    \fancyfoot[RE,LO]{\imprimeTitulo}
    \renewcommand{\footrulewidth}{0pt}
}

% seccions de ANUNCIOS
\fancypagestyle{anuncios}{
    \fancyhf{}
    \renewcommand{\headrulewidth}{0.4pt}
    \fancyhead[RE,LO]{ANUNCIOS}
    \fancyfoot[LE,RO]{\thepage}
    \fancyfoot[RE,LO]{\imprimeTitulo}
    \renewcommand{\footrulewidth}{0pt}
}

% Tipografia preciosa. Xoga cos espaciados moi ben para xustificar o texto
\RequirePackage{microtype}

% Texto de proba
\RequirePackage{lipsum}

\RequirePackage{hyperref}
\hypersetup{
    hidelinks,
    colorlinks,  % Colorear os links
    linkcolor = {red!55!black},   % links internos
    citecolor = {green!45!black}, % citas bibliográficas
    urlcolor  = {blue!80!black}   % URLs e links externos
}

%% MACROS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% :FACER: tal vez aparte, logo con tikz
\makeatletter

% NUMERO
\def\Numero#1{\def\@Numero{#1}}
\newcommand{\imprimeNumero}{Num.\@Numero}

% DATA
\def\Data#1{\def\@Data{#1}}
\newcommand{\imprimeData}{\@Data}

% Artigos
\def\PrimeiroArtigo#1{\def\@PrimeiroArtigo{#1}}
\newcommand{\imprimePrimeiroArtigo}{\@PrimeiroArtigo}
% \def\SegundoArtigo#1{\def\@SegundoArtigo{#1}}
% \newcommand{\imprimeSegundoArtigo}{\@SegundoArtigo}
% \def\TerceiroArtigo#1{\def\@TerceiroArtigo{#1}}
% \newcommand{\imprimeTerceiroArtigo}{\@TerceiroArtigo}

% TITULO REVISTA
\newcommand{\imprimeTitulo}{MOMENTUM}

% RUTA PARA A IMAXE DA PORTADA
\def\ImaxePortada#1{\def\@ImaxePortada{#1}}
\newcommand{\imprimeImaxePortada}{\@ImaxePortada}

\makeatother
% todos esos comandos teñen a info da revista. Gardase o valor nunha variable,
% e imprimese no PDF con outro comando diferente. Esto da bastante
% flexibilidade


% Pa colorear o primeiro catacter de algo
% \coloreacaracter{color}{texto}
\newcommand{\coloreacaracter}[2]{%
    {\color{#1}\directlua{tex.sprint(unicode.utf8.sub('#2',1,1))}}%
    \directlua{tex.sprint(unicode.utf8.sub('#2',2,-1))}%
}

% SE QUEREMOS RETOCAR ALGO, HAI QUE FACELO NOS SEGUINTES COMANDOS
\Numero{0}
\Data{Enero do 1900}
\PrimeiroArtigo{Entrevista a Marie Curie}
% \SegundoArtigo{Entrevista a JC}
% \TerceiroArtigo{A fisica minte}
\ImaxePortada{./cern.png}
\definecolor{Resalte}{HTML}{ff0000}
\definecolor{TextoEnResalte}{HTML}{000000}

% Os comandos anteriores definen as variables. Pa mostralas no pdf hai que usar:
%
% \imprimeTitulo          Titulo da revista
% \imprimeNumero          Numero da revista
% \imprimeData            Data de creacion
% \imprimeImaxePortada    ruta para a imaxe de portada, debe especificarse en cada revista
% \imprimePrimeiroArtigo  %
% \imprimePrimeiroArtigo  % Nomes dos artigos principais.
% \imprimeTerceiroArtigo  %

\pagenumbering{arabic}\setcounter{page}{1}
