%Henry Soto - Paradigmas de programación 
% contenido( Titulo, Contenido)
%    peli(Protagonistas, Reparto)
%    serie(Temporada, Protagonistas, Reparto) 
contenido(secretoDeTusOjos, peli([ darin, villamil, rago, francella ], [ alarcon, gioia ])).
contenido(elPadrino, peli( [ alpaccino, brando ], [] )).
contenido(avengers, peli([ downeyjr, evans, ruffalo, hemsworth, johansson, pratt ], [ samuelJackson, dinklage ])).
contenido(friends, serie(1, [ cox, anniston ], [ typer ])).
contenido(friends, serie(8, [ cox, anniston ], [ pitt ])).

contenido(got,serie(1,[clarke,kit,dinklage],[momoa,gillen])).
contenido(got,serie(2,[clarke,kit,dinklage],[momoa,gillen])).
contenido(got,serie(3,[clarke,kit,dinklage],[momoa,gillen])).
contenido(got,serie(4,[clarke,kit,dinklage],[momoa,gillen])).
contenido(got,serie(5,[clarke,kit,dinklage],[momoa,gillen])).
contenido(got,serie(6,[clarke,kit,dinklage],[momoa,gillen])).
contenido(got,serie(7,[clarke,kit,dinklage],[momoa,gillen])).
contenido(got,serie(8,[clarke,kit,dinklage],[momoa,gillen])).

% personaje(Nombre, Fans, Skills)
personaje(alpaccino,4000,[violento]).
personaje(brando, 4000, [violento, pokerFace]).
personaje(pratt, 2000, [carilindo, comico]).
personaje(francella, 200, [comico, serio]).

personaje(downeyjr,10000,[filantropo,millonario,playboy]).
personaje(samuelJackson,5000,[serio]).

%mauskerramienta
esActor(Alguien) :- participaEnContenido(Alguien,_).
esContenido(Contenido) :- contenido(Contenido,_).

%1. popular/1. Un personaje es popular si tiene mas de 3mil fans
popular(Alguien) :- personaje(Alguien,Fans,_),Fans>3000.

%6.b Alguien es popular tambien si admite multiverso
popular(Alguien) :- personaje(Alguien,_,_),admiteMultiverso(Alguien).

%2. Se pide saber si un actor participó en un contenido, independientemente del papel
%Hago pattern matching para series/peliculas 

participaEnContenido(Actor,Titulo) :- esProtagonista(Actor,Titulo).
participaEnContenido(Actor,Titulo) :- contenido(Titulo,peli(_,Reparto)),member(Actor,Reparto).
participaEnContenido(Actor,Titulo) :- contenido(Titulo,serie(_,_,Reparto)),member(Actor,Reparto).

%Predicado auxiliar para mas adelante
esProtagonista(Actor,Titulo) :-  contenido(Titulo,peli(Protagonistas,_)),member(Actor,Protagonistas).
esProtagonista(Actor,Titulo) :-  contenido(Titulo,serie(_,Protagonistas,_)),member(Actor,Protagonistas).

%3. Se pide saber si un actor es una estrellita de cine (No participa en series)
%No se puede usar forall/2
esSerie(Titulo) :- contenido(Titulo,serie(_,_,_)).
esPeli(Titulo) :- contenido(Titulo,peli(_,_)).
esEstrellitaDeCine(Actor) :- esActor(Actor),findall(Serie,(participaEnContenido(Actor,Serie),esSerie(Serie)),ListaSeries) , length(ListaSeries,0).

%4. Se pide saber si un actor es de pantalla grande (participa en al menos una peli)
esDePantallaGrande(Actor) :- esActor(Actor),findall(Peli,(participaEnContenido(Actor,Peli),esPeli(Peli)),ListaPelis) , length(ListaPelis,N),N\=0.

%5. Reencuentro de latinoamérica unida (titulos en los que participan al menos dos populares) 
reencuentroLatamUnida(Titulo) :- esContenido(Titulo),findall(Actor,(participaEnContenido(Actor,Titulo),popular(Actor)),ListaActores) , length(ListaActores,N), N>1.

%6.admiteMultiverso/1, verdadero cuando un personaje es protagonista de al menos 5 contenidos

admiteMultiverso(Actor) :- esActor(Actor),findall(Contenido,esProtagonista(Actor,Contenido),ListaContenidos) , length(ListaContenidos,N), N>4.

%7. daParaACDC, verdadero cuando todos los participantes de un contenido son violentos
esViolento(Alguien) :- personaje(Alguien,_,Skills),member(violento,Skills).
daParaACDC(Titulo) :- esContenido(Titulo),forall(participaEnContenido(Actor,Titulo),esViolento(Actor)).

%8. sonInseparables/2, dos personajes son inseparables si siempre trabajan juntos

sonInseparables(Actor1,Actor2) :- forall(participaEnContenido(Actor1,Titulo),participaEnContenido(Actor2,Titulo)).

%9. ¿Qué predicados debería modificar para agregar un nuevo tipo de contenido?
% ¿Qué concepto me ayuda a realizarlo de forma simple?

%participaEnContenido,esProtagonista son los unicos predicados que se modificarían 
%El concepto que permite esta simplicidad es el polimorfismo, ya que ambos predicados funcionan con todos los tipos de contenido definidos,
%por lo que el resto de predicados que los utilizan pueden tratar los datos como iguales

%10.Indique al menos una vez donde se haga uso de los siguientes conceptos
%Polimorfismo: En los predicados participaEnContenido y esProtagonista, ya que contemplan todos los tipos de contenido
%Patter matching: También se utiliza en los predicados participaEnContenido y esProtagonista para matchear entre pelis y series
%Orden superior: Se utiliza en todos los predicados que usan findall o forall (Puntos 3,4,5,6,7,8)

%11. Se pide saber si se puede resumir una serie de una temporada a otra
%Una serie se puede resumir si existen todas las temporadas en el rango pedido

temporadaCargada(Titulo,Temporada):-contenido(Titulo,serie(Temporada,_,_)).

sePuedeResumir(Titulo,TemporadaInicio,TemporadaFinal) :- 
    esSerie(Titulo), 
    forall(between(TemporadaInicio,TemporadaFinal,Temporada),temporadaCargada(Titulo,Temporada)).

%12. Se pide saber si una serie esta completa
temporadasDeSerie(got,8). %Caso de prueba y para que zafe del error de predicado indefinido
estaCompleta(Titulo) :- 
    esSerie(Titulo),temporadasDeSerie(Titulo,Cantidad),
    forall(between(1,Cantidad,Temporada),temporadaCargada(Titulo,Temporada)).