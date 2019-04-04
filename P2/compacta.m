function [indA, indB, acumulado, nuevop] = compacta(p)
%indA -> indice menor del vector P
%indB -> segundo indice menor del vector P
%acumulado -> suma de las probs de los 2 indices
%nuevoP -> nuevo vector de probs.

%busca los indices del alfabeto que tengan menor probabilidad y devuelve un
%acumulado de sus probabilidades.

%si el vector no se puede reducir [-1, -1, 0, []]

acumulado = 0;
nuevop = p;

% Encontramos el primer minimo y le ponemos un NaN.
[minimo, indA] = min(nuevop,[],2);
acumulado = acumulado + minimo;
nuevop(indA) = NaN;

[minimo, indB] = min(nuevop,[],2);
acumulado = acumulado + minimo;

%ponemos el acumulado en el valor del segundo minimo
nuevop(indB) = acumulado;

if isnan(acumulado)
    indA = -1;
    indB = -1;
    acumulado = NaN;
    nuevop = p;
end

end