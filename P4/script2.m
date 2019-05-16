% en vez de la funcion que pone en la memoria, usamos repelem('10',5)
N = 1000;
f = ascii('hola mundo');

% Con R=7 tiene que dar r = 0.81 t=116.43 bits/s
for R=3:2:11 
        exito = 0;
        for i=1:N
            tx = repelem(f, R);
            rx = canalBS(tx, 0.9); 
            rxcorregido = '';
            
            for j=1:length(ascii('hola mundo'))
                alpha = rx((j-1)*R+1:j*R);
                unos = sum(alpha=='1');
                zeros = R - unos;
                
                if unos > zeros
                    rxcorregido = strcat(rxcorregido, repelem('1',R));
                else
                    rxcorregido = strcat(rxcorregido, repelem('0',R));
                end
            end
            
            if strcmp(rxcorregido,tx)
                exito = exito + 1;
            end
        end
        
        r = exito / N;
        tasa = r * 1000/R;       
        
        fprintf('--> R = %.2f, r = %.2f, y tasa = %.2f \n', R, r, tasa);
end

