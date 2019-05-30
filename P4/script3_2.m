%% Apartado 3.3. Experimento 2.
% Cogemos el hola mundo, cogemos cada bit, le hacemos repelem con R y esto
% es lo que mandamos al canalBS. En RX la salida del canalBS cambia un bit,
% y nos sale 110 a la salida del canal, este codigo no sirve, si detectamos
% un error le pedimos al emisor que haga RTX de ese simbolo, si cambian los
% 3 bits no detecta error, lo vamos metiendo en una cadena y lo comparamos
% con el ascii('hola mundo'). 

% lo mejor es modificar el script2 y no fijarse mucho en lo que hay en el
% guion

% Resultados del profesor para validar
% p=0.75,R=5 -> r = 0.7, t = 4.27, tasa = 32.78
% p=0.75,R=7 -> r = 0.94, t = 7.34, tasa = 18.30 

N = 1000;
p = 0.9;
f = ascii('hola mundo');

% Con R=7 tiene que dar r = 0.81 t=116.43 bits/s
for R=5
        exito = 0;
        transmisiones = 0;
        mensajes = 0;
        
        for i=1:N
            tx = repelem(f, R);
            
            mensajes = mensajes + 1;
            
            while true
                transmisiones = transmisiones + 1;
                rx = canalBS(tx, p); 
                
                % detectamos error
                for j=1:length(ascii('hola mundo'))
                    alpha = rx((j-1)*R+1:j*R);
                    unos = sum(alpha=='1');
                    zeros = R - unos;
                
                    if unos > zeros
                        if unos == R
                            continue;
                        else
                            errordetectado = true;
                        end
                    else
                        if zeros == R
                            continue;
                        else
                            errordetectado = true;
                        end
                    end
                end
                
                if ~errordetectado
                    break;
                end
            end
            
            if strcmp(rx,tx)
                exito = exito + 1;
            end
        end
        
        r = exito / N;
        t = transmisiones / (length(f)*N); % Siempre mayor que 1
        tasa = r * 1000/(R*t);       
        
        fprintf('--> R = %.2f, r = %.2f, tasa = %.2f rtx = %.2f \n', R, r, tasa, rtx);
end