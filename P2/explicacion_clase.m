%%codigo huffman
%se explica el algoritmo de clase de teoria, pero con un ejemplo en la
%pizzara para la practica. 

%Que un codigo no sea prefijo de otro significa que si recibimos un mensaje
%de una fuente, cuando recibimos un simbolo que ya encontramos completo en
%uno de nuestros simbolos, no tenemos que esperar a ver el bit siguiente,
%es decir, una vez hacemos match confirmamos que ese es nuestro simbolo. 

%% funcion compacta
%solo tiene un arg, el vector de frecuencias/pesos, se llama con los pesos
%originales de nuestro alfabeto. 
p = [15 7 6 6 5]
% localiza los 2 nodos de menor peso y genera un nuevo vector P donde en la
% posicion donde estuviera el minimo le asigna el peso de las 2 posiciones
% que ha identificado y en la posicion del segundo minimo escribe un NaN
%indiceA el minimo del vector, y indiceB es el minimo si no consideramos el
%anterior

%indiceA -> 5
%indiceB -> 6 (elegimos el D)

%forma un nuevo vector tal que [15 7 6 NaN 11]
%funcion isnan para evaluar si es un NaN. El vector p siempre tendrá las
%mismas posiciones que el original. 

% la funcion tambien devuelve los cvalores de indiceA e indiceB, se usaran
% en la fase de expansion. Debemos guardarlos en una tabla. 
indiceA = [5] %es un indice, aunque coincida con el valor en este caso
indiceB = [4]

% en la funcion de compacta, en cada paso hace lo que acabamos de hacer.
% Solo hace un paso, el bucle es externo a la funcion. 

% para el siguiente ciclo
% indiceA -> 7
% indiceB -> 6
indiceA = [5, 3]
indiceB = [4, 2]
p = [15 NaN 13 NaN 11]

% la volvemos a llamar
% indiceA -> 11 
% indiceB -> 13
indiceA = [5, 3, 5]
indiceB = [4, 2, 3]
p = [15 NaN NaN NaN 24]

% volvemos a llamar
% indiceA -> 15
% indiceB -> 24
indiceA = [5, 3, 5, 1]
indiceB = [4, 2, 3, 5]
p = [39 NaN NaN NaN NaN]

% si volvemos a llamar tendremos que devolver indices a -1 y devolver tal
% cual p.



%% funcion de expansion
% partimos de una codificacion vacia
C = {'','','','',''}
% la funcion de expasion para cada iteracion, recibe la codificacion
% anterior y los dichos indices para esa etapa
% la expasion funciona de arriba a abajo. 
% La tabla de indices es una LIFO (last in first out)

% el codigo que esta asignado en la posicion indice A lo copia a la
% posicion de indice A y le asigna un 0 o 1 a cada uno. 

% para este caso completo. 1 iteracion
% argumentos indiceA -> 1, indiceB -> 5
%copiamos lo que haya en indice A a indice B, se queda como esta
C = {'','','','',''}

% en la posicion indice A añadimos un prefijo 0 (o 1)
% en indice B añadimos el contrario
C = {'1', '', '', '', '0'}

%siguiente iteracion. 5 y 3
% copiamos el contenido
C = {'1','','0','','0'}
% añaidmos prefijo 1 a lo de indiceA y 0 a indiceB
C = {'1','','01','','00'}

%siguiente iteracion 3 y 2
% copiamos el contenido
C = {'1','01','01','','00'}
% añadimos prefijo 1 a los indicesA y 0 a indicesB
C = {'1','011','010','','00'}

%ultima iteracion 5 y 4
%copiamos
C = {'1','011','010','00','00'}
% añadimos en A 1 y en B 0
C = {'1','011','010','001','000'}

% llegamos al mismo resultado del ejercicio grafico
% cada vez que llamamos a la funcion hacemos una iteracion


%% comentarios
% hay una funcion que se llama min que devuelve dos arg. 
[valor, indice] = min(p)
% pero necesitamos el primer minimo y el segundo minimo. hay que pensar

% vectores de cosas que no son numeros
% cada una de las posiciones de dicho vector puede ser cualquier cosa. En
% la practica se usa con llaves, es decir que si cambiamos la posicion 3
% tenemos que hacerlo tal que
C{3} = '010'
% en el enunciado de la practica hay unos comandos utiles para crearlos en
% vacio y cosas asi
% los cells admiten los parenteisi pero no se refieren a lo mismo. 

%% funcion huffman
% podemos obtener la frecuencia ya sea poniendo las frecuencias
% directamente o bien usando las funciones de la practica anterior. 
% Como resultado de la funcion, lo que haremos es recibir code, es de tipo
% cell. 

% para la parte siguiente de la practica, lo que haremos es hacer las
% funciones de codifica y decodifica. 

%% funciones codifica y decodifica
flujo = codifica(texto, codigo)
% mandamos un texto y lo tenemos que convertir dependiento de ese codigo
% huffman, consideramors que el alfabeto tiene 256 simbolos y cada caracter
% tiene un byte de un particula codigo huffman. 

% si escribimos un Hola, asignamos un huffman para eso. 
% para la H tenemos el caracter 72 -> 0111

% creamos una var bin en la que iremos añadiendo los binarios de las letras
% que vayamos leyendo dependiendo del codigo huyffman.

% para la o por ejemplo 111 -> 110

% todo esto hasta que obtenga el ultimo char de la string.

% tenemos que tener en cuenta de que matlaba trabaja sobre indices 1, por
% lo que tendremos que ajustar los indices para 1-256. Cuando leemos la
% letra o, estamos leyendo 72, pero tenemos que leer en nuestro codigo el
% 73. 

% decodifica
[longitud,texto,nuevoflujo] = decodifica(flujo, codigo)

% tiene que extraer que simbolo corresponde con el codigo que nosotros
% tenemos. Lo que utiliza es el principal propiedad de huffman code, es
% basicamente que un codigo nunca es un prefijo de otro codigo, por lo que
% siempre que encontremos el final de un codigo no tenemos que seguir
% buscando otro codigo de nuestra lockup table. 

% empezamos por el primer bit, buscamos en la lockup table si hay match, si
% no lo hay añadimos otro bit en la busqueda, si no encontramos un match,
% volvemos a añadir otro bit. En el caso de que encontremos un simbolo,
% eliminamos esa ristra de bits y añadimos el simbolo al texto.

% para el ejemplo de hola, se han añadido 2 bits adicionales al stream. Si
% no encontramos algo en la lockup table, lo que hacemos con el resto es
% que lo devolvemos en la variable nuevoflujo. Se usara dos funciones, que
% nos dara el profesor, para comprimir y decomprimir archivos, ahora
% podemos usar estas funciones para comprimir un flujo de bits. La funcion
% de compres llama la funcion codifica, por lo que tiene que ser funcional.

% Experimento
code = calculoFrecuencias('quijote.txt')
stream = codifica('Hola mundo', code)
stream = [stream, '11']
[long, text, newstream] = decodifica(stream,code)
% text -> Hola Mundo
% newstream -> 11

% haremos experimentos para comprimir unos binarios con cada huffman de
% cada libro y veremos como es considerablemente inferior la compresion
% comparado con el caso de que utilizemos su propio codigo huffman

