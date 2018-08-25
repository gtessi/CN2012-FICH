function S = eval_spline(x,vector)
    x0=x(1);
    S=vector(1)+vector(2)*(x-x0)+vector(3)*((x-x0)^2)+vector(4)*((x-x0)^3);
endfunction