function H = entropy(freq)
% Calcula la entropia de una variable aleatoria X cuya función
% de masa esta dada por el vector freq

%Comprobado y esta correcto
    H = -sum(freq.*log2(freq));
end 