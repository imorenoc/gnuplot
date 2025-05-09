reset
set xlabel '$\gamma$'
set ylabel '$\alpha$'
set yrange [0:90]
set grid
file="./data/junio.dat"
plot file using 2:(90-$1) with lines title "Junio"
