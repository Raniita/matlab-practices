function [HXY, HX, HY, HXcondY, HYcondX] = entropia_conjunta(P)
% Calculo de la entropia conjunta de la variable XY, expresada por una 
% matriz P con la funcion de masa conjunta, siendo P(i,j)=prob(X=i,Y=j)

    % Sacamos las dimensiones de P
    [fila, columna] = size(P);
    
    % P como la matriz de masa.
    HXY = -sum(P(P~=0).*log2(P(P~=0)));

    % La entropia de las columnas es la entropia de Y.
    PY = sum(P);
    HY = entropia(PY);
    % Ajustes para dividir
    PY = repmat(PY,fila,1);
   
    % La entropia de las filas es la p marginal de X.
    PX = sum(P,2);
    HX = entropia(PX);
    % Ajustes para dividir
    PX = repmat(PX,1,columna);
    
    % Probabilidad condicionada y entropia condicionada
    PXcondY = P./PY;
    PXcondY(isnan(PXcondY)) = 0;
    PYcondX = P./PX;
    PYcondX(isnan(PYcondX)) = 0;
    HXcondY = entropia(PXcondY);
    HYcondX = entropia(PYcondX);
end