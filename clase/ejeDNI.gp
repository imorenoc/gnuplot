reset

load "dark2.pal"
set datafile separator ','


file="./../data/25.038_-111.660_25.0384_-111.66_psm3-tmy_60_tmy.csv"
stats file using 6 skip 3
file2="./../data/DNI_cfd.csv"

bins=50
max=STATS_max
min=STATS_min
width=(max-min)/bins
hist(x,width)=width*floor(x/width)+width/2.0
set boxwidth width*0.9
set style fill solid 0.5

condition= "FNR>3"
action   = "if($6 >0) print"
cmd      = sprintf("<awk -F ','  '%s {%s}' %s", condition, action, file)

set xlabel 'DNI [W/m$^2$]'
set ylabel '\# de datos'
set y2label 'CDF'

set xtics 0,100,1000
set y2tics 0,0.1,1
set ytics nomirror

plot cmd using (hist($6,width)):(1.0) skip 3 smooth freq w boxes ls 6 notitle,\
     file2 using 1:2 with lines ls 8 lw 2 notitle axis x1y2