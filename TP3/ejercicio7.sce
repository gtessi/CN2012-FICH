function av = autovalores(A)
    eigval=abs(spec(A));
    av=max(eigval);
endfunction

function rho = ejercicio7()
    //Metodos
    exec jacobi.sci;
    exec gs.sci;
    exec sor.sci;
    exec gc.sci;
    //Variables globales
    tol=1E-8;
    maxit=50;
    w=1.07;
    //Declaracion de las matrices
    A4=zeros(4,4);
    A8=zeros(8,8);
    A16=zeros(16,16);
    //Declaracion de las dimensiones
    n4=size(A4,1);
    n8=size(A8,1);
    n16=size(A16,1);
    //Declaracion de los vectores independientes
    b4=zeros(n4,1);
    b8=zeros(n8,1);
    b16=zeros(n16,1);
    //Declaracion de los vectores solucion iniciales
    x04=zeros(n4,1);
    x08=zeros(n8,1);
    x016=zeros(n16,1);
    //Declaracion de los vectores solucion
    x4=zeros(n4,1);
    x8=zeros(n8,1);
    x16=zeros(n16,1);
    //Estructuras basicas
    fila=[-1 4 -1];
    columna=[0.5 2 0.25 1]';
    //Matrices con los resultados de cada metodo, para cada matriz
    r_h4=zeros(4,maxit);
    r_h8=zeros(4,maxit);
    r_h16=zeros(4,maxit);
    //Vector radios espectrales
    rho=zeros(3,1);
    
    //Construccion del sistema
    //Primera fila de las matrices
    A4(1,1:2)=[fila(2) fila(3)];
    A8(1,1:2)=[fila(2) fila(3)];
    A16(1,1:2)=[fila(2) fila(3)];
    
    //Llenamos las matrices
    //4x4
    for (i=2:n4-1)
        A4(i,i-1:i+1)=fila;
    end
    //8x8
    for (i=2:n8-1)
        A8(i,i-1:i+1)=fila;
    end
    //16x16
    for (i=2:n16-1)
        A16(i,i-1:i+1)=fila;
    end
    
    //Ultima fila de las matrices
    A4(n4,n4-1:n4)=[fila(1) fila(2)];
    A8(n8,n8-1:n8)=[fila(1) fila(2)];
    A16(n16,n16-1:n16)=[fila(1) fila(2)];
    
    //Llenamos el vector b
    b4=columna;
    b8=[columna; columna/2];
    b16=[columna; columna/2; columna/4; columna/8];
    
    //Calculos
    //4x4
    
    //Jacobi
    tic(); //Inicia el timer
    [x4,it4,r_h]=jacobi(A4,b4,x04,maxit,tol);
    t4=toc(); //Corta el timer
    r_h4(1,1:length(r_h))=r_h; //Llena el vector de residuos
    
    //Gauss-Seidel
    tic(); //Inicia el timer
    [x4,it4,r_h]=gs(A4,b4,x04,maxit,tol);
    t4=toc(); //Corta el timer
    r_h4(2,1:length(r_h))=r_h; //Llena el vector de residuos
    
    //SOR
    tic(); //Inicia el timer
    [x4,it4,r_h]=sor(A4,b4,x04,maxit,tol,w);
    t4=toc(); //Corta el timer
    r_h4(3,1:length(r_h))=r_h; //Llena el vector de residuos
    
    //Gradiente conjugado
    tic(); //Inicia el timer
    [x4,it4,r_h]=gc(A4,b4,x04,tol);
    t4=toc(); //Corta el timer
    r_h4(4,1:length(r_h))=r_h; //Llena el vector de residuos
    
    //Graficas
    figure(1);
    plot2d("nn",r_h4(1,:),style=1);
    plot2d("nn",r_h4(2,:),style=2);
    plot2d("nn",r_h4(3,:),style=3);
    plot2d("nn",r_h4(4,:),style=5);
    legend(['jacobi','gauss-seidel','sor','gradiente conjugado']);
    
    //8x8
    
    //Jacobi
    tic(); //Inicia el timer
    [x8,it8,r_h]=jacobi(A8,b8,x08,maxit,tol);
    t8=toc(); //Corta el timer
    r_h8(1,1:length(r_h))=r_h; //Llena el vector de residuos
    
    //Gauss-Seidel
    tic(); //Inicia el timer
    [x8,it8,r_h]=gs(A8,b8,x08,maxit,tol);
    t8=toc(); //Corta el timer
    r_h8(2,1:length(r_h))=r_h; //Llena el vector de residuos
    
    //SOR
    tic(); //Inicia el timer
    [x8,it8,r_h]=sor(A8,b8,x08,maxit,tol,w);
    t8=toc(); //Corta el timer
    r_h8(3,1:length(r_h))=r_h; //Llena el vector de residuos
    
    //Gradiente conjugado
    tic(); //Inicia el timer
    [x8,it8,r_h]=gc(A8,b8,x08,tol);
    t8=toc(); //Corta el timer
    r_h8(4,1:length(r_h))=r_h; //Llena el vector de residuos
    
    //Graficas
    figure(2);
    plot2d("nn",r_h8(1,:),style=1);
    plot2d("nn",r_h8(2,:),style=2);
    plot2d("nn",r_h8(3,:),style=3);
    plot2d("nn",r_h8(4,:),style=5);
    legend(['jacobi','gauss-seidel','sor','gradiente conjugado']);
    
    //16x16
    
    //Jacobi
    tic(); //Inicia el timer
    [x16,it16,r_h]=jacobi(A16,b16,x016,maxit,tol);
    t16=toc(); //Corta el timer
    r_h16(1,1:length(r_h))=r_h; //Llena el vector de residuos
    
    //Gauss-Seidel
    tic(); //Inicia el timer
    [x16,it16,r_h]=gs(A16,b16,x016,maxit,tol);
    t16=toc(); //Corta el timer
    r_h16(2,1:length(r_h))=r_h; //Llena el vector de residuos
    
    //SOR
    tic(); //Inicia el timer
    [x16,it16,r_h]=sor(A16,b16,x016,maxit,tol,w);
    t16=toc(); //Corta el timer
    r_h16(3,1:length(r_h))=r_h; //Llena el vector de residuos
    
    //Gradiente conjugado
    tic(); //Inicia el timer
    [x16,it16,r_h]=gc(A16,b16,x016,tol);
    t16=toc(); //Corta el timer
    r_h16(4,1:length(r_h))=r_h; //Llena el vector de residuos
    
    //Graficas
    figure(3);
    plot2d("nn",r_h16(1,:),style=1);
    plot2d("nn",r_h16(2,:),style=2);
    plot2d("nn",r_h16(3,:),style=3);
    plot2d("nn",r_h16(4,:),style=5);
    legend(['jacobi','gauss-seidel','sor','gradiente conjugado']);
    
    //Calculo de los radios espectrales
    rho(1)=autovalores(A4);
    rho(2)=autovalores(A8);
    rho(3)=autovalores(A16);
endfunction