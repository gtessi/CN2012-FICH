function [a,b,c,d] = cubic_spline_natural(x,f)
    n=length(x);
    h=x(2:n)-x(1:n-1); //vector de saltos
    //calculamos a
    a=f; //aj=f(xj)
    
    //armamos b del sistema
    b(1)=0;
    for (i=2:n-1)
        b(i)=(3/h(i))*(a(i+1)-a(i))-(3/h(i-1))*(a(i)-a(i-1));
    end
    b(n)=0;
    
    //armamos A
    A(1,1)=1;
    for (i=2:n-1)
        A(i,i-1:i+1)=[h(i-1) 2*(h(i-1)+h(i)) h(i)];
    end
    A(n,n)=1;
    
    //calculamos c
    c=A\b;
    c=c';
    
    //calculamos b y d
    d=(c(2:n)-c(1:n-1))./(3*h(1:n-1));
    b=((a(2:n)-a(1:n-1))./h(1:n-1))-((2*c(1:n-1)+c(2:n)).*(h(1:n-1)/3));
endfunction