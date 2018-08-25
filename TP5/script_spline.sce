exec eval_spline.sci;

//Puntos
x=[8.3 8.6]';
//Coeficientes [a b c d]
coef=[17.56492 1.116256 20.06827667 -44.46466667]';

//Llamada al polinomio cubico
S=eval_spline(x,coef);

//Muestra el resultado
disp(S)