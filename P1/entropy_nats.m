function H = entropy_nats(freq)
% Calcula la entropia de una variable aleatoria X cuya función
% de masa esta dada por el vector freq

%Comprobado y esta correcto
    %H = -sum(freq.*log(freq));
    H = 0;
    
    for i=1:length(freq)
        if(freq(i) ~= 0)
            H = H + freq(i)*log(freq(i));
        end  
    end
    H = -H;
end