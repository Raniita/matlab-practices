function [nuevo_codigo] = expande(codigo, indA, indB)
% nuevo_codigo ->
% esta funcion expande el arbol tomando como referencia los indicesA y B

nuevo_codigo = codigo;

if(indA ~= -1 && indB ~=-1)
    %copiamos lo que haya en el indiceA a indiceB
    nuevo_codigo{indA} = nuevo_codigo{indB};
    
    if(indA < indB)
        % Ajuste para que salga el mismo codigo que en papel
        nuevo_codigo{indB} = [nuevo_codigo{indB},'0'];
        nuevo_codigo{indA} = [nuevo_codigo{indA},'1'];
    else
        nuevo_codigo{indB} = [nuevo_codigo{indB}, '1'];
        nuevo_codigo{indA} = [nuevo_codigo{indA}, '0'];
    end
end

end
