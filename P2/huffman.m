function code = huffman(p)
% code -> de tipo cell
% p -> las frecuencias de los simbolos

indA = zeros(1,length(p)-1);
indB = zeros(1,length(p)-1);

% Creamos la cell. Es equivalente a la forma del profesor
code = cell(1,length(p));
code(:) = {''};

iter = 1;
acumulado = 0;

% Compactamos el arbol
while ~isnan(acumulado)
   [indA(iter),indB(iter), acumulado, p] = compacta(p); 
   iter = iter + 1;
end

% Expandimos el arbol
while iter > 1
    iter = iter - 1;
    code = expande(code, indA(iter), indB(iter));
end

end