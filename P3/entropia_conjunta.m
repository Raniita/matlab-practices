function [HXY, HX, HY, HXcondY, HYcondX] = entropia_conjunta(P)
% Calculo de la entropia conjunta de la variable XY, expresada por una 
% matriz P con la funcion de masa conjunta, siendo P(i,j)=prob(X=i,Y=j)

% P como la matriz de masa.

    % Primera version
    HXY = -sum(P(P~=0).*log2(P(P~=0)));

    % La entropia de las columnas es la entropia de Y.
    Y = sum(P);
    HY = entropia(Y);
   
    % La entropia de las filas es la p marginal de X.
    X = sum(P,2);
    HX = entropia(X);
    
    % Probabilidad condicionada
    %PXcondY = P./Y;
    %PYcondX = P./X;
    
    %HXcondY = entropia(PXcondY);
    %HYcondX = entropia(PYcondX);
    
    HXcondY = 0;
    HYcondX = 0;
    
    P(1,:); % Fila
    P(:,1); % Columna
end