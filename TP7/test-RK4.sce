exec RungeKutta4.sci;

function z = yex(x)
    z=((x' .* exp(3 .* x')) ./5) - ((exp(3 .* x')) ./ 25) + ((exp(-2 .* x')) ./ 25);
endfunction

function z = y(x,y)
    z=(x' .* exp(3.*x')) - 2 .* y;
endfunction

h=0.05;
a=0;
b=1;
alfa=0;

[t,w,e]=RungeKutta4(y,a,b,h,alfa,yex);

plot(t,yex(t),'b'); //exacta
plot(t,w,'k'); //Runge-Kutta Orden 4