%% Apartado 3.2
% como pretendemos enviar toda la cadena, la probabilidad de que se envie
% correctamente todo el mensaje es muy muy muy pequeña, por lo que nunca
% hay ningun exito. La probabilidad de que toda la cadena llegue bien es
% p^80 = 0.9^80

N = 1000;
f = ascii('hola mundo');
exito = 0;
for i=1:N
    % el valor aqui es f.
    tx = f; % RELLENAR, TX ES EL FLUJO A TRANSMITIR
    rx = canalBS(tx,0.9); % SE OBTIENE EL FLUJO EN RECEPCION
    if strcmp(rx,tx) % SE COMPRUEBA SI LA TX FUE CORRECTA
        exito = exito + 1;
    end
end

r = exito / N;
tasa = r * 1000; % CALCULAR LA TASA

fprintf('--> r = %.2f y tasa = %.2f \n', r, tasa);