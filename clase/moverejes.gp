reset

set yzeroaxis lt 1 lc 8 lw 2
set xzeroaxis lt 1 lc 8 lw 2
set xtics axis
set ytics axis
unset border

set xtics offset 0.5,0
set ytics offset 0.0,0.5

set label 'x' at 6.5,-0.3
set label 'y' at 0.3, 1.3
set xrange [-1:7]
set yrange [-1:1.6]
#set grid

set xtics ('$\dfrac{\pi}{2}$' pi/2, '$\pi$' pi, '$\dfrac{3\pi}{2}$' 3*pi/2, '$2\pi$' 2*pi)
set ytics ('-$\dfrac{\pi}{4}$' -pi/4, '$\dfrac{\pi}{4}$' pi/4, '$\dfrac{\pi}{2}$' pi/2)

plot sin(x) with lines