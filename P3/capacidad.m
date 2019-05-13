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
L = size(Q,2);

%calculamos el vector de probabilidades. Obtenemos las parejas de
%combinaciones
M = combinacionesX(L);

%Creamos el vector de informaciones mutuas
info = zeros(size(M,1), 1);

%para el tamaño del vector obtenido, iteramos
for i=1:size(M,1)
    %Calculamos P. multiplicamos Q, por la traspuesta del vector
    prob_vector = [M(i,1), M(i,2)]';
    prob = repmat(prob_vector, 1, L);
    P = Q .* prob;
    %De la P obtenida, calculamos la información mutua
    I = informacionmutua(P);
    %guardamos la información mutua en el vector de infos
    info(i) = I;
end

% cuando terminamos, calculamos el maximo, con dos outputs, para obtener el
% indice
[C, index] = max(info,[],1);
% con ese indice vamos al vector de combinaciones
pX = M(index, 1);
end