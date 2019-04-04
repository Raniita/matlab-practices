freq = calculoFrecuencias('foto.bmp');
codigo = huffman(freq);
codificado = codifica('Hola Mundo', codigo);
[L, texto, resto] = decodifica(codificado, codigo);
texto