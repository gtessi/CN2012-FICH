function [L, U] = factLU(A)
    n=size(A,1);
    L=eye(n,n);
    for (k=1:n-1)
        for (i=k+1:n)
            if (A(k,k)==0) then
                mprintf('No se puede factorizar.\n\n')
                abort;
            end
            m=A(i,k)/A(k,k);
            L(i,k)=m;
            A(i,k)=0;
            for (j=k+1:n)
                A(i,j)=A(i,j)-m*A(k,j);
            end
        end
    end
    U=A;
endfunction