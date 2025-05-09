reset
set terminal epsl size 4,4 col sol lw 3
set output 'matrix.tex'

load 'iris.def'
unset key; unset tics
set size square

#m='4'
set multiplot layout m,m margin 0.01,0.99,0.01,0.99 spacing 0.01
do for[i=1:m] {
    do for[j=1:m] {
	if( i!=j ) {
	    if( i<j ){
		plot data u i:j w p ps 0.3 pt 4 lc 2
	    } else {
		plot data u i:j w p ps 0.5 pt 7 lc 3
	    }
	} else {

	    unset border
	    set label word(names,i) at 0,0 center
	    plot [-1:1][-1:1] 1/0
	    unset label
	    set border
	}
    }
}
unset multiplot
unset output
