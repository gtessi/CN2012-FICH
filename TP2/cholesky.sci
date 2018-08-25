function [L] = cholesky(A)
    n=size(A,1);
    L=zeros(n,n);
    // raiz del primer elemento de L
    L(1,1)=sqrt(A(1,1));
    // cálculo de los demás elementos de L, columna 1
    for (j=2:n)
        L(j,1)=A(j,1)/L(1,1);
    end
    // cálculo de los elementos internos de L
    for (i=2:n-1)
        // antes de la diagonal
        suma=0;
        for (k=1:i-1)
            suma=suma+(L(i,k).^2);
        end
        // factor de la diagonal de L
        L(i,i)=sqrt(A(i,i)-suma);
        // después de la diagonal
        for (j=i+1:n)
            suma=0;
            for (k=1:i-1)
                suma=suma+(L(j,k)*L(i,k));
            end
            L(j,i)=(A(j,i)-suma)/L(i,i);
        end
    end
    // cálculo del último elemento de L
    suma=0;
    for (k=1:n-1)
        suma=suma+(L(n,k).^2);
    end
    L(n,n)=sqrt(A(n,n)-suma);
endfunction