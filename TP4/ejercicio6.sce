//Funciones
function y = h(t)
    h0=300; //altura inicial
    g=32.17; //fuerza de gravedad
    k=0.1; //resistencia viscosa
    m=0.25; //masa del cuerpo
    factor=m/k;
    y=h0-(g*factor)*t+(g*factor^2)*(1-exp(-t/factor));
endfunction

//Derivadas
function y = dh(t)
    g=32.17; //fuerza de gravedad
    k=0.1; //resistencia viscosa
    m=0.25; //masa del cuerpo
    factor=m/k;
    y=factor*g*(exp(-t/factor)-1);
endfunction

function [raiz,datos] = ejercicio6()
    //Metodos
    exec biseccion.sci
    exec newton.sci;
    
    //Variables globales
    tol=1E-2; //precision de 0.01s
    maxit=20;
    pini=0; //aproximación inicial
    
    //Calculos
    //Aplicamos el Metodo de la Biseccion con 2 iteraciones para obtener un punto inicial
    //Definimos intervalos
    xmin=0; //No existe tiempo negativo
    xmax=20; //Limite de tiempo para que toque el suelo
    [pini,r]=biseccion(h,xmin,xmax,3,tol);
    //Luego de obtener un punto inicial aproximado, aplicamos el Metodo de Newton
    [raiz,datos]=newton(h,dh,pini,maxit,tol);
    
    //Graficos
    figure(1);
    plot2d("nl",datos,style=5);
    legend(['newton'],1);
endfunction