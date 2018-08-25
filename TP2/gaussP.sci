function [x, indx] = gaussP(A,b)
    n=length(b);
    x=zeros(n,1);
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
            A(indx(i),k)=0;
            A(indx(i),k+1:n)=A(indx(i),k+1:n)-m*A(indx(k),k+1:n);
            b(indx(i))=b(indx(i))-m*b(indx(k));
        end
    end
    // sustituyo hacia atrás con índices
    x=ibackSub(A,b,indx);
endfunction