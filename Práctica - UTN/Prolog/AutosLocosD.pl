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

%Punto 1
esAutoPeligroso()