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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Predicados auxiliares
esAuto(Auto):-feature(Auto,_).

%Punto 1a. esAutoPeligroso\1
esAutoPeligroso(Auto) :- equipo(Auto,Pasajeros),member(patan,Pasajeros).
esAutoPeligroso(Auto) :- findall(Arma,feature(Auto,arma(Arma)),Armas),length(Armas,L),L>=2.

%Punto 1b. vaConPropulsion\1
vaConPropulsion(Auto) :- feature(Auto,capacidad(velocidad)).

%Punto 1c. esSeguroEstarCerca\1
esSeguroEstarCerca(Auto):- esAuto(Auto),not(feature(Auto,arma(_))).

%Punto 2. puedeSortearObstaculo\2
puedeSortearObstaculo(Auto,Obstaculo):- 
    esAuto(Auto),
    obstaculo(_,Obstaculo),
    capacidadRequerida(Obstaculo,CapacidadRequerida),
    feature(Auto,capacidad(CapacidadRequerida)).

puedeSortearObstaculo(Auto,Obstaculo):- 
    esAuto(Auto), obstaculo(_,Obstaculo),
    capacidadRequerida(Obstaculo,CapacidadRequerida),
    feature(Auto,transformacion(_,Capacidades)),
    member(CapacidadRequerida,Capacidades).


%Punto 3. autoConclusiva\1

primero([Cabeza | _],Cabeza).

ultimo([Ultimo],Ultimo).
ultimo([_|Cola],Ultimo):-ultimo(Cola,Ultimo).

autoConclusiva(Carrera) :- carrera(Carrera,Tramos),primero(Tramos,Primero),ultimo(Tramos,Ultimo), Primero = Ultimo.

%Punto 4. puedeTransitar\2

esObstaculo(Obstaculo,Carrera) :-
    carrera(Carrera,Tramos),
    obstaculo(Tramo,Obstaculo),
    member(tramo(Tramo),Tramos).

puedeTransitar(Auto,Carrera) :- 
    esAuto(Auto),
    carrera(Carrera,_),
    forall(esObstaculo(Obstaculo,Carrera),
    puedeSortearObstaculo(Auto,Obstaculo)).

%Punto 5. esImpochible\1 

esImpochible(Carrera):- 
    carrera(Carrera,_), 
    not(puedeTransitar(_,Carrera)).

%Punto 6a. nivelDeAptitudDelCompetidor\2

nivelDeAptitudDelCompetidor(Competidor, LvlAptitud) :- 
    personalidad(Competidor,_),
    findall(Nivel,(personalidad(Competidor,Personalidad),
    nivelAptitud(Personalidad,Nivel)),Niveles),
    sumlist(Niveles,Suma),
    LvlAptitud=Suma.

%Punto 6b. nivelDeAptitudDelVehiculo\2

nivelDeAptitudDelVehiculo(Auto,LvlAptitud) :- 
    esAuto(Auto),
    findall(Arma,(feature(Auto,Arma),Arma=arma(_)),Armas),
    findall(Transformacion,(feature(Auto,Transformacion),Transformacion=transformacion(_,_)),Transformaciones),
    findall(Capacidad,(feature(Auto,Capacidad),Capacidad=capacidad(_)),Capacidades),
    length(Armas,L1),
    length(Transformaciones,L2),
    length(Capacidades,L3), 
    LvlAptitud is 5 * L1 + 10 * L2 + 15 * L3.

%Punto 6c. nivelDeAptitudParacompetir\2

vaEnAuto(Auto,Competidor) :- equipo(Auto,Competidores),member(Competidor,Competidores).

nivelDeAptitudParaCompetir(Auto,LvlAptitud):-
    esAuto(Auto), 
    nivelDeAptitudDelVehiculo(Auto,LvlAuto),
    findall(LvlCompetidor,(vaEnAuto(Auto,Competidor),nivelDeAptitudDelCompetidor(Competidor,LvlCompetidor)),Niveles),
    sumlist(Niveles,SumaNiveles),
    LvlAptitud is LvlAuto + SumaNiveles.

%Punto 7. vehiculoGanador\1

mayorNivelDeCompetencia(Auto,NivelMax):-
    findall(Nivel,nivelDeAptitudParaCompetir(Auto,Nivel),Niveles),
    max_member(NivelMax, Niveles).
    

vehiculoGanador(Auto):- 
    esAuto(Auto),
    Auto\=elRocomovil,
    mayorNivelDeCompetencia(_,Nivel),
    nivelDeAptitudParaCompetir(Auto,Nivel).
