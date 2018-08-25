function d = dif_div(x,f)
    n=length(x);
    Q=zeros(n,n);
    Q(:,1)=f';
    for (i=2:n)
        for (j=2:i)
            Q(i,j)=((Q(i,j-1)-Q(i-1,j-1))/(x(i)-x(i-j+1)));
        end
    end
    //en la diagonal quedan los coeficientes
    d=diag(Q);
endfunction