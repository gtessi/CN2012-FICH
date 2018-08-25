function [x,h] = secante(f,xmin,xmax,kmax,tol)
    if(xmax==xmin) then
        disp("No se puede aplicar el metodo, intervalo=0.");
        return;
    end
    h=zeros(1,kmax);
    p0=xmin;
    p1=xmax;
    q0=f(p0);
    q1=f(p1);
    i=2;
    while(i<kmax+2)
        p=p1-q1*(p1-p0)/(q1-q0);
        r=abs(p-p1);
        h(1,i-1)=r;
        i=i+1;
        if (r<tol) then
            x=p;
            return;
        end
        p0=p1;
        q0=q1;
        p1=p;
        q1=f(p);
    end
endfunction