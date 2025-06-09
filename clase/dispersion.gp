reset
load "set2.pal"

file="./../data/scatterplot.dat"

set xlabel 'x'
set ylabel 'f(x) $\times 10^{-4}$'

set format y '%.1t'


plot file with points ls 2 title "" 