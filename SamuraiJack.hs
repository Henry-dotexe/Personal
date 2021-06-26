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
    tipo = "movimiento",
    ataque = causarDanio 0,
    defensa = proteccion 1}

jack :: Personaje
jack = UnPersonaje{
    nombre = "jack",
    salud = 100,
    elementos = [evasion],
    anioPresente = 1700
}

mandarAlAnio :: Personaje->Int->Personaje
mandarAlAnio personaje anio= personaje {anioPresente = anio}

meditar :: Personaje->Personaje
meditar personaje = personaje {salud= (salud personaje)*1.5}

proteccion :: Float-> Personaje -> Personaje
proteccion n personaje= personaje {salud=(salud personaje)*(n/10)}

causarDanio ::  Float ->Personaje ->Personaje
causarDanio danio personaje 
    |danio<=(salud personaje) = personaje { salud=(salud personaje)-danio }
    |otherwise = personaje {salud=0}