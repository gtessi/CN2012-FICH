function [t,w,e] = ej8a(f,a,b,h,alfa,yex)
    N=(b-a)/h;
    t=(a:h:b);
    w(1)=alfa;
    w(2:4)=yex(t(2:4));
    for (n=4:N)
        //predictor
        w(n+1)=w(n)+(h/12)*(23*f(t(n),w(n))-16*f(t(n-1),w(n-1))+5*f(t(n-2),w(n-2)));
        //corrector
        w(n+1)=w(n)+(h/24)*(9*f(t(n+1),w(n+1))+19*f(t(n),w(n))-5*f(t(n-1),w(n-1))+f(t(n-2),w(n-2)));
    end
    e=abs(yex(t)-w);
endfunction

function z = f(t,y)
    z=(1 ./ (1 + (t .^ 2))) - (2 .* (y .^ 2));
endfunction

function z = yex(t)
    z=(t ./ (1 + (t .^ 2)));
endfunction

alfa=0;
a=0;
b=10;

//Para h=0.125
h1=0.125;
[t1,w1,e1] = ej8a(f,a,b,h1,alfa,yex);

//Para h=0.0625
h2=0.0625;
[t2,w2,e2] = ej8a(f,a,b,h2,alfa,yex);

//Toma los puntos que tiene en común e2 con e1
e2mod=e2(1:2:length(e2));

//Calculo del orden empírico
lnE=log(norm(e2mod)/norm(e1));
lnh=log(h2/h1);

m=lnE/lnh;

disp(m)