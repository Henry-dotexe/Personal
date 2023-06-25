data Persona = Persona{
    nombre :: String, 
    edad :: Int,
    sueños :: [Persona -> Persona],
    felicidonios :: Int,
    habilidades :: [String]
}

type Fuente = Persona->Persona
type Criterio = Persona ->Fuente -> Fuente -> Bool

-- type Persona = (Nombre,Edad,Persona->Persona,Felicidonios,Habilidades)


--Personas para pruebas
fran::Persona
fran = Persona {
    nombre = "fran",
    edad = 26,
    sueños = [viajar ["New york"], recibirse "odontologia"],
    felicidonios = 100,
    habilidades = ["Compus"]
} 
    --("fran", 26,["Programar", "Hablar inglés"],100,["Compus"]) -- Persona moderadamente feliz con 2 sueños

panTriste::Persona
panTriste = Persona {
    nombre = "panTriste",
    edad = 21,
    sueños = [recibirse "diseño grafico"],
    felicidonios = 50,
    habilidades = ["Llorar"]
} 
    --("panTriste", 21, ["Felicidad"], 50, ["Llorar"]) -- Persona poco feliz con 1 sueño y 50 felicidonios

--Personas definidas para los casos de prueba de la consigna
melina :: Persona
melina = Persona {
    nombre = "melina",
    edad = 25,
    sueños = [enamorarse ariel, viajar["Francia"]],
    felicidonios = 101,
    habilidades = ["cantar"]
} 
    --("melina", 25, ["Hablar francés", "Paracaidismo"], 101, ["cantar"]) -- Persona muy feliz

ariel :: Persona
ariel = Persona {
    nombre = "ariel",
    edad = 26,
    sueños = [recibirse "biologia", enamorarse evangelina],
    felicidonios = 100,
    habilidades = ["nadar"]
}  
    --("ariel", 26, ["Entrenar delfines","Bucear"], 100, ["nadar"]) --Persona moderadamente feliz

evangelina :: Persona
evangelina = Persona {
    nombre = "evangelina",
    edad = 32,
    sueños = [recibirse "musica"],
    felicidonios = 50,
    habilidades = ["Cocinar arepas"]
}   
    --("evangelina", 32, ["Ser una estrella"], 50, ["Cocinar Arepas"]) --Persona poco feliz

maximiliano :: Persona
maximiliano = Persona {
    nombre = "maximiliano",
    edad = 43,
    sueños = [],
    felicidonios = 14,
    habilidades = ["Pescar camarones"]
}   
    --("maximiliano", 43, 0, 14,["Pescar camarones"]) -- Persona no suertuda

camilo::Persona
camilo = Persona {
    nombre = "camilo",
    edad = 21,
    sueños = [enamorarse eugenia, viajar ["Colorado"]],
    felicidonios = 12,
    habilidades = ["Fitness"]
}   
    --("camilo", 21, ["Casarse","Tocar guitarra"], 12,["Fitness"]) -- Persona suertuda

eugenia :: Persona
eugenia = Persona {
    nombre = "eugenia",
    edad = 22,
    sueños = [recibirse "DiseñodeInteriores", viajar ["paris"]],
    felicidonios = 5000,
    habilidades = []
}   
    --("eugenia", 22, [recibirse "diseñoDeInteriores", viajar ["paris"], enamorarse manuel], 5000, [])

manuel :: Persona
manuel =Persona {
    nombre = "manuel",
    edad = 28,
    sueños = [],
    felicidonios = 15,
    habilidades = []
}   
    --("manuel", 28, [], 15,[])


-- Punto 1

esMuyFeliz :: Persona->Bool
esMuyFeliz persona = felicidonios persona > 100

esModeradamenteFeliz :: Persona->Bool
esModeradamenteFeliz persona = felicidonios persona <= 100 && felicidonios persona > 50

coeficienteDeSatisfaccion :: Persona -> Int
coeficienteDeSatisfaccion persona
    | esMuyFeliz persona = felicidonios persona * edad persona
    | esModeradamenteFeliz persona = length (sueños persona) * felicidonios persona
    | otherwise = div (felicidonios persona) 2

gradoDeAmbicion :: Persona -> Int
gradoDeAmbicion persona
    | esMuyFeliz persona = felicidonios persona * length (sueños persona)
    | esModeradamenteFeliz persona =  edad persona * length (sueños persona)
    | otherwise = length (sueños persona) * 2

-- Punto 2
tieneNombreLargo :: Persona -> Bool
tieneNombreLargo = (>10).length.nombre

suertuda :: Persona -> Bool
suertuda = even.(*3).coeficienteDeSatisfaccion

tieneNombreLindo :: Persona -> Bool
tieneNombreLindo = (=='a').last.nombre

-- Punto 3

sumarFelicidonios :: Int->Persona -> Persona
sumarFelicidonios felicidoniosAsumar persona = persona {felicidonios = felicidonios persona + felicidoniosAsumar}

recibirse :: String -> Persona -> Persona
recibirse carrera persona  = persona {felicidonios = felicidonios persona + length carrera * 1000,
habilidades = habilidades persona ++ [carrera]}

viajar :: [String] -> Persona  -> Persona
viajar lugares persona  = persona {felicidonios = felicidonios persona + length lugares * 100, edad = edad persona + 1} 

enamorarse :: Persona -> Persona -> Persona
enamorarse enamorado persona =  persona {felicidonios = felicidonios persona + felicidonios enamorado}

todoSigueIgual :: Persona -> Persona
todoSigueIgual = id


comboPerfecto :: Persona -> Persona
comboPerfecto = sumarFelicidonios 100.viajar ["Berazategui","Paris"].recibirse "Medicina"

-- Punto 4

fuenteminimalista :: Fuente
fuenteminimalista persona =  (head (sueños persona) persona){
    sueños= tail (sueños persona)
}

fuenteCopada :: Fuente
fuenteCopada persona = (foldl1 (.) (sueños persona) persona){
    sueños=[]
}

-- Punto 5

masFelicidonios :: Criterio
masFelicidonios persona primeraFuente segundaFuente  =
    (felicidonios.primeraFuente) persona > (felicidonios.segundaFuente) persona

menosFelicidonios :: Criterio
menosFelicidonios primeraFuente segundaFuente = not.masFelicidonios primeraFuente segundaFuente

masHabilidades :: Criterio
masHabilidades persona primeraFuente segundaFuente  = (length.habilidades.primeraFuente) persona > (length.habilidades.segundaFuente) persona

leGanaSegunCriterio :: Criterio -> Persona -> Fuente -> Fuente -> Fuente
leGanaSegunCriterio criterio persona primeraFuente segundaFuente  
    | criterio persona primeraFuente segundaFuente = primeraFuente
    | otherwise = segundaFuente

fuenteGanadora :: [Fuente] -> Persona -> Criterio -> Fuente
fuenteGanadora fuentes persona criterio = foldl1 (leGanaSegunCriterio criterio persona) fuentes