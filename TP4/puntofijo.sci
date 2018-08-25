function [x,h] = puntofijo(g,x0,kmax,tol)
    h=zeros(1,kmax);
    i=1;
    p0=x0;
    while(i<kmax)
        x=g(p0);
        r=abs(x-p0);
        h(1,i)=r;
        i=i+1;
        if (r<tol) then
            return;
        end
        p0=x;
    end
endfunction