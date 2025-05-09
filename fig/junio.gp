cd '~/Documents/notas/Gnuplot/'

plot "junio.dat" using 3:4 with lines title "Junio"
set xlabel '$\gamma$'
set ylabel '$\alpha$'
set yrange [0, 90]
set grid
