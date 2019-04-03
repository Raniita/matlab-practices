function [nuevotexto, longitud] = codifica(texto, codigo)
% Transforma el texto  la codificacion indicada. Devuelve nuevotexto con la
% codificación, longitud con el numero de digitos binarios de la misma

nuevotexto = '';

for i=1:length(texto)
% Vamos ampliando la cadena nuevo texto con los bytes del proximo simbolo
% Tengase en cuenta que el codigo numera los simbolos a partir de 1, pero
% el texto el primer indice es 0
    nuevotexto = strcat(nuevotexto, codigo{double(texto(i))+1});
end

% Calculamos la longitud del nuevotexto
longitud = length(nuevotexto);

end

