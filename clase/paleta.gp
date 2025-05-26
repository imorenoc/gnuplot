reset
load "set2.pal"
set key bottom

set format y "%.2f"

set xlabel "x"
set ylabel "f(x)"
#set grid

file="./../data/parabola.dat"

plot file using 1:2 with lines ls 1 title "lt 1",\
     file using ($1+0.1):2 with lines ls 2 title "lt 2",\
     file using ($1+0.2):2 with lines ls 3 title "lt 3",\
     file using ($1+0.3):2 with lines ls 4 title "lt 4",\
     file using ($1+0.4):2 with lines ls 5 title "lt 5",\
     file using ($1+0.5):2 with lines ls 6 title "lt 6",\
     file using ($1+0.6):2 with lines ls 7 title "lt 7",\
     file using ($1+0.7):2 with lines ls 8 title "lt 8"