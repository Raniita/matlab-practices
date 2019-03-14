function freq = calculoFrecuencias(nombre_fichero)
freq = zeros(1,256);

file = fopen(nombre_fichero,'r');
reads = 0;

while ~feof(file)
    byte = fread(file, 1);
    freq(byte+1) = freq(byte+1) +1;
    reads = reads + 1;
end

figure;
plot(freq);

freq = freq./reads;

end

