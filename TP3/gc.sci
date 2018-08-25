function [x,it,r_h] = gc(A,b,x0,tol)
    x=x0;
    // calculo r0
    r_h=b-A*x0;
    // vector residuos
    res(1)=norm(r_h);
    // la primer direccion es la del residuo
    p=r_h;
    rho=r_h'*p;
    rhoOld=rho;
    it=1;
    // ***controlar las condiciones
    while (norm(r_h)>tol)
        a=A*p; // producto matriz-vector
        m=p'*a; // producto interno
        // cuanto nos desplazamos
        alfa=rho/m;
        x=x+alfa*p;
        // calculo la nueva direccion
        r_h=r_h-alfa*a;
        // calculo el nuevo residuo
        res(it+1)=norm(r_h);
        rhoOld=rho;
        rho=r_h'*r_h; // producto interno
        gamm=rho/rhoOld;
        p=r_h+gamm*p;
        
        it=it+1;
    end
    r_h=res';
endfunction