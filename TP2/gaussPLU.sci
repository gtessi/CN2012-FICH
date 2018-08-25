function [P, L, U] = gaussPLU(A)
    n=size(A,1);
    L=zeros(n,n);
    P=eye(n,n);
    indx=1:n; // índices sin permutar
    for (k=1:n-1)
        // busca el pivot mas grande
        [val,p]=max(abs(A(indx(k:n),k)));
        
        p=p+(k-1);
        
        if (val==0) then
            mprintf('No existe solución única.\n\n')
            abort;
        end
        
        if (indx(p)<>indx(k))
            temp=indx(p);
            indx(p)=indx(k);
            indx(k)=temp;
        end
        
        // eliminación de gauss
        for (i=k+1:n)
            m=A(indx(i),k)/A(indx(k),k);
            L(indx(i),k)=m; // genero la matrix L
            A(indx(i),k)=0;
            A(indx(i),k+1:n)=A(indx(i),k+1:n)-m*A(indx(k),k+1:n);
        end
    end
    // genero la matriz P a partir del vector indx
    P=P(indx(:),:);
    // agrego unos en L donde corresponda
    for (i=1:n)
        L(indx(i),i)=1;
    end
    // genero la matriz U
    U=P*A;
    // genero la matriz L
    L=P*L;
endfunction