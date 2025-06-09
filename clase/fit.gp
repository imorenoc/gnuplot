reset

file ="./../data/fit.dat"

f(x)=a1*x + a2*x**2 + a3*x**3 + a4*x**4 + a5*x**5
fit f(x) file using 1:2 via a1, a2, a3, a4, a5

plot file using 1:2 with points title "file", f(x)