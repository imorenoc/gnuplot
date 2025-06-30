reset

set multiplot layout 2,1

set xlabel 'x'
set ylabel 'f(x)'
set ytics 0.4

plot sin(x)

set xlabel 'x2'
set ylabel 'f2(x)'
plot cos(x)

unset multiplot

