function code = huffman(freq)
% code -> de tipo cell
% freq -> las frecuencias de los simbolos

indA = zeros(1,length(freq)-1);
indB = zeros(1,length(freq)-1);
code = cell(1,length(freq));
code(:) = {''};

% Compactamos el arbol
for i=1:length(freq)-1
   [indA(i),indB(i), acumulado, freq] = compacta(freq); 
end

% Expandimos el arbol
for i=length(freq)-1:-1:1
    code = expande(code, indA(i), indB(i));
end

end