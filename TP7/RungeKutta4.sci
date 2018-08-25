function [t,w,e] = RungeKutta4(f,a,b,h,alfa,yex)
    N=(b-a)/h;
    t=(a:h:b);
    w(1,:)=alfa;
    for (i=1:N)
        K1=h*f(t(i),w(i,:));
        K2=h*f(t(i)+0.5*h,w(i,:)+0.5*K1);
        K3=h*f(t(i)+0.5*h,w(i,:)+0.5*K2);
        K4=h*f(t(i)+h,w(i,:)+K3);
        g(i,:)=K1+2*K2+2*K3+K4;
        w(i+1,:)=w(i,:)+(1/6).*g(i,:);
    end
    e=abs(yex(t)-w);
endfunction