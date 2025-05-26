reset

set xdata time
set timefmt "%Y-%m-%d"
set format x "%d"

set xlabel "D'ia de marzo"
set ylabel "f(x)"

file="./../data/fecha.dat"
set xrange ["2017-03-01":"2017-04-01"]

plot file using 1:2 with linespoints title 'x',\
     file using 1:4 with linespoints title 'z'