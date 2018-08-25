function s = simp_comp(f,a,b,M)
    //intervalos equiespaciados
    h=(b-a)/M;
    sump=0;
    sumi=0;
    //sumatorias
    for (i=1:M-1)
        //calculamos el valor de f(xi)
        y=f(a+(i*h));
        //verificamos si i es par o impar
        r=modulo(i,2);
        if (r==0) then
            //par
            sump=sump+y;
        else
            //impar
            sumi=sumi+y;
        end
    end
    s=(h/3)*(f(a)+f(b)+2*(sump)+4*(sumi));
endfunction