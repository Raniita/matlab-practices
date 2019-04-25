function L = longitud_media(codigo)

    suma = 0;
    for i=1:length(codigo)
        suma = suma + length(codigo{i}); 
    end
    
    L=suma/length(codigo);
end

