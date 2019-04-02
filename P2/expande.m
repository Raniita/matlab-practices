function [nuevo_codigo] = expande(codigo, indA, indB)
% nuevo_codigo ->
% esta funcion expande el arbol tomando como referencia los indicesA y B

nuevo_codigo = codigo;

%copiamos lo que haya en el indiceA a indiceB
nuevo_codigo{indA} = nuevo_codigo{indB};

%ponemos los 0s y 1s
%nuevo_codigo{indA} = strcat(nuevo_codigo{indA},'1');
%nuevo_codigo{indB} = strcat(nuevo_codigo{indB},'0');

% Ajuste para que salga el mismo codigo que en papel
if(indA < indB)
    nuevo_codigo{indB} = strcat(nuevo_codigo{indB},'0');
    nuevo_codigo{indA} = strcat(nuevo_codigo{indA},'1');
else
    nuevo_codigo{indB} = strcat(nuevo_codigo{indB}, '1');
    nuevo_codigo{indA} = strcat(nuevo_codigo{indA}, '0');
end

end
