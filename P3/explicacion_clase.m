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
% 0,0  0,1 ;   p  1-p
% 1,0  1,1 ;  1-p  p

%% Capacidad del canal
% C = max(I(x,y)) por lo que tenemos que maximizar X para obtener la
% capacidad del canal. 

% Tenemos que hacer la funcion capacidad
% Entra Q, y sale la capacidad(un numero) y los valores de las probabilidades de X
% la probabilidad de X en el caso BSC es p y 1-p. => [p(x=0), p(x=1)]

% Qbsc = (p(y=0|x=0 p(y=1|x=0)), p(y=0|x=1 p(y=1|x=1))) => (p 1-p, 1-p, p)
% Si multiplicamos por las P(x=i), la matriz Q se convierte en la matriz p 

% con combinacionesN, lo que hacemos es que le mandamos el numero de
% simbolos que transmitimos, en este caso 2, 1 columna x=0, y la segunda
% columna x=1. Hace todas las combinaciones. 

% Si vamos calculando la I mutua, sale una campana de gaus?? y para el
% valor de probabilidad, vamos a tener un valor maximo de informacion
% mutua, ese será nuestro valor de nuestra capacidad. 

% para hacer esta funcion. Le pasamos la matriz Q, calculamos las
% combinaciones, vamos probando cada pareja o conjunto de simbolos
% multiplicandolo por la matrix Q y obtenemos la matriz P, y con la matriz
% P calculamos la información mutua, con toda la información mutua,
% buscamos el maximo. Además, tenemos que devolver las probabilidades con
% las que hemos conseguido esa información mutua maxima. 

% Cogemos el vector fila de probabilidades, hacemos la transpuesta y
% multiplicamos por la matriz Q y obtendremos la matriz P. 

% cuando calculamos el max, lo que nos puede devolver es [valor, indice],
% con el indice podemos ir al vector de combinaciones y obtener las
% probabilidades conseguidas. 

% intentar hacer una tabla con los resultados.
%       | P=1 | P=0.9 | P=0.8 |
% C_BSC                 0.28
% C_QSC                 0.96
% C_QSC_bit

%       P1=0.8,P2=1 | P1=0.6,P2=0.9 |
% C_ASC 
% Pmax

% Calculamos la probabilidad maxima para cada uno de los valores
% Pmax | p=1 | p=0.9 | p=0.8
% C-BSC                (0.5, 0.5) (0,1)
% C_QSC                (1/4, 1/4, 1/4, 1/4) (00, 01, 10, 11)
% C_QSC_BIT

% pezm([0:0.01:1],L) BSC=2, QSC=4;