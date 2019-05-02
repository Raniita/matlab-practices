function I = informacionmutua(P)
% Calculo de la información mutua de las variables X e Y
% P proporciona su masa conjunta

    [HXY, HX, HY] = entropia_conjunta(P);
    
    % Por propiedades obtenemos que
    I = HX + HY - HXY;

end