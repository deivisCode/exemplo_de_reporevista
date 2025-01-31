### ESTRUTURA DE EXEMPLO PARA O PROXECTO

Este é un exemplo para que o proxecto se poida manter, compartir e expandir
facilmente. A estrutura é a seguinte:

.
├── revista.cls
│
├── bibliografia.bib
├── latexmkrc
├── Makefile
├── README.md
├── .gitignore
│
└── revistas
   ├── 001
   │  ├── documento.tex
   │  ├── imaxes
   │  │  └── black_hole.jpg
   │  └── roberto_bolon_HISTORIA_DA_CIENCIA.tex
   ├── 002
   │  └── ...
   ├── 003
   │  └── ...
   ├── 004
   │  └── ...
   └── 005
      └── ...

Na raiz do proxecto estarán os arquivos comúns (usados por todas as revistas,
como a bibliografia e a clase), de mantemento e de configuración.

## ESTILO (clase da revista)

O estilo gardase no ficheiro 'revista.cls'. Aquí debería ir o estilo do 99.9%
da revista. Quenes queiran tocar ese tema, só se teñen que preocupar por esto.

```latex
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{revista}[2025/01/01 Clase para a revista de Fisica USC]

\LoadClass[12pt]{article}

\RequirePackage{abc}
\RequirePackage{dfg}
\renewcommand\blablabla{gluglu}
\def\nonsei#1{\makesomething}

%% resto de paquetes e formatos e tal ...
```

## REVISTAS

Cada 'revista' ten o seu propio diretorio, por exemplo ./revistas/001/*
Dentro dese diretorio, estará o arquivo 'documento.tex' que será da forma:

```latex
\documentclass{revista}

\begin{document}

\section{historia da ciencia}
\input{./revistas/001/roberto_bolon_HISTORIA_DA_CIENCIA.tex}

\end{document}
```

## ARTIGOS DA XENTE

Gardanse no mesmo diretorio que o `document.tex` correspondente.
Así é facil importalos con `inputs`. Estos artigos son os que deberían facer
os editores (ou como se chamen). Ahí irá o texto formateado, con imaxes, citas,
etc. Facendoo así será máis facil manter o codigo (creeme we). Véxase o arquivo
de Roberto Bolón.

## IMAXES

Cada revista ten as imaxes gardadas nun subcartafol ao lado do documento
correspondente. Nos artigos editados só hai que facer:
```latex
\includegraphics{./revista/001/imaxebonita.png}
```

### COMPILACION

É moi sinxelo. no diretorio raíz hai unha latexmkrc que sirve como
configuración con unhas opcións 'sanas'. Para compilar unha revista só hai que
facer na terminal:

```bash
latexmk ./revistas/001/documento.tex
```

Quenes usen Overleaf ou parralladas similares non deberían ter problema,
xa que usan latexmk en secreto asique debería ir ben.

Tamén se adxunta unha Makefile para os que usen Linux e similares. É posible facer
```bash
make numero=001 # compilar a revista numero 001
make limpa      # limpar os arquivos auxiliares
```

### POR FACER:
- Decidir onde poñer o codigo pas portadas (son iguais sempre ou diferentes pa cada revista)
- Un mini script de bash (ou ca propia makefile) pa compilar TODAS as revistas do tiron
- Decidir un formato específico para as mensaxes das contribucións en git
- Detalles de git: nome das ramas, fluxos de traballo (1, 2, 3 ramas con qué metodos), usar git LFS
