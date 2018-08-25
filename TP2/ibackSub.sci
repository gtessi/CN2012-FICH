function x = ibackSub(A,b,indx)
    n=length(b);
    x=zeros(n,1);
    for (i=n:-1:1)
        x(i)=(b(indx(i))-A(indx(i),i+1:n)*x(i+1:n))/A(indx(i),i);
    end
endfunction