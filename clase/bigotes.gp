reset
load 'paired.pal'

set boxwidth 0.3 absolute
set style fill solid 0.3

set xlabel "Numero de faceta"
set ylabel '$\sigma_x$ [cm]'
set xrange [0:35]

file1="./../data/AHallBoxX.dat"
file2="./../data/BHallBoxX.dat"
file3="./../data/CHallBoxX.dat"

plot file1 using ($1-0.6):3:2:6:5 with candlesticks ls 3 title "x_a" whiskerbars,\
     file1 using ($1-0.6):4:4:4:4 with candlesticks ls 3 title "",\
     file2 using 1:3:2:6:5 with candlesticks ls 6 title "x_b" whiskerbars,\
     file2 using 1:4:4:4:4 with candlesticks ls 6 title "",\
     file3 using ($1+0.6):3:2:6:5 with candlesticks ls 7 title "x_c" whiskerbars,\
     file3 using ($1+0.6):4:4:4:4 with candlesticks ls 7 title "",\
     file1 using 1:3:xticlabels(1) linetype -1 notitle
