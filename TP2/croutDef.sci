function [L, U] = croutDef(A)
    [Ldoo, Udoo]=factLU(A);
    D=diag(diag(Udoo));
    L=Ldoo*D;
    U=Ldoo';
endfunction