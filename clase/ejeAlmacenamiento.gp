reset
set key left
file="./../data/almacenamiento.dat"

set y2tics

set xlabel "Tiempo [h]"
set ylabel "Q [MJ]"
set y2label "Ts [C]"

plot file using 1:2 with linespoints axes x1y1 title "Qc",\
     file using 1:3 with linespoints axes x1y1 title "Ql",\
     file using 1:5 with linespoints axes x1y1 title "Qp",\
     file using 1:4 with linespoints axes x1y2 title "Ts"