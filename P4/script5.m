%% Apartado 3.5. Paridad
% Bloques email profesor
Bloques = [2, 4, 8, 16];
B = 0;
% cuando subamos de b2 debe dar un porcentaje de exito bajo, r puede salir
% incluso 0.

N = 1000;
p = 0.9;
f = ascii('hola mundo');

% Resultados, p=0.75
%--> B = 2.00, r = 0.73, tasa = 485.33 t = 1.00 
%--> B = 4.00, r = 0.59, tasa = 470.40 t = 1.00 
%--> B = 8.00, r = 0.37, tasa = 332.44 t = 1.00 
%--> B = 16.00, r = 0.17, tasa = 160.94 t = 1.00 

for b=1:length(Bloques)
    B = Bloques(b);
    
    exito = 0;
    rtx = 0;
    transmisiones = 0;
    
    for i=1:N
        rx_recibido = '';
        j = 1;
        rtx_on = false;
        
        for j=1:B:length(f)
            transmisiones = transmisiones + 1;
            flujo = f(j:j+(B-1));
            [paridad_tx,tx] = paridad(flujo);
            rx = canalBS(tx,p);
            
            % Nos quedamos solo con el valor de la paridad
            paridad_rx = paridad(rx);
            if paridad_rx == '0'
                % paridad par, mensaje correcto
                % guardamos los recibido, quitamos el bit de paridad
                rx_recibido = strcat(rx_recibido, rx(1:length(rx)-1));
            else
                % paridad impar, mensaje incorrecto
                % si hay un error, hacemos rtx.
                rtx_on = true;
            end
            
            while rtx_on == true
                flujo_rtx = f(j:j+(B-1));
                [paridad_rtx,tx_rtx] = paridad(flujo_rtx);
                rx_rtx = canalBS(tx_rtx,p);
                
                rx = rx_rtx;
                rtx = rtx + 1;
                
                paridad_rx = paridad(rx);
                if paridad_rx == '0'
                    % paridad par, mensaje correcto
                    % guardamos los recibido, quitamos el bit de paridad
                    rx_recibido = strcat(rx_recibido, rx(1:length(rx)-1));
                    rtx_on = false;
                else
                    % paridad impar, mensaje incorrecto
                    % si hay un error, hacemos rtx.
                    rtx_on = true;
                end
            end
        end
        
        if strcmp(rx_recibido,f)
            exito = exito + 1;
        end
    end

    % Para el calculo de las tasas, mejor usar
    r = exito / N;
    % porque transmitimos de B en B bits, antes tx todos los bits de ascii('Hola mundo').
    t = (transmisiones+rtx)/(length(f)*N/B);
    tasa = r*1000/((B+1)/B * t);
    
    fprintf('--> B = %.2f, r = %.2f, tasa = %.2f t = %.2f \n', B, r, tasa, t);
end