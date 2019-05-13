function [C, pX] = capacidad(Q)
% Calcula la capcaidad de un canal definido por su matriz Q.
% Devuelve tambien la masa de X
% La funcion combinacionesX(L) le devuelve todas las posibles combinaciones
% para la masa de X, siendo L el numero de simbolos del alfabeto de X. 

%Q tiene que ser NxN, siendo N el numero de simbolos
% La p que tiene Q, es una p diferente a la que multiplicaremos por P
% Para cada valor, o pareja de valores que sacamos de las permutaciones, lo
% que hacemos es multiplicarlo por Q, obtenemos P(x,y) y de ahi calculamos
% la información mutua. 

%obtenemos el numero de simbolos
L = size(A,2);

%calculamos el vector de probabilidades. Obtenemos las parejas de
%combinaciones
M = permn([0:0.01:1], L);

%para el tamaño del vector obtenido, iteramos
for i=1:size(M,1)
    %multiplicamos Q, por la traspuesta del vector
    prob_vector = [M(i,1), M(i,2)]';
    %De la P obtenida, calculamos la información mutua
    %guardamos la información mutua en el vector de infos

end

% cuando terminamos, calculamos el maximo, con dos outputs, para obtener el
% indice
end