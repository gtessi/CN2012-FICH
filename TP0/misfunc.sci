function [x, y] = polarCart(r, t)
    // Conversion de coordenadas polares a cartesianas.
    x = r*cos(t)
    y = r*sin(t)
endfunction

//--------------------------------------------------------

function [x, y] = polarCartGr(r, t)
    // Conversion de coordenadas polares a cartesianas,
    // el angulo esta dado en grados.
    [x, y] = polarCart(r, t*%pi/180)
endfunction

//--------------------------------------------------------

function fx = f(x)
    fx = x(1).^2 + x(2).^2
endfunction