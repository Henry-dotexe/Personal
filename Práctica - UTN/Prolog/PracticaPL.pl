%estaEn(Peli,Personaje)
estaEn(buscandoNemo,nemo).
estaEn(buscandoNemo,dory).
estaEn(quienEnganio,rogerRabbit).
estaEn(quienEnganio,doom).
estaEn(quienEnganio,eddie).
estaEn(naufrago,chuck).

%esAnimado(Personaje)
esAnimado(nemo).
esAnimado(dory).
esAnimado(rogerRabbit).
esAnimado(doom).

%aptaParaAmargos es verdadero para una peli si no tiene personajes animados

%aptaParaAmargos(Peli):-
% estaEn(Peli,_),
% findall(Pers,(estaEn(Peli,Pers),esAnimado(Pers)),Ps),
% length(Ps,C), C = 0.

%aptaParaAmargos(Peli):-
% estaEn(Peli,_),
% forall(estaEn(Peli,Pers),not(esAnimado(Pers))).

aptaParaAmargos(Peli):-
 estaEn(Peli,Pers),
 not(esAnimado(Pers)).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%stock(sucursal, producto, cantidad)
stock(boedo, sillon(comun, 3), 4).
stock(boedo, silla(madera), 12).
stock(flores, sillon(cama, 2), 1).
stock(flores, silla(metal), 4).
stock(belgrano, sillon(reclinable, 2), 3).
stock(belgrano, silla(madera), 8).

%1- Agregar info de stock y requerimientos de mati y leo 

stock(flores, mesa(circular, vidrio), 1).
stock(belgrano, sillon(reclinable, 1), 1).

loQueBusca(mati, mesa(circular, vidrio)).
loQueBusca(mati, silla(metal)).
loQueBusca(leo, sillon(cama, 2)).
loQueBusca(leo, sillon(reclinable, 1)).

%No hace falta usar listas, puede hacerse un hecho por cada cosa que busca cada uno
%Los conceptos que permiten hacerlo de esta forma, son los functores, individuos compuestos.

%2- Saber si una sucursal trabaja determinado material. Todos los sillones son de madera
trabajaCon(Sucursal,Material) :-
 stock(Sucursal,sillon(_,_),_),
 Material=madera.

trabajaCon(Sucursal,Material):-
 stock(Sucursal,mesa(_,Material),_).

trabajaCon(Sucursal,Material):-
 stock(Sucursal,silla(Material),_).

%En esta resolución destaca el concepto de inversibilidad en cada regla, functores y operadores logicos (and,or)

esIdeal(Sucursal,Cliente):-
    loQueBusca(Cliente,_),
    stock(Sucursal,_,_), 
    forall(loQueBusca(Cliente,Articulo),stock(Sucursal,Articulo,_)).

%En esta resolucion aparecen predicados de orden superior, ademas de inversibilidad completa
