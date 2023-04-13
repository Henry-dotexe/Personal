import Text.Show.Functions
data Aspecto = UnAspecto {
    tipoDeAspecto :: String,
    grado :: Float
} deriving (Show,Eq)

type Situacion = [Aspecto]

situacion1 :: Situacion
situacion1 = [UnAspecto "peligro" 40, UnAspecto "tension" 30, UnAspecto "incertidumbre" 20]

situacion2 :: Situacion
situacion2 = [UnAspecto "tension" 20,UnAspecto "incertidumbre" 10, UnAspecto "peligro" 30]

situacion3 :: Situacion
situacion3 = [UnAspecto "incertidumbre" 40, UnAspecto "peligro" 40,UnAspecto "tension" 30]

situacion4 :: Situacion
situacion4 = [UnAspecto "peligro" 10, UnAspecto "tension" 29, UnAspecto "incertidumbre" 30]

mejorAspecto :: Aspecto -> Aspecto -> Bool
mejorAspecto mejor peor = grado mejor < grado peor

mismoAspecto :: Aspecto -> Aspecto -> Bool
mismoAspecto aspecto1 aspecto2 = tipoDeAspecto aspecto1 == tipoDeAspecto aspecto2

buscarAspecto :: Aspecto->Situacion->Aspecto
buscarAspecto aspectoBuscado = head.filter (mismoAspecto aspectoBuscado)

buscarAspectoDeTipo :: String -> Situacion -> Aspecto
buscarAspectoDeTipo tipo = buscarAspecto (UnAspecto tipo 0)

reemplazarAspecto :: Aspecto -> Situacion -> Situacion
reemplazarAspecto aspectoBuscado situacion = aspectoBuscado : (filter (not.mismoAspecto aspectoBuscado) situacion)

modificarAspecto :: (Float->Float)->Aspecto->Aspecto 
modificarAspecto funcion aspectoAcambiar =  aspectoAcambiar { grado =funcion (grado aspectoAcambiar) }

mejorSituacion :: Situacion -> Situacion -> Bool
mejorSituacion sit1 sit2 = all (primeroMejorQueSegundo) sit1 
    where
        primeroMejorQueSegundo = (\aspectoPrimero -> mejorAspecto aspectoPrimero (buscarAspecto aspectoPrimero sit2))

modificarSituacion :: String -> (Float->Float) -> Situacion -> Situacion
modificarSituacion tipoBuscado modifGrado sit= flip reemplazarAspecto sit (modificarAspecto modifGrado (buscarAspectoDeTipo tipoBuscado sit)) 

data Gema = UnaGema {
    nombre :: String,
    fuerza :: Int,
    personalidad :: Situacion->Situacion
}deriving(Show)

vidente :: Situacion->Situacion
vidente = (modificarSituacion "tension" (+(-10))).modificarSituacion "incertidumbre" (/2)

relajada :: Float->Situacion->Situacion
relajada relajacion= (modificarSituacion "tension" (+(-30))).modificarSituacion "peligro" (+relajacion)

tonta :: Situacion -> Situacion
tonta = (modificarSituacion "tension" (+10)).(modificarSituacion "incertidumbre" (+10)).modificarSituacion "peligro" (+10)

inteligente :: Situacion -> Situacion
inteligente = (modificarSituacion "tension" (+(-15))).modificarSituacion "peligro" (+(-10))

rebelde :: Situacion -> Situacion
rebelde = (modificarSituacion "incertidumbre" (+10)).modificarSituacion "peligro" (+25)

garnet :: Gema --Ejemplo gema vidente
garnet = UnaGema{
    nombre = "garnet",
    fuerza = 50,
    personalidad = vidente
}
lapis :: Gema --Ejemplo gema relajada
lapis = UnaGema{
    nombre = "lapislazuli",
    fuerza = 30,
    personalidad = relajada 10
}
steven :: Gema
steven = UnaGema{
    nombre = "steven",
    fuerza = 40,
    personalidad = disminuirEn10
}
peridot :: Gema
peridot = UnaGema {
    nombre = "peridot",
    fuerza = 5,
    personalidad = tonta
}
amatista :: Gema
amatista = UnaGema {
    nombre = "amatista",
    fuerza = 45,
    personalidad = rebelde
}
perla :: Gema
perla = UnaGema{
    nombre = "perla",
    fuerza = 50,
    personalidad = inteligente
}
bismuto :: Gema
bismuto = UnaGema{
    nombre = "bismuto",
    fuerza = 70,
    personalidad = rebelde
}
fuerzaSuperior :: Gema -> Gema -> Bool
fuerzaSuperior gema1 gema2 = (fuerza gema1) > (fuerza gema2)

vivirSituacion :: Gema -> Situacion -> Situacion
vivirSituacion gema = personalidad gema

mejorReaccion :: Gema -> Gema -> Situacion -> Bool
mejorReaccion gema1 gema2 situacion = mejorSituacion (vivirSituacion gema1 situacion) (vivirSituacion gema2 situacion) 

gemaGanadora :: Gema -> Gema -> Situacion -> Bool
gemaGanadora gema1 gema2 situacion = (fuerzaSuperior gema1 gema2) && (mejorReaccion gema1 gema2 situacion)

disminuirEn10 :: Situacion -> Situacion
disminuirEn10 sit = map (modificarAspecto (+(-10))) sit

criterioCompatible :: Gema -> Gema -> (Situacion->Situacion)
criterioCompatible gema1 gema2 = (personalidad gema1).(personalidad gema2).(disminuirEn10)

esCompatible :: Gema -> Gema -> Situacion -> Bool
esCompatible gema1 gema2 situacion = 
    mejorSituacion ((criterioCompatible gema1 gema2) situacion) (vivirSituacion gema1 situacion) && mejorSituacion ((criterioCompatible gema1 gema2) situacion) (vivirSituacion gema2 situacion)

gemaDominante :: Gema->Gema-> Situacion->Gema
gemaDominante gema1 gema2 situacion
 |gemaGanadora gema1 gema2 situacion = gema1
 |otherwise = gema2

criterioFuerza :: Gema->Gema->Situacion -> Int
criterioFuerza gema1 gema2 situacion 
 |esCompatible gema1 gema2 situacion = 10*((fuerza gema1)+(fuerza gema2))
 |otherwise = (fuerza (gemaDominante gema1 gema2 situacion))*7

criterioNombre :: Gema -> Gema -> String
criterioNombre gema1 gema2 
 |(nombre gema1)==(nombre gema2) = nombre gema1
 |otherwise = (nombre gema1)++(nombre gema2)

fusion :: Situacion->Gema->Gema->Gema
fusion situacion gema1 gema2 = 
    UnaGema (criterioNombre gema1 gema2) (criterioFuerza gema1 gema2 situacion) (criterioCompatible gema1 gema2)

fusionGrupal :: Situacion->[Gema]->Gema
fusionGrupal situacion (x:xs) = foldl (fusion situacion) x xs