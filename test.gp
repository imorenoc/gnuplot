 reset
  load 'rdylbu.pal'


  set multiplot layout 3,1\
      margins 0.1,0.99,0.1,0.98 \
      spacing 0.0,0.0

  ##############################################################################
  ## 01
  ##############################################################################
  reset
  #set palette @MATLAB
  #load 'ylgnbu.pal'
  load 'rdylbu.pal'
  set palette negative
  #set size square
  #set cbrange [0:40]

  set pm3d implicit at b
  set view map
  unset surface
  set colorbox user origin 0.90,0.75 size 0.01,0.2

  set xlabel ""
  set ylabel "Hour of day"
  set format cb "%.2f"
  #set cblabel "Electricity price [\\$/kWh]" rot

  set xrange [0:365]
  set yrange [1:23]
  set cbrange [0:0.40]
  set cbtics 0.10
  set ytics 4
  unset border

  #set xtics ("Jan" 1, "Feb" 31, "Mar" 61, "Apr" 91, "May" 121, "Jun" 151, "Jul" 181, "Aug" 211, "Sep" 241, "Oct" 271, "Nov" 301, "Dec" 331) #rotate by 45 offset -1.5, -1.2
  unset xtics

  splot "./data/precioM.dat" matrix using 2:1:3 notitle


  ##############################################################################
  ## 02
  ##############################################################################
  reset
  load 'rdylbu.pal'
  set key autotitle columnhead
  set key left
  set datafile separator ","

  set ylabel 'Electricity price [\$/kWh]' offset 0,-4.5,0
  set xrange [-0.5:11.8]
  #et xtics ("Jan" 1, "Feb" 2, "Mar" 3, "Apr" 4, "May" 5, "Jun" 6, "Jul" 7, "Aug" 8, "Sep" 9, "Oct" 10, "Nov" 11, "Dec" 12)
  #set xtics ('Ene' 0, 'Feb' 1, 'Mar' 2, 'Abr' 3, 'May' 4, 'Jun' 5, 'Jul' 6, 'Ago' 7, 'Sep' 8, 'Oct' 9, 'Nov' 10, 'Dic' 11)


  set format y "%.2f"
  data='./data/summary.dat'
  data2='./data/summaryF.dat'
  #set grid

  unset xtics
  set yrange [0.01:0.35]
  set ytics 0.1
  # mes,count,mean,std,min,25%,50%,75%,max
  plot data using ($0-0.15):6:5:9:8:($2/$2*0.2) with candlesticks ls 1 title 'Weekday'  whiskerbars,\
       '' using ($0-0.15):3:3:3:3 with candlesticks ls 1 notitle,\
       data2 using ($0+0.15):6:5:9:8:($2/$2*0.2) with candlesticks ls 7 title 'Weekend' whiskerbars,\
       '' using ($0+0.15):3:3:3:3 with candlesticks ls 7 notitle



  ##############################################################################
  ## 03
  ##############################################################################
  reset
  load 'rdylbu.pal'
  set key out horiz center bottom
  set xdata time
  set timefmt '%Y-%m-%d %H:%M:%S'
  set format x '%b'
  set format y "%.2f"

  data='./data/TODhora.dat'
  #set grid

  #set xlabel 'Hora'
  #set ylabel 'Electricity price [\$/kWh]'
  unset ylabel
  set yrange [0.01:0.45]
  set ytics 0.1
  set xrange ['2023-01-01 00:00:00':'2023-12-31 23:00:00']

  plot data using 2:4 with lines ls 7 dt 1 lw 0.1 title ''
  
  unset multiplot