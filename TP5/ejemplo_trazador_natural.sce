//ejemplo trazador cubico
x=[0.9 1.3 1.9 2.1 2.6 3.0 3.9 4.4 4.7 5.0 6.0 7.0 8.0 9.2 10.5 11.3 11.6 12.0 12.6 13.0 13.3];

fx=[1.3 1.5 1.85 2.1 2.6 2.7 2.4 2.15 2.05 2.1 2.25 2.3 2.25 1.95 1.4 0.9 0.7 0.6 0.5 0.4 0.25];

exec cubic_spline_natural.sci

figure(1);

[a,b,c,d]=cubic_spline_natural(x,fx);

nsplines=length(x)-1;

plot(x,fx);
for i=1:nsplines
   tx=x(i):0.01:x(i+1);
   tfx=a(i)+b(i).*(tx-x(i))+c(i).*(tx-x(i)).^2+d(i).*(tx-x(i)).^3;
   plot(tx,tfx,'r');
end

