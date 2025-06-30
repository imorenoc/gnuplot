#!/bin/bash
#--------------------------------------------------------------------
# SCRIPT: 	IMPRIME
# AUTHOR: 	ISAIAS MORENO
# DATE: 	04-Jul-2023
# 
# PLATFORM: Linux
## 

# > gp2pdf file.gp
# Utiliza las etiquetas de multiplot cuando en el archivo.gp utilices
# multiplot
#--------------------------------------------------------------------
name=`basename $1`

# Variables
# ----------
# \tiny \scriptsize \footnotesize \small
# \normalsize
# \large \Large \LARGE \huge \Huge
lineW=3
#size='\normalsize'
size='\Large'


name=${name%.gp}
# Ejecuta comandos en Gnuplot
# size 8,5. horizontal
echo "set terminal epsl size 7,5 col sol lw $lineW" > newgp.gp
#echo "set terminal epsl size 8,5 col sol lw $lineW" > newgp.gp
#echo "set terminal epsl col sol lw $lineW" > newgp.gp
echo "set output '${name}.tex' " >> newgp.gp
cat ${name}.gp >> newgp.gp
echo "unset multiplot" >> newgp.gp
echo "unset output" >> newgp.gp
echo "load 'newgp.gp'" | gnuplot


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
echo "$size" >> fig.tex
echo '\input{'$name'}' >> fig.tex
echo '' >> fig.tex
echo '\end{document}' >> fig.tex

## Latex to Pdf
latex fig
dvips -E fig -o fig.eps
epstopdf fig.eps -o "$name".pdf
rm "$name".eps

## Recorte del pdf
pdfcrop --margins "10 10 10 0" "$name".pdf
mv "$name"-crop.pdf "$name".pdf

rm "$name".tex
rm fig.aux fig.dvi fig.tex fig.log
rm fig.eps newgp.gp
#evince "$name".pdf &
#######################################################################
