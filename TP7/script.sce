a=[1 0 0];
b=[0 23/12 -16/12 5/12];

//a=[1 0 0];
//b=[9/24 19/24 -5/24 1/24];

p=2;

function tot = f(a,b,p,k)
    asum=0;
    bsum=0;
    for (j=0:p)
        asum=asum+((-j)^k)*a(j+1);
        //disp(j)
        //disp(asum)
    end
    for (j=-1:p)
        bsum=bsum+((-j)^(k-1))*b(j+2);
        //disp(j)
        //disp(bsum)
    end
    tot=asum+k*bsum;
endfunction

k=2;
tot=f(a,b,p,k);
disp(k)
disp(tot)

k=3;
tot=f(a,b,p,k);
disp(k)
disp(tot)

k=4;
tot=f(a,b,p,k);
disp(k)
disp(tot)

k=5;
tot=f(a,b,p,k);
disp(k)
disp(tot)