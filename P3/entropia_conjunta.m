function [HXY, HX, HY, HXcondY, HYcondX] = entropia_conjunta(P)
% Calculo de la entropia conjunta de la variable XY, expresada por una 
% matriz P con la funcion de masa conjunta, siendo P(i,j)=prob(X=i,Y=j)

% P como la matriz de masa.
    HXY = -sum(P(P~=0).*log2(P(P~=0)));

    % La entropia de las columnas es la entropia de Y.
    PY = sum(P);
    HY = entropia(PY);
   
    % La entropia de las filas es la p marginal de X.
    PX = sum(P,2);
    HX = entropia(PX);
    
    % Probabilidad condicionada y entropia condicionada
    PXcondY = P/PY;
    PYcondX = P/PX';
    HXcondY = entropia(PXcondY);
    HYcondX = entropia(PYcondX);
    
end