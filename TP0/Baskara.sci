function [r] = Baskara(v)
    // Controla que a sea distinto de 0
    if (v(1)<>0) then
        // Calcula el discriminante
        disc=v(2).^2-4*v(1)*v(3)
        
        // Calcula las raíces
        x1=(-v(2)+sqrt(disc))/2*v(1);
        x2=(-v(2)-sqrt(disc))/2*v(1);
        
        // Informa el tipo de raíz según el discriminante
        if (disc>0) then
            mprintf('Las raíces son reales, distintas.\n\n')
        elseif (disc==0) then
            mprintf('Las raíces son reales, iguales.\n\n')
        else
            mprintf('Las raíces son complejas conjugadas.\n\n')
        end
        
        r=[x1 x2];
    else
        mprintf('No se puede aplicar la fórmula.\n\n')
    end
endfunction