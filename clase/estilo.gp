reset

file="./../data/funciones.dat"

plot file index 0 using 1:2 with points title "sin(x)",\
     file index 1 using 1:2 with points title "cos(x)"