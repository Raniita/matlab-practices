function [HXY, HX, HY, HXcondY, HYcondX] = entropia_conjunta(P)
% Calculo de la entropia conjunta de la variable XY, expresada por una 
% matriz P con la funcion de masa conjunta, siendo P(i,j)=prob(X=i,Y=j)
    
    % Primera version
    HXY = -sum(P(P~=0).*log2(P(P~=0)));

    % La entropia de las columnas es la entropia de Y.
    HY = entropia(sum(P));
   
    % La entropia de las filas es la p marginal de X.
    HX = entropia(sum(P,2));
    
    P(1,:); % Fila
    P(:,1); % Columna
end