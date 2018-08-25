function [L] = choleskyDef(A)
    [Ldoo, Udoo]=factLU(A);
    D=diag(diag(Udoo));
    Draiz=sqrt(D);
    L=Ldoo*Draiz;
endfunction