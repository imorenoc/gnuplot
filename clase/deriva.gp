reset

file = './../data/derivaDays.dat'
condition(y,m,d)=sprintf('/%d-%.2d-%.2d/',y,m,d)
action=' print '
cmd(y,m,d)=sprintf("<awk '%s {%s}' %s", condition(y,m,d), action,file)


plot cmd(2024,6,21) using 7:9 with linespoints title '',\
     cmd(2024,8,6) using 7:9 with linespoints title '',\
     cmd(2024,8,26) using 7:9 with linespoints title ''