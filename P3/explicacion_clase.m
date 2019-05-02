%% Entropia
% Hay que modificar la funcion de entropia de modo que podamos obtener la
% entropia conjunta.

% La entropia conjunta esta en el pdf. 

%% Ejemplo de dos dados de 6 caras
% Podemos añadir asi todos los resultados al boletin de entrega en modo
% resumen
% HXY = 5,47
% HX = 2,58
% HY = 2.58
% HXcondY = 2.58
% HYcondX = 2.58
% HX + HY = 5.17
% I = 0

%%
% Tenemos que recordar que para calcular las marginales, puede que en otras
% paginas o libros no esté igual. La marginal que obtenemos es aquella de
% la suma de las columnas/filas que no cambie.

%% Información mutua
% En la formula de la practica falta multiplicar por P(x=i, y=i), antes del
% logaritmo. 

% I(X,Y) = I(Y,X)

% Habría que comprobar con la formula del profesor. 

% Si dos sucesos son aleatorios. La información mutua tiene que salir 0,
% igual que la condicionada de una con la otra.

% Si nos da un valor muy proximo a 0, es normal, es un error de redondeo de
% matlab.

%% Canal BSC
% 0  0 ;  p  1-p
% 1  1 ;  p  1-p

%% Capacidad del canal

