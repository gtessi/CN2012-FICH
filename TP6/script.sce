function y = f(x)
    y=sin(x);
endfunction

exec simp_comp.sci;

a=0;
b=%pi;
M=20;

s=simp_comp(f,a,b,M);

disp(s);