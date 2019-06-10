%% Apartado 3.3. Experimento 3.
% Partiendo del script3.m lo que hacemos es añadir otra regla para corregir
% solo si el voto de los bits es mayoritario, duplicando al minoritario. 

% la regla para decodificar cada bloques es, cuantos 0s hay en cada blque,
% si ese numero es mayor que el doble de numero de 1s quiere decir que es
% un 0. Al reves para detectar y corregir un 1

N = 1000;
p = 0.9;
f = ascii('hola mundo');

for R=3:2:11
        exito = 0;
        rtx = 0;
        transmisiones = 0;
        
        for i=1:N
            rx_recibido = '';
            j = 1;
            rtx_on = false;
            
            %while j <= length(ascii('hola mundo'))
            for j=1:length(f)    
                transmisiones = transmisiones + 1;
                
                tx = repelem(f(j), R);
                rx = canalBS(tx, p);
                
                unos = sum(rx=='1');
                zeros = R - unos;
                
                if unos > zeros
                    % unos mayoritario
                    if unos > 2*zeros
                        % mensaje correcto
                        rx_recibido = strcat(rx_recibido, '1');
                    else
                        % error
                        rtx_on = true;
                    end
                else
                    % zeros mayoritario
                    if zeros > 2*unos
                        % mensaje correcto
                        rx_recibido = strcat(rx_recibido, '0');
                    else
                        % error
                        rtx_on = true;
                    end
                end
                
                while rtx_on == true
                    tx_rtx = repelem(f(j), R);
                    rx_rtx = canalBS(tx_rtx, p);
                    rx = rx_rtx;
                    rtx = rtx + 1;
                    
                    unos = sum(rx=='1');
                    zeros = R - unos;
                    
                    if unos > 2*zeros
                        rx_recibido = strcat(rx_recibido, '1');
                        rtx_on = false;
                    elseif zeros > 2*unos
                        rx_recibido = strcat(rx_recibido, '0');
                        rtx_on = false;
                    end
                end
            end
 
            if strcmp(rx_recibido,f)
                exito = exito + 1;
            end
        end
        
        r = exito / N;
        t = (transmisiones+rtx) / (length(f)*N); % Siempre mayor que 1
        tasa = r * 1000/(R*t);       
        
        fprintf('--> R = %.2f, r = %.2f, tasa = %.2f t = %.2f \n', R, r, tasa, t);
end