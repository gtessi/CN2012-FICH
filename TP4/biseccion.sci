function [x,h] = biseccion(f,xmin,xmax,kmax,tol)
    if(xmax==xmin) then
        disp("No se puede aplicar el metodo, intervalo=0.");
        return;
    end
    a=xmin;
    b=xmax;
    h=zeros(1,kmax);
    i=1;
    while(i<kmax)
        x=a+(b-a)/2;
        h(1,i)=abs(f(x));
        i=i+1;
        if (f(x)==0 | (b-a)/2<tol) then
            return;
        end
        if (f(a)*f(x)>0) then
            a=x;
        else
            b=x;
        end
    end
endfunction