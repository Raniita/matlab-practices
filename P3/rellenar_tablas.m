%% Probabilidad canal
p = 0.8;
p1 = 0.8;
p2 = 0.1;

%% Cada tipo de canal a evaluar
% Q_BSC
Q1 = [p 1-p; 1-p p];
% Q_QBSC
Q2 = [p (1-p)/3 (1-p)/3 (1-p)/3 ; (1-p)/3 p (1-p)/3 (1-p)/3; (1-p)/3 (1-p)/3 p (1-p)/3; (1-p)/3 (1-p)/3 (1-p)/3 p];
% Q_QBSC_errorbit
Q3 = [p (1-p)/4 (1-p)/4 2*(1-p)/4 ; (1-p)/4 p 2*(1-p)/4 (1-p)/4; (1-p)/4 2*(1-p)/4 p (1-p)/4; 2*(1-p)/4 (1-p)/4 (1-p)/4 p];
% Caso asimetrico
Q4 = [p1 1-p1; 1-p2 p2];

%% Capacidades
fprintf('--> Calculando capacidad Q1 a \n');
[C1, pX1] = capacidad(Q1);
fprintf('--> Capacidad Q1 = %f \n', C1);
fprintf('--> pX Q1 = %f \n', pX1);

fprintf('--> Calculando capacidad Q2 a \n');
[C2, pX2] = capacidad(Q2);
fprintf('--> Capacidad Q2 = %f \n', C2);
fprintf('--> pX Q2 = %f \n', pX2);

fprintf('--> Calculando capacidad Q3 a \n');
[C3, pX3] = capacidad(Q3);
fprintf('--> Capacidad Q3 = %f \n', C3);
fprintf('--> pX Q3 = %f \n', pX3);

% Caso asimetrico
fprintf('--> Calculando capacidad caso asimetrico a \n');
[C_asin, pX_asin] = capacidad(Q4);
fprintf('--> Capacidad Q asimetrico = %f \n', C_asin);
fprintf('--> pX Q asimetrico = %f \n', pX_asin);