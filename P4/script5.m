%% Apartado 3.5
% Solo usar los bloques
B = [2, 4, 8, 16];

% cuando subamos de b2 debe dar un porcentaje de exito bajo, r puede salir
% incluso 0.



% Para el calculo de las tasas, mejor usar
r = exito / N;
% porque transmitimos de B en B bits, antes tx todos los bits de ascii('Hola mundo').
t = transmisiones/(length(f)*N/B);
tasa = r*1000/((B+1)/B * t);