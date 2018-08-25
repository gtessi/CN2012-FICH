function x = forwSub(A,b)
    n = length(b);
    x = zeros(n);
    if A(1,1)==0 then
        mprintf('No se puede resolver.\n\n')
    else
        x(1)=b(1)/A(1,1);
        for (i=2:n)
            x(i)=(b(i)-A(i,1:i-1)*x(1:i-1))/A(i,i);
        end
    end
endfunction