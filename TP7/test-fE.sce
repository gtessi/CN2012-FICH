exec forwardEuler.sci;

function z = yex(x)
    z=((x'+1)^2) - 0.5 .* exp(x');
endfunction

function z = y(x,y)
    z=y-(x'.^2)+1;
endfunction

h=0.05;
a=0;
b=2;
alfa=0.5;

[t,w,e]=forwardEuler(y,a,b,h,alfa,yex);

plot(t,yex(t),'b'); //exacta
plot(t,w,'k'); //forward Euler