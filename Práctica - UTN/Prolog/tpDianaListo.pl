% Una carrera tiene un nombre y muchos tramos, donde cada tramo tiene la peculiaridad de poseer una característica especial:
% carrera(nombre de la carrera, lista de tramos que la componen) %
carrera(villaCalibre, [tramo(ciudad),tramo(carretera),tramo(laguna)]).
carrera(adelaida, [tramo(montania),tramo(bosque),tramo(trampolin),tramo(montania)]).

% Las características especiales de los tramos tienen obstáculos que son propios de él, por ejemplo:
% obstaculo(caracteristica del terreno, obstáculos que se presentan).
obstaculo(montania, barro).
obstaculo(montania, ripio).
obstaculo(laguna, agua).
obstaculo(laguna, animalSalvaje).
obstaculo(bosque, pasto).
obstaculo(trampolin, aire).

%(carreteras y ciudades no tienen obstáculos).

% Un obstáculo puede requerir de capacidades especiales para ser sorteado
%capacidadRequerida(obstaculo,capacidad para superarlo)
capacidadRequerida(barro, todoTerreno).
capacidadRequerida(ripio, estabilidad).
capacidadRequerida(agua, waterResistant).
capacidadRequerida(animalSalvaje, _). %cualquier capacidad puede con un animal salvaje
capacidadRequerida(pasto, todoTerreno).
capacidadRequerida(aire, volar).


/*Cada auto tiene características especiales, por ejemplo algunos autos pueden volar, otros transformarse en muchas cosas, 
otros defenderse con distintos dispositivos, otros ir más rápido. Las características especiales se representan como functores y pueden ser:
- transformacion(resultado de la transformación, habilidades)
- capacidad(capacidad) */

feature(superFerrari, arma(ametralladora)).
feature(superFerrari, arma(canion)).
feature(superFerrari, transformacion(barco, [waterResistant])).
feature(superFerrari, capacidad(velocidad)).
feature(elRocomovil, capacidad(velocidad)).
feature(elRocomovil, capacidad(estabilidad)).
feature(elStukaRakuda, capacidad(volar)).
feature(elStukaRakuda, capacidad(velocidad)).
feature(elStukaRakuda, arma(ametralladora)).
feature(superConvertible, transformacion(barco, [waterResistant])).
feature(superConvertible, transformacion(bicicleta, [estabilidad])).
feature(superConvertible, transformacion(dirigible, [volar, supervelocidad])).
feature(superConvertible, transformacion(tanque, [estabilidad])).
feature(compactPussycat, capacidad(velocidad)).
feature(compactPussycat, arma(cosmeticos)).

% Cada auto tiene competidores que viajan en el:
% equipo(Auto,Miembros) siendo el primero de los miembros el conductor
equipo(superFerrari, [pierNodoyuna, patan]).
equipo(elRocomovil, [piedroMacana, rocoMacana]).
equipo(elStukaRakuda, [baronHansFritz]).
equipo(superConvertible, [profesorLocobitch]).
equipo(compactPussycat, [penelopeGlamour]).
equipo(alambiqueVeloz, [lucasElGranjero, elOsoMiedoso]).

%A su vez, los competidores tienen un nivel de aptitud, dependiendo de su personalidad:
%personalidad(Alguien, Personalidad).
personalidad(pierNodoyuna, malhechor).
personalidad(patan, malhechor).
personalidad(penelopeGlamour, damiselaEnApuros).
personalidad(penelopeGlamour, servicial).
personalidad(piedroMacana, propensoAccidentes).
personalidad(baronHansFritz, malhechor).

%nivelAptitud(personalidad, nivel).
nivelAptitud(malhechor, 35).
nivelAptitud(servicial, 20).
nivelAptitud(propensoAccidentes, 10).
nivelAptitud(damiselaEnApuros, 10).
nivelAptitud(nadaParaDestacar, 5).

% ----------- Hecho Auxiliares ----------------
esAuto(Auto):-
    feature(Auto, _).

esUnaCarrera(Carrera):-
    carrera(Carrera,_).

tramosDeUnaCarrera(Carrera, Tramo):-
    carrera(Carrera, Tramos),
    member(Tramo, Tramos).

pasaTramo(Auto, tramo(Obstaculo)):-
    puedeSortearObstaculo(Auto,Obstaculo).


% ---------------- Punto 4 -----------------
puedeTransitar(Carrera, Auto):-
    esUnaCarrera(Carrera),
    esAuto(Auto),
    forall(
        tramosDeUnaCarrera(Carrera, Tramo),
        pasaTramo(Auto, Tramo)
    ).
    

% ---------------- Punto 5 -----------------

esImpochible(Carrera):-
    esUnaCarrera(Carrera),
    forall(
        esAuto(Auto),
        not(puedeTransitar(Carrera, Auto))).

%---------------- Punto 6 -------------------
%nivelDeAptitudDelCompetidor\2: esta dado por las personalidades del competidor. Como un competidor puede tener más de una personalidad, su nivel de aptitud es la suma del nivel de aptitud de todas sus personalidades.

nivelDeAptitudDelCompetidor(Competidor, LvlAptitud) :- findall(Nivel,(personalidad(Competidor,Personalidad),nivelAptitud(Personalidad,Nivel)),Niveles),sumlist(Niveles,Suma),LvlAptitud=Suma.

%nivelDeAptitudDelVehiculo\2: es la suma de los puntos que le dan cada feature, siendo:
% ● 5 por cada arma | ● 10 por cada transformación | ● 15 por cualquier otro feature

nivelDeAptitudDelVehiculo(Vehiculo,LvlAptitud) :- findall(Arma,(feature(Vehiculo,Arma),Arma=arma(_)),Armas),
findall(Transformacion,(feature(Vehiculo,Transformacion),Transformacion=transformacion(_,_)),Transformaciones),
findall(Capacidad,(feature(Vehiculo,Capacidad),Capacidad=capacidad(_)),Capacidades),
length(Armas,L1),length(Transformaciones,L2),length(Capacidades,L3),
LvlAptitud is 5 * L1 + 10 * L2 + 15 * L3.
