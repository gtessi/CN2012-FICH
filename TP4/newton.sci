function [x,h] = newton(f,df,x0,kmax,tol)
    h=zeros(1,kmax);
    i=1;
    p0=x0;
    while(i<kmax)
        p=p0-(f(p0)/df(p0));
        r=abs(p-p0);
        h(1,i)=r;
        i=i+1;
        if (r<tol) then
            x=p;
            return;
        end
        p0=p;
    end
endfunction