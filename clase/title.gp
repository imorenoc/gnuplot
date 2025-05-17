reset

set xlabel 'x'
set ylabel 'f(x)'

f(x)=sin(x)
g(x)=cos(x)

set xtics ('$\pi/2$' pi/2, '$\pi$' pi, '$3\pi/2$' 3*pi/2, '$2\pi$' 2*pi)
set ytics 0.4
set grid

plot [0:2*pi] f(x), g(x)