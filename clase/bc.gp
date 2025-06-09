reset
load 'rdylbu.pal'
set datafile separator ','

set xdata time
set timefmt "%Y-%m-%d"
set format x "%b"

## Pesos a dolares
dolar=17.80
factor=0.8240892
p2d(x)=(factor*x/dolar)/1000 ## pesos/MWh -> dolares/kWh

set ylabel 'Precios Marginales [\$/kWh]'
set xrange ['2023-01-01':'2023-12-31']
set format y "%.2f"

f1="./../data/preciosBCSday.csv"
f2="./../data/preciosBCAday.csv"
f3="./../data/preciosSINday.csv"

plot f1 using 1:(p2d($3)) with lines ls 2 title "BCS",\
     f2 using 1:(p2d($3)) with lines ls 3 title "BCA",\
     f3 using 1:(p2d($3)) with lines ls 7 title "SIN"