%% Apartado 3.6. Hamming(7,4) + mejoras
% Añadimos una serie de mejoras a la codificacion
% Paridad completa del mensaje, RTX
% Detecta 2 y corrige 1

B = 4;
N = 1000;
p = 0.9;
f = ascii('hola mundo');

exito = 0;
transmisiones = 0;
rtx = 0;
corregido = 0;

for i=1:N
    rx_recibido = '';
    j = 1;
    
    while j<=length(f)
        transmisiones = transmisiones + 1;
        
        % Info a transmitir
        flujo = f(j:j+(B-1));
        
        % Sacamos las paridades
        x0 = char(flujo(1));
        x1 = char(flujo(2));
        x2 = char(flujo(3));
        x3 = char(flujo(4));
        p0 = num2str(xor(xor(str2double(x0),str2double(x1)),str2double(x3)));
        p1 = num2str(xor(xor(str2double(x0),str2double(x2)),str2double(x3)));
        p2 = num2str(xor(xor(str2double(x1),str2double(x2)),str2double(x3)));
        
        % Formamos el mensaje
        mensaje = strcat(p0,p1,x0,p2,x1,x2,x3);
        [paridad_mensaje, tx] = paridad(mensaje);
        rx = canalBS(tx,p);
        
        paridad_rx = paridad(rx);
        
        % Decoding de RX
        p0_rx = rx(1);
        p1_rx = rx(2);
        x0_rx = rx(3);
        p2_rx = rx(4);
        x1_rx = rx(5);
        x2_rx = rx(6);
        x3_rx = rx(7);
        
        % Sindromes en RX
        c0 = num2str(xor(xor(xor(str2double(p0_rx),str2double(x0_rx)),str2double(x1_rx)),str2double(x3_rx)));
        c1 = num2str(xor(xor(xor(str2double(p1_rx),str2double(x0_rx)),str2double(x2_rx)),str2double(x3_rx)));
        c2 = num2str(xor(xor(xor(str2double(p2_rx),str2double(x1_rx)),str2double(x2_rx)),str2double(x3_rx)));
        
        % Posicion del error
        pos_error = bin2dec(strcat(c2,c1,c0));
        
        % Comprobamos el mensaje recibido.
        if strcmp(paridad_rx,'1')
            % Comprobamos si 1 error o dos errores.
            if pos_error ~= 0 
                % Hay 1 error. Corregimos el error
                switch pos_error
                    case 1
                        p0_rx = num2str(not(str2double(p0_rx)));
                    case 2
                        p1_rx = num2str(not(str2double(p1_rx)));
                    case 3
                        x0_rx = num2str(not(str2double(x0_rx)));
                    case 4
                        p2_rx = num2str(not(str2double(p2_rx)));
                    case 5
                        x1_rx = num2str(not(str2double(x1_rx)));
                    case 6
                        x2_rx = num2str(not(str2double(x2_rx)));
                    case 7
                        x3_rx = num2str(not(str2double(x3_rx)));
                end
                corregido = corregido + 1;
                
                % Bloque correcto!
                % Mensaje final corregido
                mensaje_rx = strcat(x0_rx,x1_rx,x2_rx,x3_rx);
                rx_recibido = strcat(rx_recibido, mensaje_rx);
                
                % Avanzamos el contador
                j = j + B;
            elseif pos_error == 0
                % Hay 2 errores. Retransmito
                rtx = rtx + 1;
            end
        elseif strcmp(paridad_rx,'0') 
            if pos_error ~= 0 
               % Hay 2 errores. Retransmito
               rtx = rtx + 1;
            elseif pos_error == 0
                % Bloque correcto!
                % Mensaje final corregido
                mensaje_rx = strcat(x0_rx,x1_rx,x2_rx,x3_rx);
                rx_recibido = strcat(rx_recibido, mensaje_rx);
                
                % Avanzamos el contador
                j = j + B;
            end
        end
    end
    
    if strcmp(rx_recibido,f)
        exito = exito + 1;
    end
end

% Formulas dadas por el profesor en la pizarra
r = exito / N;
t = transmisiones/((length(f)/B)*N);
tasa = 1000*r/((8/4)*t);

fprintf('--> B = %.2f, r = %.2f, tasa = %.2f t = %.2f \n', B, r, tasa, t);