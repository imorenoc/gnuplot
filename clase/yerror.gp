reset
load 'set2.pal'

#3 columnas: x y ydelta
#4 columnas: x y ydelta xdelta # boxwidth !=-2
#4 columnas: x y ylow yhigh    # boxwidth ==-2
#5 columnas: x y ylow yhigh xdelta


file="./../data/step2112.dat"

set xlabel '$\gamma_s$'
set ylabel '$\alpha$'

set yrange [4.5:4.8]
set xrange [-62.55:-62.45]

d(x1,y1,x2,y2)= sqrt( (x2-x1)**2 + (y2-y1)**2)

plot file using 2:1:(d($1,$2,$3,$4)) with yerrorbars ls 1 title ""
     
