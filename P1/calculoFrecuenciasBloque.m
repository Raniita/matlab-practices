function freq = calculoFrecuenciasBloque(nombre_fichero, bloque)
freq = zeros(1,2^(bloque*8));

file = fopen(nombre_fichero, 'r');
reads = 0;

while ~feof(file)
    read_bloque = fread(file, bloque);
    
    if ~isempty(read_bloque)
        reads = reads + 1;
        
        for i=1:bloque
            if i==1
                simb = dec2bin(read_bloque(i),8);
                index = simb;
            else
                if numel(read_bloque) == 1
                    simb = dec2bin(255,8);
                    index = strcat(index, simb);
                else
                    simb = dec2bin(read_bloque(i),8);
                    index = strcat(index, simb);
                end
            end
        end
        
        index = bin2dec(index) + 1; 
        freq(index) = freq(index) + 1;
    end
end

figure;
plot(freq);

freq = freq./reads;
end