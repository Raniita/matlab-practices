% Script para hacer más agil el calculo de la tabla del apartado 3.4
archivos = {'quijote.txt', 'hamlet.txt', 'test.txt', 'foto.jpg','foto.bmp', 'platero.txt'};
size = zeros(1,6);
size_matrix = zeros(6,6); 
percent_matrix = zeros(6,6);

%Rellemamos el vector de size
fprintf('--> Rellenamos el vector de pesos \n')
for a=1:length(archivos)
    F = fopen(archivos{a},'r');
    s = dir(archivos{a});
    size_code = s.bytes;
    size(a) = size_code;
    fclose(F);
end

fprintf('--> Comienza la compresion \n')
for i=1:length(archivos)
    %Creamos carpeta para guardar los archivos comprimidos
    folder_name = strcat(archivos{i},'_dir');
    mkdir(folder_name);
    
    %Para cada archivo, codificamos el resto de fuentes con su codigo
    fprintf('--> Calculamos el codigo de %s \n', archivos{i});
    freq = calculoFrecuencias(archivos{i});
    codigo = huffman(freq);
    
    %Vamos comprimiendo archivo por archivo
    for j=1:length(archivos)
        %Comprimimos. VA A TARDAR
        fprintf('--> Comprimimos %s con codificacion %s \n', archivos{j}, archivos{i});
        longitud  = comprime(archivos{j}, codigo);
        
        fname = strcat(archivos{j},'.comp');
        F = fopen(fname,'r');
        s = dir(fname);
        size_source = s.bytes;
        size_matrix(i,j) = size_source;
        percent_matrix(i,j) = (size_source/size(j))*100;
        fclose(F);
        
        fprintf('--> Movemos el archivo comprimido a %s \n', folder_name);
        movefile(fname, folder_name);
    end
    
end

percent_matrix
size_matrix