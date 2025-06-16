reset
load "set2.pal"

set y2tics
set ytics nomirror

set xlabel "x"
set ylabel "f(x)"
set y2label "g(x)"

f(x) = sin(1/x)
g(x) = tan(1/x)

set y2range [-0.5:0.5]

plot f(x) axis x1y1 ls 1,\
     g(x) axis x1y2 ls 2