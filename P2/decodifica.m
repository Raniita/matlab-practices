function [longitud, texto, nuevoflujo] = decodifica(flujo, codigo)
% Decodifica el flujo con el codigo dado (tipo prefijo)
% Devuelve numero de simbolos decodificados, texto con los simbolos, y
% la parte sobrante del flujo si no contiene simbolos

texto = '';
longitud = 0;

% Otras acciones de inicilizacion
%while condición
%Debe crearse una ventana deslizante donde en cada fase
%1. Entre un nuevo digito a partir del flujo
%2. Se compruebe si el contenido de la ventana coincide con algun código
%3. En caso afirmativo se resetea la ventana, se añade el símbolo
%correspondiente al texto, y se borran del flujo los digitos usados

%Tengase en cuenta que el codigo numera los símbolos a partir de 1, pero
%en texto el primer índice es 0
%end

ventana = '';

for index=1:length(flujo)
    match = false;
    % añadimos un bit a la ventana
    ventana = strcat(ventana, flujo(index));
    
    for i=1:256
        if(strcmp(ventana, codigo{i}))
            match = true;
            match_index = i-1;
        end
    end
    
    if match
        % reiniciamos la ventana.
        ventana = '';
        
        % añadimos el simbolo al texto de salida
        texto = strcat(texto, {char(match_index)});
    end
end

nuevoflujo = ventana;
longitud = length(texto{1});

end

