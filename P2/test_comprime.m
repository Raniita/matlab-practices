% Comprime Quijote
freq = calculoFrecuencias('quijote.txt');
codigo = huffman(freq);

% comprimimos quijote.txt con su codigo
comprime

% comprimo