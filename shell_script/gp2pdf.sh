#!/bin/bash
#--------------------------------------------------------------------
# SCRIPT: 	IMPRIME
# AUTHOR: 	ISAIAS MORENO
# DATE: 	28-Mar-2013
#               21-Feb-2018, multiplot
#               21-Feb-2022, rm multiplot add size
# REV:		2.0
# 
# PLATFORM: Linux
## 
#--------------------------------------------------------------------
name=`basename $1`
#size=`basename $2`
name=${name%.gp}

# Ejecuta comandos en Gnuplot
gnuplot << EOF
load '${name}.gp'
set terminal epsl col sol lw 2
set output '${name}.tex'
replot
EOF

# Genera el archivo fig.tex
echo '\documentclass{article}' > fig.tex
echo '\usepackage{graphicx}' >> fig.tex
echo '\usepackage{color}' >> fig.tex
echo '\usepackage{amsmath}' >> fig.tex
echo '\usepackage{amssymb}' >> fig.tex

echo '\usepackage{xcolor}' >> fig.tex
echo '\definecolor{mWhite}{rgb}{1.0, 1.0, 1.0}' >> fig.tex
echo '\newcommand\white[1]{\textcolor{mWhite}{#1}}' >> fig.tex

echo '\usepackage[activeacute, spanish]{babel}' >> fig.tex
echo '\usepackage[utf8x]{inputenc}' >> fig.tex
echo '\usepackage[T1]{fontenc}' >> fig.tex
echo '\spanishdecimal{.}' >> fig.tex


##echo '\usepackage[paperwidth=21cm, paperheight=9cm]{geometry}' >> fig.tex
echo '\renewcommand{\v}[1]{{\boldsymbol #1}}'  >> fig.tex
echo '' >> fig.tex
echo '\newcommand{\PROM}[1]{\left\langle #1\right\rangle}' >> fig.tex
echo '\pagestyle{empty}' >> fig.tex
echo '\begin{document}' >> fig.tex
# # Variables
# # ----------
# # \tiny \scriptsize \footnotesize \small
# # \normalsize
# # \large \Large \LARGE \huge \Huge
# if [ ! -z "$size" ]
# then
#     echo '\'$size'' >> fig.tex
# fi
echo '\input{'$name'.tex}' >> fig.tex
echo '' >> fig.tex
echo '\end{document}' >> fig.tex

## Latex to Pdf
latex fig
dvips -E fig.dvi -o fig.eps
epstopdf fig.eps -o "$name".pdf
#epspdf fig.eps
rm "$name".eps

## Recorte del pdf
pdfcrop --margins "10 10 10 0" "$name".pdf
mv "$name"-crop.pdf "$name".pdf

rm "$name".tex
rm fig.aux fig.dvi fig.tex fig.log
rm fig.pdf fig.eps
##okular "$name".pdf &
#######################################################################
