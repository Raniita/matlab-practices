%% Apartado 3.3. Experimento 2.
% Cogemos el hola mundo, cogemos cada bit, le hacemos repelem con R y esto
% es lo que mandamos al canalBS. En RX la salida del canalBS cambia un bit,
% y nos sale 110 a la salida del canal, este codigo no sirve, si detectamos
% un error le pedimos al emisor que haga RTX de ese simbolo, si cambian los
% 3 bits no detecta error, lo vamos metiendo en una cadena y lo comparamos
% con el ascii('hola mundo'). 

% lo mejor es modificar el script2 y no fijarse mucho en lo que hay en el
% guion

% cuanto más aumenta el bloque, más retransmisiones tenemos

% Resultados del profesor para validar
% p=0.75,R=5 -> r = 0.7, t = 4.27, tasa = 32.78
% p=0.75,R=7 -> r = 0.94, t = 7.34, tasa = 18.30 

% El resultado esta bien, pero tarda bastante. Have to fix.
% Tiene que ejecutarse rapido con todas las R a la vez

% Mis resultados
% --> p=0.75, R = 7.00, r = 0.97, tasa = 18.59 t = 7.46 

N = 1000;
p = 0.75;
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
                    if unos == R
                        % mensaje correcto
                        rx_recibido = strcat(rx_recibido, '1');
                    else
                        % error
                        rtx_on = true;
                    end
                else
                    % zeros mayoritario
                    if zeros == R
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
                    
                    if unos == R
                        rx_recibido = strcat(rx_recibido, '1');
                        rtx_on = false;
                    elseif zeros == R
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