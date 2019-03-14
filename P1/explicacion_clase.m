%Funcion por definir
freq = calcularfrecuencias(nombre);


A = fopen('./ejemlos/foto.jpg','r');
%read all chars. Siempre suele haber una func que sea fin de fichero, stara
%a 1 si esta el final del fichero o false si no. 

feof 

%Inizializar el vector correctamente
freq = zeros(1, 256);

while(~feof(A))
    %leer byte a byte
    C = fread(A, 1); % si suponemos que es la e -> tabla ascii 120 por ej
    freq(C+1) = freq(C+1) + 1; %Aumentamos 1 el array de dicho contador
end 
    
%ej
freq = [2, 5, 1, 3];
%si normalizamos es tal que
freq = [2/10, 5/10, 1/10, 3/10];
%en matlab se puede hacer con matricial

%en matlab la primera posicion de un vector es 1. ergo no podemos acceder a
%la posicion 0, tendremos que sumar 1. 

%primero saber la entropia caracterizada por caracter.

%el 4.3 de la entropia del quijote significa. De cada pedazo de informacion
%de 8 bits solo es informacion real 4.3, el resto es informacion que estoy
%desgastando, informacion que no necesito para representar la informacion. 

%ultimo apartado de la practica. Queremos cambiar la definicion del
%simbolo. Nosotros podemos coger como simbolo la lectura de 2 bytes, o
%contar palabras. 
%Para el caso que el bloque sea 2, el primer simbolo es En el otro simbolo
%es espacioU el siguiente Nespacio y asi sucesivamente. Para cada una de
%las posibilidades haremos nuestros vector de frecuencias, incrementamos en
%1 la aparicion de ese simbolo. seguro que cambiamos fread y ponemos un 2.
%Cambiar el numero de posibles simbolos. 2B/sim tendremos 2^16
%a la hora de indexar la funcion, el C no es numero entero, tendremos que
%modificarlo para que sea un indice del vector de frecuencias. 
%La entropia antes estaba entre 0 y 8, ahora tendremos entre 0 y 16
%El tam optimo de un compresor es la entropia dividio entre 8, 16, 24 lo
%que sea
