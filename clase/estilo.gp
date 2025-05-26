reset
#set datafile separator ","
set size square

unset key
#unset border
set zeroaxis
# unset colorbox

set xrange [-5:5]

set format y "%.1f"
set format x "%.2f"

set xlabel 'x'
set ylabel 'f(x)'
file="./../data/funciones.dat"

# -, segmento s'olido
# ., punto
# _, espacio en balnco

#p file index 0 u 1:2 w l dt 5 t "sin(x)"


plot file index 0 using 1:2 with lines dashtype 5 title "sin(x)",\
      file index 1 using 1:2 with lines dashtype "-.._" title "cos(x)"