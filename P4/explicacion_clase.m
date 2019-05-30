%% Canal BSC
% Explicacion apartado 3.2
% De un canal BSC lo que hayamos es la capacidad con las funciones de la
% P3, si nos dicen que el canal puede transmitir 1kbps, la capacidad se
% mide en bits/simbolo, lo que obtenemos al multiplicar capacidad por
% velocidad, obtenemos 531 bits/s. Como nos dice en la practica, lo
% que nos dice es que la probabilidad es 0.9, y la tasa es 1kbps, lo que
% nos dice en verdad es que podemos transmitir 900 bit/s. Lo que dice la
% teoria es que con una codificacion muy buena, anque transmitamos 900bit/s
% solo 531 bits van a ser de informacion. 

% 3.2. El valor de la tasa lo tenemos que sustituir aplicando la formula de
% r * 1000, con una probabilidad de 0.9

%% script2
% r = (exitos)/N, para cada R=i se calculará todo. La tasa se calcula como
% r * 1000/R

%% Funcion paridad
% cuenta los numeros de 1 y 0s, si el numero de 1 es par añade un 0 para
% que sea par, y si el numero de 1 es impar añadimos un 1 para que sea par.
% el objetivo es tener siempre los unos como par. Se añade al final. 


%% Resumen scripts
% script_1
% TX
f = ascii('hola mundo')

% RX
strcmp(F, f') % Si 0 -> error
r = errores/N
tasa = 1000 * r

% script_2
% f -> tx repitiendo cada bit R veces
% R = 4 -> 0101, pues lo repito cada vez
% transmito todo repitiendo cada bit

% RX
% Decodifico cogiendo bloques de n bits y sustituyo por el bit que se
% repita mas
r = errores/N
tasa = 1000*r/R

% script_3
% Repite R veces cada bit de f y tx en bloques de R bits.

% RX
% Si no todos los R bits de cda bloque que tx son iguales -> retransmito
% Al final comparo
r = errores/N
t = transmisiones/length(F)*N
tasa = r * 1000 * 1/R*t

% script_4
% igual que script 3

% si #0's > 2*#1's -> 0
% si #1's > 2*#0's -> 1
% sino retransmito
% variables igual que script 3

% script_5 es paridad

