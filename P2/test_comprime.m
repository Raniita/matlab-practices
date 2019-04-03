init_text = 'ABCDE';

% Calculamos las propiedades
p = [15 7 6 6 5];

% obtenemos el codigo huffman
codigo = huffman(p);

% Guardamos el codigo dependiendo del alphabeto
alphabeto = cell(1,256);
alphabeto(:) = {''};
for i=1:length(init_text)
   alphabeto{double(init_text(i)) + 1} = codigo{i};
end

texto = 'AABBCCDDEE';

% Codificamos nuevo texto
[nuevotexto, L] = codifica(texto, alphabeto);
