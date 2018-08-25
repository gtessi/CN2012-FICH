exec RungeKutta4.sci;

//Los valores del metodo se toman como vectores horizontales

function z = f(t,u)
    z(1,1)=u(2);
    z(1,2)=(t .* log(t)) + (2 ./ t) .* u(2) - (2 ./ (t .^ 2)) .* u(1);
endfunction

function z = yex(t)
    z=((7/4) .* t) + ((1/2) .* (t .^ 3) .* log(t)) - ((3/4) .* (t .^ 3));
endfunction

function z = dyex(t)
    z=(7/4)+((1/2) .* (((3 .* (t .^ 2)) .* log(t))+(t .^ 2)))-((9/4) .* (t .^ 2));
endfunction

function [w] = RK4(f,a,b,h,alfa)
    N=(b-a)/h;
    t=(a:h:b);
    w(1,:)=alfa;
    for (i=1:N)
        K1=h*f(t(i),w(i,:));
        K2=h*f(t(i)+0.5*h,w(i,:)+0.5.*K1);
        K3=h*f(t(i)+0.5*h,w(i,:)+0.5.*K2);
        K4=h*f(t(i)+h,w(i,:)+K3);
        g(i,:)=K1+2*K2+2*K3+K4;
        w(i+1,:)=w(i,:)+(1/6).*g(i,:);
    end
endfunction

function [t,w] = RK4AM3(f,a,b,h,alfa)
    N=(b-a)/h;
    t=(a:h:b);
    //[w(1:3,:)]=RK4(f,a,a+2*h,h,alfa); //aca me salta error de matriz mal definida
    //Hago RK4 'a pata' para las tres primeras aproximaciones
    w(1,:)=alfa;
    for (i=1:3)
        K1=h*f(t(i),w(i,:));
        K2=h*f(t(i)+0.5*h,w(i,:)+0.5.*K1);
        K3=h*f(t(i)+0.5*h,w(i,:)+0.5.*K2);
        K4=h*f(t(i)+h,w(i,:)+K3);
        g(i,:)=K1+2*K2+2*K3+K4;
        w(i+1,:)=w(i,:)+(1/6).*g(i,:);
    end
    for (n=3:N)
        //predictor
        //Runge-Kutta 4 modificado
        K1=h*f(t(n),w(n,:));
        K2=h*f(t(n)+0.5*h,w(n,:)+0.5*K1);
        K3=h*f(t(n)+0.5*h,w(n,:)+0.5*K2);
        K4=h*f(t(n)+h,w(n,:)+K3);
        g(n,:)=K1+2*K2+2*K3+K4;
        w(n+1,:)=w(n,:)+(1/6)*g(n,:);
        //corrector
        w(n+1,:)=w(n,:)+(h/24)*(9*f(t(n+1),w(n+1,:))+19*f(t(n),w(n,:))-5*f(t(n-1),w(n-1,:))+f(t(n-2),w(n-2,:)));
    end
endfunction

alfa=[1 0];
a=1;
b=2;

//Para h=0.2
h1=0.2;
[t1,w1] = RK4AM3(f,a,b,h1,alfa);

//Para h=0.1
h2=0.1;
[t2,w2] = RK4AM3(f,a,b,h2,alfa);

//Para h=0.05
h3=0.05;
[t3,w3] = RK4AM3(f,a,b,h3,alfa);

//Errores
e1=[abs(yex(t1')-w1(:,1)) abs(dyex(t1')-w1(:,2))];
e2=[abs(yex(t2')-w2(:,1)) abs(dyex(t2')-w2(:,2))];
e3=[abs(yex(t3')-w3(:,1)) abs(dyex(t3')-w3(:,2))];

//Errores maximos para cada ecuacion
emax1=[max(e1(:,1)) max(e1(:,2))];
emax2=[max(e2(:,1)) max(e2(:,2))];
emax3=[max(e3(:,1)) max(e3(:,2))];

disp(emax1')
disp(emax2')
disp(emax3')