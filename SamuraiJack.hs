import Text.Show.Functions
data Elemento = UnElemento { 
    tipo :: String,
    ataque :: (Personaje-> Personaje),
    defensa :: (Personaje-> Personaje) }deriving(Show)
data Personaje = UnPersonaje { 
    nombre :: String,
    salud :: Float,
    elementos :: [Elemento],
    anioPresente :: Int }deriving(Show)

evasion :: Elemento
evasion = UnElemento{
    tipo = "Agilidad",
    ataque = causarDanio 0,
    defensa = proteccion 1}
hechizo :: Elemento
hechizo = UnElemento{
    tipo = "Maldad",
    ataque = causarDanio 50,
    defensa = proteccion 0
}
corteMortal :: Elemento
corteMortal = UnElemento{
    tipo = "Corte",
    ataque = causarDanio 100,
    defensa = proteccion 0
}
jack :: Personaje
jack = UnPersonaje{
    nombre = "Jack",
    salud = 100,
    elementos = [evasion],
    anioPresente = 1700
}
aku :: Personaje
aku = UnPersonaje{
    nombre = "Aku",
    salud = 200,
    elementos = [hechizo,corteMortal],
    anioPresente = 1700
}
enemigoGenerico :: Personaje
enemigoGenerico = UnPersonaje{
    nombre = "EnemigoGenerico",
    salud = 50,
    elementos = [],
    anioPresente = 1700
}
generadorEnemigos :: Personaje->Elemento->Personaje
generadorEnemigos enem elemento= enem {elementos = (elementos enem)++ [elemento] }
--Punto 1
mandarAlAnio :: Personaje->Int->Personaje
mandarAlAnio personaje anio= personaje {anioPresente = anio}

modificarSalud :: Personaje->(Float->Float)->Personaje
modificarSalud personaje modSalud = personaje {salud= modSalud (salud personaje)}

meditar :: Personaje->Personaje
meditar personaje = modificarSalud personaje (*1.5)

proteccion :: Float-> Personaje -> Personaje
proteccion n personaje= modificarSalud personaje (*(1+(n/10)))

causarDanio ::  Float ->Personaje ->Personaje
causarDanio danio personaje 
    |danio<(salud personaje) = modificarSalud personaje (+(-danio))
    |otherwise = modificarSalud personaje (*0)

--Punto 2
{-a. esMalvado, que retorna verdadero si alguno de los elementos que tiene el personaje
en cuestión es de tipo “Maldad”.
b. danioQueProduce :: Personaje -> Elemento -> Float, que retorne la diferencia entre
la salud inicial del personaje y la salud del personaje luego de usar el ataque del
elemento sobre él. -}
esMalvado :: Personaje->Bool
esMalvado = (elem "Maldad").(map tipo).elementos

danioQueProduce :: Personaje -> Elemento ->Float
danioQueProduce personaje elemento = (salud personaje) - ((salud).(ataque elemento))personaje

enemigosMortales :: Personaje -> [Personaje] -> [Personaje]
enemigosMortales personaje  = filter (mataDeUnGolpe) 
    where mataDeUnGolpe = (\enemigo -> any ((>= salud personaje).(danioQueProduce personaje)) (elementos enemigo))

--Punto 3