reset
set size square

set xrange [-1.1:1.1]
set yrange [-1.1:1.1]
set grid

set xzeroaxis lt 1 lc 8 lw 2
set yzeroaxis lt 1 lc 8 lw 2

set object 1 rectangle from -1,-1 to 1,1
set object 1 front lw 1 fillcolor rgb "#0000ff" fillstyle pattern 4

set object 2 ellipse at 0,0 size 2,2
set object 2 front lw 1 fillstyle transparent solid 0.1 fillcolor "red"


x=0.4
f(x)=sqrt(1-x**2)

set arrow from 0,0 to x,f(x) lw 3 lc "blue" head  # Flecha con punta
set arrow from x,0 to x,f(x) lw 3 dashtype 2 lc "blue" nohead 

set label "a" at x/2,-0.05
set label "b" at x+0.05,f(x)/2
set label '$c=\sqrt{a^2 + b^2 }$' at 0.25,-0.25

plot NaN notitle