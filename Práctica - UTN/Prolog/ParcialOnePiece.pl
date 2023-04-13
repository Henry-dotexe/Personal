% Relaciona Pirata con Tripulacion
tripulante(luffy, sombreroDePaja).
tripulante(zoro, sombreroDePaja).
tripulante(nami, sombreroDePaja).
tripulante(franky, sombreroDePaja).
tripulante(robin, sombreroDePaja).
tripulante(brook, sombreroDePaja).
tripulante(ussop, sombreroDePaja).
tripulante(sanji, sombreroDePaja).
tripulante(chopper, sombreroDePaja).
tripulante(law, heart).
tripulante(bepo, heart).
tripulante(arlong, piratasDeArlong).
tripulante(hatchan, piratasDeArlong).

% Relaciona Pirata, Evento y Monto
impactoEnRecompensa(luffy, arlongPark, 30000000).
impactoEnRecompensa(luffy, baroqueWorks, 70000000).
impactoEnRecompensa(luffy, eniesLobby, 200000000).
impactoEnRecompensa(luffy, marineford, 100000000).
impactoEnRecompensa(luffy, dressrosa, 100000000).
impactoEnRecompensa(zoro, baroqueWorks, 60000000).
impactoEnRecompensa(zoro, eniesLobby, 60000000).
impactoEnRecompensa(zoro, dressrosa, 200000000).
impactoEnRecompensa(nami, eniesLobby, 16000000).
impactoEnRecompensa(nami, dressrosa, 50000000).
impactoEnRecompensa(ussop, eniesLobby, 30000000).
impactoEnRecompensa(ussop, dressrosa, 170000000).
impactoEnRecompensa(sanji, eniesLobby, 77000000).
impactoEnRecompensa(sanji, dressrosa, 100000000).
impactoEnRecompensa(chopper, eniesLobby, 50).
impactoEnRecompensa(chopper, dressrosa, 100).
impactoEnRecompensa(law, sabaody, 200000000).
impactoEnRecompensa(law, descorazonamientoMasivo, 240000000).
impactoEnRecompensa(law, dressrosa, 60000000).
impactoEnRecompensa(bepo,sabaody,500).
impactoEnRecompensa(arlong, llegadaAEastBlue,20000000).
impactoEnRecompensa(hatchan, llegadaAEastBlue, 3000).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%1. Relacionar a dos tripulaciones y un evento. Esto ocurre si al menos un miembro de cada una participó en el mismo evento
%Es decir, que tuvieron impacto en su recompensa por participar
participaEnEvento(Tripulacion,Evento) :-tripulante(Miembro,Tripulacion),impactoEnRecompensa(Miembro,Evento,_).
relacionadosEnEvento(Tripulacion1,Tripulacion2,Evento) :- 
    participaEnEvento(Tripulacion1,Evento),
    participaEnEvento(Tripulacion2,Evento),
    Tripulacion1\=Tripulacion2.

%2. Saber el pirata más destacado de un evento en base a su impacto en recompensa
masDestacado(Evento,Pirata) :-  
    impactoEnRecompensa(Pirata,Evento,MayorRecompensa),
    forall((impactoEnRecompensa(OtroPirata,Evento,Recompensa),Pirata\=OtroPirata),MayorRecompensa>=Recompensa).

%3.Saber si un pirata pasó desapercibido en un evento. Esto ocurre si no hubo impacto en su recompensa aunque su tripulacion haya participado
pirataNoParticipo(Pirata,Evento) :- tripulante(Pirata,_),not(impactoEnRecompensa(Pirata,Evento,_)).
pasoDesapercibido(Pirata,Evento) :- 
    tripulante(Pirata,Tripulacion),
    participaEnEvento(Tripulacion,Evento),
    pirataNoParticipo(Pirata,Evento).

%4.Saber la recompensa total de la tripulacion (Suma de las recompensas actuales de cada tripulante)
recompensaActual(Pirata,Recompensa) :- findall(Impacto,impactoEnRecompensa(Pirata,_,Impacto),Impactos),sumlist(Impactos,Recompensa).
recompensaTripulacion(Tripulacion,RecompensaTotal) :- 
    tripulante(_,Tripulacion),
    findall(Recompensa,(tripulante(Pirata,Tripulacion),recompensaActual(Pirata,Recompensa)),Recompensas),
    sumlist(Recompensas,RecompensaTotal).

%5.Saber si una tripulación es temible. 
%Lo es si todos sus integrantes son peligrosos o si la recompensa total de la tripulación supera los $500.000.000. 
%Consideramos peligrosos a piratas cuya recompensa actualsupere los ​​$100.000.000.
%6a. Modificar pirataPeligroso. Alguien que comió una fruta peligrosa se considera peligroso​, independientemente de su recompensa
pirataPeligroso(Pirata):- tripulante(Pirata,_),recompensaActual(Pirata,Recompensa),Recompensa>100000000.
pirataPeligroso(Pirata) :- usuarioDeFruta(Pirata,Fruta),frutaPeligrosa(Fruta).
tripulacionTemible(Tripulacion) :- forall(tripulante(Pirata,Tripulacion),pirataPeligroso(Pirata)).
tripulacionTemible(Tripulacion) :- recompensaTripulacion(Tripulacion,Recompensa),Recompensa>500000000.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Se Necesita: Predicado para los usuarios de frutas, Predicado para frutas peligrosas


usuarioDeFruta(luffy,paramecia(gomugomu,no)).
usuarioDeFruta(buggy,paramecia(barabara,no)).
usuarioDeFruta(law,paramecia(opeope,si)).
usuarioDeFruta(chopper,zoan(hitohito)).
usuarioDeFruta(lucci,zoan(nekoneko)).
usuarioDeFruta(smoker,logia(mokumoku)).

frutaPeligrosa(logia(_)).
frutaPeligrosa(zoan(nekoneko)).
frutaPeligrosa(zoan(inuinu)).
frutaPeligrosa(zoan(hebihebi)).
frutaPeligrosa(paramecia(_,si)).

%6b. Justificar las decisiones de modelado tomadas para cumplir con lo pedido
/*Modelo las frutas usando functores para contener su información en un solo dato compuesto
Todas las frutas tienen su nombre y en caso de las paramecias se indica si son peligrosas o no
usuarioDeFruta relaciona a un pirata con la fruta que ingirió
frutaPeligrosa considera peligrosas todas las logia, las paramecias que indican que son peligrosas
y las frutas zoan de las 3 especies dichas, esto ultimo debido a la decision de modelado
se hizo mediante hechos ya que las zoan no indican una especie concreta, y aunque lo hicieran
ocuparía las mismas lineas con logica innecesaria */

%7. Saber si una tripulacion es de piratas de asfalto (ninguno puede nadar)
piratasDeAsfalto(Tripulacion) :- 
    forall(tripulante(Pirata,Tripulacion),
    usuarioDeFruta(Pirata,_)).