function [valor, bloquep] = paridad(bloque)
% Calcula la paridad de un bloque y devuelve 1 si el numero de ‘1’s es
% impar o 0 si es par. Devuelve también el bloque con un bit añadido al
% final para que el numero de unos sea par

    unos = sum(bloque=='1');
    
    if mod(unos, 2) == 0
        % numero de 1's par
        valor = '0';
        bloquep = strcat(bloque, '0');
    else
        % numero de 1's impar
        valor = '1';
        bloquep = strcat(bloque, '1');
    end
end