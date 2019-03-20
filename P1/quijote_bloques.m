entro = zeros(1,5);
for i=1:4
    freq = calculoFrecuenciasBloque('quijote.txt',i);
    entro(i) = entropia(freq);
end

entro