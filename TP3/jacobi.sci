function [x,it,r_h] = jacobi(A,b,x0,maxit,tol)
    n=length(b);
    err=1; // error
    k=1;
    x=x0;
    r_h=zeros(1,n);
    while (k<maxit & err>tol)
        for (i=1:n)
            // calculo el nuevo x
            x(i)=(b(i)-A(i,1:i-1)*x0(1:i-1)-A(i,i+1:n)*x0(i+1:n))/A(i,i);
        end
        // calculo la norma del residuo
        norma_res=norm(b-A*x);
        // actualizo el vector de residuos
        r_h(1,k)=norma_res;
        // calculo el vector de error || x(k) - x(k-1) ||
        e=x-x0;
        // calculo el error relativo de la solución
        err=norm(e);
        // aumento k
        k=k+1;
        // preparo la nueva solución para la próxima iteración
        x0=x;
    end
    it=k;
endfunction