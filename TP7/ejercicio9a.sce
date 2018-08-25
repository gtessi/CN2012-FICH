exec RungeKutta4.sci;

//Los valores del metodo se toman como vectores horizontales

function z = f(t,u)
    z(1,1)=-4*u(1,1)-2*u(1,2)+cos(t)+4*sin(t);
    z(1,2)=3*u(1,1)+u(1,2)-3*sin(t);
endfunction

function z = yex(t)
    z(:,1)=(2 .* exp(-t')) - (2 .* exp(-2*t')) + sin(t');
    z(:,2)=(-3 .* exp(-t')) + (2 .* exp(-2*t'));
endfunction

alfa=[0 -1];
a=0;
b=2;

//Para h=0.2
h1=0.2;
[t1,w1,e1] = RungeKutta4(f,a,b,h1,alfa,yex);

//Para h=0.1
h2=0.1;
[t2,w2,e2] = RungeKutta4(f,a,b,h2,alfa,yex);

//Para h=0.05
h3=0.05;
[t3,w3,e3] = RungeKutta4(f,a,b,h3,alfa,yex);

//Errores maximos para cada ecuacion
emax1=[max(e1(:,1)) max(e1(:,2))];
emax2=[max(e2(:,1)) max(e2(:,2))];
emax3=[max(e3(:,1)) max(e3(:,2))];

disp(emax1')
disp(emax2')
disp(emax3')