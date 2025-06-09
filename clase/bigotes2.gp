reset

file="./../data/combinacionl.dat"

set xtics nomirror
set ytics nomirror
set border 2

set style boxplot nooutliers

plot file using (1.0):26:(0):2 with boxplot title ""