function [t,w,e] = forwardEuler(f,a,b,h,alfa,yex)
    N=(b-a)/h;
    t=(a:h:b);
    w(1,:)=alfa;
    for (i=1:N)
        w(i+1,:)=w(i,:)+h.*(f(t(i),w(i)));
    end
    e=abs(yex(t)-w);
endfunction