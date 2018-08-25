function [t,w,e] = CrankNicolson(f,a,b,h,alfa,yex)
    N=(b-a)/h;
    t=(a:h:b);
    w(1,:)=alfa;
    for (i=1:N)
        //predictor
        w(i+1,:)=w(i,:)+h.*f(t(i),w(i));
        //corrector
        w(i+1,:)=w(i,:)+(h/2).*(f(t(i),w(i))+f(t(i+1),w(i+1)));
    end
    e=abs(yex(t)-w);
endfunction