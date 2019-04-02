% Pruebas de las funciones expande y compacta.

%% Ejecucion de compacta
p = [15, 7, 6, 6, 5];

for i=1:length(p)-1
    [indA(i), indB(i), acumulado, p] = compacta(p);
end

%% Ejecucion de expande
codigo = {'','','','',''};

for i=length(p)-1:-1:1
    codigo = expande(codigo, indA(i), indB(i));
end

celldisp(codigo)