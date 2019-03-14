function freq = calculoFrecuencias(nombre_fichero)
freq = zeros(1,256);

file = fopen(nombre_fichero,'r');

while ~feof(file)
    byte = fread(file, 1);
    freq(byte+1) = freq(byte+1) +1;
end

figure;
plot(freq);

%normalize the vector

end

