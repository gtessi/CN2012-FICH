function [L, U] = crout(A)
    n=size(A,1);
    U=eye(n,n);
    L=zeros(n,n);
    // recorro cada fila de la matriz
    for (k=1:n)
        // armo la matriz L
        for (i=k:n)
            suma=0;
            for (p=1:k-1)
                suma=suma+L(i,p)*U(p,k);
            end
            L(i,k)=A(i,k)-suma;
        end
        // armo la matriz U
        for (j=k+1:n)
            suma=0;
            for (p=1:k-1)
                suma=suma+L(k,p)*U(p,j);
            end
            U(k,j)=(A(k,j)-suma)/L(k,k);
        end
    end
endfunction