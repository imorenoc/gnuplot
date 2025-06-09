reset

load 'rdylbu.pal'
set palette negative

set pm3d implicit at b
set view map
unset surface

set xlabel ""
set ylabel 'Hora del dia'
set cblabel "Potencia de Generacion [MW] "

unset colorbox


set xrange [0:364]
set yrange [0:23]
set cbrange [0:50]
unset border
set ytics 2

set xtics ("Ene" 15, "Feb" 45, "Mar" 75, "Abr" 105, "May" 135, "Jun" 165, "Jul" 195, "Ago" 225, "Sep" 255, "Oct" 285, "Nov" 315, "Dic" 345) #rotate by 45 offset -1.5, -1.2



file="./../data/gen.dat"

splot file matrix using 2:1:($3/1000) notitle