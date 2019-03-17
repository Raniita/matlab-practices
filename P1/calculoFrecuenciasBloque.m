function freq = calculoFrecuenciasBloque(nombre_fichero, bloque)
freq = zeros(1,2^(bloque*8));

file = fopen(nombre_fichero, 'r');
reads = 0;

while ~feof(file)
    reads = reads + 1;
    read_bloque = fread(file, bloque);
    
    for i=1:2:bloque
        if i==1
            index = num2str(read_bloque(1));
        else
            index = strcat(index, num2str(read_bloque(i))); 
        end
    end
    index = str2num(index);
    
    freq(index) = freq(index) + 1;
    
    %para el bloque 2
    %index = num2str(strcat(num2str(a(1)), num2str(a(2))));
end

figure;
plot(freq);

freq = freq./reads;
end