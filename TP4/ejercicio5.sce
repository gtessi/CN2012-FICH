//Funciones
function y = A(x)
    y=tan(x);
endfunction

function y = B(x)
    y=1+x^2;
endfunction

function y = C(x)
    y=x*(1+sin(1/x));
endfunction

//Derivadas
function y = dA(x)
    y=1/((cos(x))^2);
endfunction

function y = dB(x)
    y=2*x;
endfunction

function y = dC(x)
    y=1+(sin(1/x))-(cos(1/x)/x);
endfunction

//Funciones de punto fijo
function y = gA(x)
    y=x-tan(x);
endfunction

function y = gB(x)
    y=x-(1+x^2);
endfunction

function y = gC(x)
    y=x-x*(1+sin(1/x));
endfunction

function [raices, datos] = ejercicio5()
    //Metodos
    exec biseccion.sci;
    exec puntofijo.sci;
    exec newton.sci;
    exec secante.sci;
    exec posicionfalsa.sci;
    
    //Variables globales
    tol=1E-5;
    maxit=20;
    //Intervalos y puntos iniciales acordes a cada funcion
    //tan(x)
    xminA=2;
    xmaxA=4;
    piniA=2.1;
    //1+x^2
    xminB=-0.5;
    xmaxB=1.5;
    piniB=-0.3;
    //x*(1+sin(1/x))
    xminC=-2;
    xmaxC=-0.25;
    piniC=-1.99;
    
    //Matrices de resultados
    datosA=zeros(5,maxit);
    datosB=zeros(5,maxit);
    datosC=zeros(5,maxit);
    raicesA=zeros(5,1);
    raicesB=zeros(5,1);
    raicesC=zeros(5,1);
    
    //Calculos
    //tan(x)
    [x,h]=biseccion(A,xminA,xmaxA,maxit,tol);
    datosA(1,:)=h;
    raicesA(1,1)=x;
    [x,h]=posicionfalsa(A,xminA,xmaxA,maxit,tol);
    datosA(2,:)=h;
    raicesA(2,1)=x;
    [x,h]=secante(A,xminA,xmaxA,maxit,tol);
    datosA(3,:)=h;
    raicesA(3,1)=x;
    [x,h]=puntofijo(gA,piniA,maxit,tol);
    datosA(4,:)=h;
    raicesA(4,1)=x;
    [x,h]=newton(A,dA,piniA,maxit,tol);
    datosA(5,:)=h;
    raicesA(5,1)=x;
    
    //1+x^2
    [x,h]=biseccion(B,xminB,xmaxB,maxit,tol);
    datosB(1,:)=h;
    raicesB(1,1)=x;
    [x,h]=posicionfalsa(B,xminB,xmaxB,maxit,tol);
    datosB(2,:)=h;
    raicesB(2,1)=x;
    [x,h]=secante(B,xminB,xmaxB,maxit,tol);
    datosB(3,:)=h;
    raicesB(3,1)=x;
    [x,h]=puntofijo(gB,piniB,maxit,tol);
    datosB(4,:)=h;
    raicesB(4,1)=x;
    [x,h]=newton(B,dB,piniB,maxit,tol);
    datosB(5,:)=h;
    raicesB(5,1)=x;
    
    //x*(1+sin(1/x))
    [x,h]=biseccion(C,xminC,xmaxC,maxit,tol);
    datosC(1,:)=h;
    raicesC(1,1)=x;
    [x,h]=posicionfalsa(C,xminC,xmaxC,maxit,tol);
    datosC(2,:)=h;
    raicesC(2,1)=x;
    [x,h]=secante(C,xminC,xmaxC,maxit,tol);
    datosC(3,:)=h;
    raicesC(3,1)=x;
    [x,h]=puntofijo(gC,piniC,maxit,tol);
    datosC(4,:)=h;
    raicesC(4,1)=x;
    [x,h]=newton(C,dC,piniC,maxit,tol);
    datosC(5,:)=h;
    raicesC(5,1)=x;
    
    //Graficas
    //tan(x)
    figure(1);
    plot2d("nl",datosA(1,:),style=1);
    plot2d("nl",datosA(2,:),style=2);
    plot2d("nl",datosA(3,:),style=3);
    plot2d("nl",datosA(4,:),style=4);
    plot2d("nl",datosA(5,:),style=5);
    //legend(['biseccion','posicion falsa','secante','punto fijo','newton']);
    
    //1+x^2
    figure(2);
    plot2d("nl",datosB(1,:),style=1);
    plot2d("nl",datosB(2,:),style=2);
    plot2d("nl",datosB(3,:),style=3);
    plot2d("nl",datosB(4,:),style=4);
    plot2d("nl",datosB(5,:),style=5);
    //legend(['biseccion','posicion falsa','secante','punto fijo','newton']);
    
    //x*(1+sin(1/x))
    figure(3);
    plot2d("nl",datosC(1,:),style=1);
    plot2d("nl",datosC(2,:),style=2);
    plot2d("nl",datosC(3,:),style=3);
    plot2d("nl",datosC(4,:),style=4);
    plot2d("nl",datosC(5,:),style=5);
    //legend(['biseccion','posicion falsa','secante','punto fijo','newton']);
    
    datos=[datosA; datosB; datosC];
    raices=[raicesA; raicesB; raicesC];
endfunction