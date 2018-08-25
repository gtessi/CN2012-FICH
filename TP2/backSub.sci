function x = backSub(A,b)
    n=length(b);
    x=zeros(n);
    if A(n,n)==0 then
        mprintf('No se puede resolver.\n\n')
    else
        x(n)=b(n)/A(n,n);
        for (i=n-1:-1:1)
            x(i)=(b(i)-A(i,i+1:n)*x(i+1:n))/A(i,i);
        end
    end
endfunction