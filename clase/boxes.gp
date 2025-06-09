reset
load 'set2.pal'
set datafile separator ','

set style fill solid 0.8
set xtics ("Jan" 0, "Feb" 1, "Mar" 2, "Apr" 3, "May" 4, "Jun" 5, "Jul" 6, "Aug" 7, "Sep" 8, "Oct" 9, "Nov" 10, "Dec" 11)

set ylabel 'DNI kWh/m$^2$/day'
set format y "%.1f"

file="./../data/DNIsam.csv"
file2="./../data/DNIsamHermosillo.csv"

plot file using ($2/3.6) with histogram ls 1  title "BCS",\
     file2 using ($2/3.6) with histogram ls 2 title "Hermosillo"