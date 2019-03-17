function freq = calculoFrecuenciasBloque(nombre_fichero, bloque)
freq = zeros(1,2^(bloque*8));
%freq = zeros(1,256256);

file = fopen(nombre_fichero, 'r');
reads = 0;

while ~feof(file)
    read_bloque = fread(file, bloque);
    
    if ~isempty(read_bloque)
        reads = reads + 1;
        
        %para 2 simbolos
        %sim1 = dec2bin(hex2dec(num2str(read_bloque(1))));
        %sim2 = dec2bin(hex2dec(num2str(read_bloque(2))));
        %index = bin2dec(strcat(sim1,sim2));
        
        for i=1:bloque
            if i==1
                simb = dec2bin(hex2dec(num2str(read_bloque(i))));
                index = simb;
            else
                simb = dec2bin(hex2dec(num2str(read_bloque(i))));
                index = strcat(index, simb);
            end
        end
        
        freq(bin2dec(index)) = freq(bin2dec(index)) + 1;
        
        
        %for i=1:bloque
        %    if i==1
        %        index = num2str(read_bloque(1));
        %    else
        %        index = strcat(index, num2str(read_bloque(i))); 
        %    end
        %end
        %index = str2num(index);
    
        %freq(index) = freq(index) + 1;
    
    end
    %para el bloque 2
    %index = num2str(strcat(num2str(a(1)), num2str(a(2))));
end

figure;
plot(freq);

freq = freq./reads;
end