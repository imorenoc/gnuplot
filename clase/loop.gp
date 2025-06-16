reset

## 200, 400, 600 y 800
file(n) = sprintf("./../data/lineas/StreamLines%d00.txt",n)
titulo(n)=sprintf("%d",n)

plot for [i=2:8:2] file(i) using 1:3 with lines title titulo(i)
