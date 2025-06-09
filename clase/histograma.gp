reset
load 'spectral.pal'

file='./../data/combinacionl.dat'

stats file using 26 name "X" nooutput
#N=1.0/X_records
titulo=sprintf("N=%d",X_records)


set boxwidth 0.02 absolute
set style fill solid 1.0 border -1

bin_width = 0.02
bin_number(x)=floor(x/bin_width)
rounded(x) = bin_width*(bin_number(x)+0.5 )

set xlabel '$\gamma_e$ [mrad]'
set ylabel 'Frequency'


plot file using (rounded($26)) smooth frequency with boxes ls 1 title titulo