function [y,z] = horner(coef,x0)
    //polinomio ascendente
    n=length(coef)
    y=coef(n); //bn para P
    z=y; //bn-1 para Q
    
    for (j=n-1:-1:2)
        y=x0*y+coef(j); //bj para P
        z=x0*z+y; //bj-1 para Q
    end
    
    y=x0*y+coef(1); //b0 para P
endfunction