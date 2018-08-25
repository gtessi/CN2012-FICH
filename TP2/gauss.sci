function x = gauss(A,b)
    n=length(b);
    x=zeros(n,1);
    for (k=1:n-1)
        for (i=k+1:n)
            if (A(k,k)==0) then
                mprintf('No existe solución única.\n\n')
                abort;
            end
            m=A(i,k)/A(k,k);
            A(i,k)=0;
            A(i,k+1:n)=A(i,k+1:n)-m*A(k,k+1:n);
            b(i)=b(i)-m*b(k);
        end
    end
    x=backSub(A,b);
endfunction