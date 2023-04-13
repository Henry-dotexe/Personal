-- Trabajo Práctico Grupal: Fuente de los Deseos
-- Grupo 3

--Las personas se modelan como tuplas de varios elementos
--Cada elemento tiene su tipo, que es un pseudonimo a los tipos estandar para facilitar su lectura
--(Menos el tipo habilidades que se define como una lista de Strings)

type Edad = Int
type Nombre = String
type Felicidonios = Int
type Habilidades = [String]
type Suenios = Int
type Persona = (Edad, Suenios, Nombre, Felicidonios, Habilidades)


-- Casos de prueba para probar las funciones


martin :: Persona
martin = (25, 2, "Martin", 100, ["Correr","Programar"])

ariel :: Persona
ariel = (21, 2, "ariel", 101, ["Correr", "Cantar"])

evangelina :: Persona
evangelina = (42, 6, "Evangelina", 47, ["Bailar", "Nadar"])

maximiliano :: Persona
maximiliano = (27, 4, "Maximiliano", 14, ["Saltar la soga", "Dibujar"])

melina :: Persona
melina = (52, 1, "Melina", 50, ["Manualidades"])


-- Funciones Auxiliares 

--Recibe una persona, devuelve sus felicidonios (Int)
cantidadFelicidonios :: Persona -> Felicidonios
cantidadFelicidonios (_,_,_,felicidonios,_) = felicidonios

--Recibe una persona, devuelve su edad (Int)
laEdad :: Persona -> Edad
laEdad (edad,_,_,_,_) = edad 

--Recibe una persona, devuelve su nombre (String)
nombreDeLaPersona :: Persona -> Nombre
nombreDeLaPersona (_,_,nombre,_,_) = nombre

--Recibe una persona, devuelve sus sueños (Int)
sueniosDeLaPersona :: Persona -> Suenios
sueniosDeLaPersona (_,suenios,_,_,_) = suenios

--Recibe una persona, devuelve sus habilidades (Lista de String)
habilidadesDeLaPersona :: Persona -> Habilidades
habilidadesDeLaPersona (_,_,_,_,habilidades) = habilidades

--Recibe una persona, devuelve verdadero si la cantidad de felicidonios es mayor a 100
personaMuyFeliz :: Persona -> Bool
personaMuyFeliz persona = (cantidadFelicidonios persona >100)

--Recibe una persona, devuelve verdadero si la cantidad de felicidonios es menor o igual a 100 y mayor a 50 
personaModeradamenteFeliz :: Persona -> Bool
personaModeradamenteFeliz persona = not(personaPocoFeliz persona) && not(personaMuyFeliz persona)

--Recibe una persona, devuelve verdadero si la cantidad de felicidonios es menor o igual a 50
personaPocoFeliz :: Persona -> Bool
personaPocoFeliz persona = cantidadFelicidonios persona <= 50


-- Desarrollo del Trabajo
divrev :: Integral a=>a -> Felicidonios -> a
divrev a b = div b a
aux :: persona -> Int -> a
aux persona n
 | (n==1) = ((divrev 2).cantidadFelicidonios) persona
 | otherwise = ((*2).sueniosDeLaPersona) persona
--Punto 1a
--Recibe una persona, realiza una operación según la condición que se cumpla y devuelve el resultado

coeficienteDeSatisfaccion :: Persona -> Int
coeficienteDeSatisfaccion persona
    | personaMuyFeliz persona = cantidadFelicidonios persona * laEdad persona
    | personaModeradamenteFeliz persona = cantidadFelicidonios persona * sueniosDeLaPersona persona
    | otherwise = aux persona 1

--Punto 1b
--Recibe una persona, realiza una operación según la condición que se cumpla y devuelve el resultado

gradoDeAmbicion :: Persona -> Int
gradoDeAmbicion persona
    | personaMuyFeliz persona = cantidadFelicidonios persona * sueniosDeLaPersona persona
    | personaModeradamenteFeliz persona = laEdad persona * sueniosDeLaPersona persona
    | otherwise = aux persona 2



--Punto 2a
--Devuelve verdadero si el nombre de una persona tiene mas de 10 letras

esNombreLargo :: Persona -> Bool
esNombreLargo = ((>10).length.nombreDeLaPersona)

--Punto 2b
--Devuelve verdadero si el coeficiente de satisfacción multiplicado por 3 es un numero par

esSuertuda :: Persona -> Bool
esSuertuda = even.(*3).coeficienteDeSatisfaccion

--Punto 2c
--Devuelve verdadero si el nombre de una persona termina con el caracter 'a'

esNombreLindo :: Persona -> Bool
esNombreLindo = ((=='a').last.nombreDeLaPersona)



--Punto 3


--Funcion auxiliar. Recibe una persona y un string y devuelve el tamaño del string multiplicado por 1000 y lo suma a los felicidonios de una persona
criterioRecibirse :: String -> Persona -> Felicidonios
criterioRecibirse carrera persona = length(carrera) * 1000 + cantidadFelicidonios persona

--Funcion auxiliar. Recibe una persona y una lista de strings. Devuelve el tamaño de la lista multiplicado por 100 y sumado a los felicidonios de la persona
criterioViajar :: [String] -> Persona -> Felicidonios
criterioViajar listaDeCiudades persona = length listaDeCiudades * 100 + cantidadFelicidonios persona 

--Funcion auxiliar. Recibe dos personas y suma sus felicidonios
criterioEnamorarse :: Persona -> Persona -> Felicidonios
criterioEnamorarse enamorado noEnamorado = cantidadFelicidonios enamorado + cantidadFelicidonios noEnamorado

--Aplica la funcion criterioRecibirse a una persona, devolviendo una tupla nueva con los valores modificados (los felicidonios).
recibirseDeUnaCarrera :: String -> Persona -> Persona
recibirseDeUnaCarrera carrera persona = (laEdad persona, sueniosDeLaPersona persona ,  nombreDeLaPersona persona, criterioRecibirse carrera persona , habilidadesDeLaPersona persona ++ [carrera])

--Aplica la funcion criterioViajar a una persona, devolviendo una nueva tupla con los valores modificados (Edad y felicidonios)
viajarAUnaListaDeCiudades:: [String] -> Persona -> Persona
viajarAUnaListaDeCiudades listaDeCiudades persona = (laEdad persona + 1, sueniosDeLaPersona persona ,  nombreDeLaPersona persona, criterioViajar listaDeCiudades persona , habilidadesDeLaPersona persona )

--Aplica la funcion criterioEnamorarse a una persona, devolviendo una nueva tupla con los valores modificados (felicidonios)
enamorarseDeOtraPersona :: Persona -> Persona -> Persona
enamorarseDeOtraPersona enamorado noEnamorado  = (laEdad enamorado, sueniosDeLaPersona enamorado ,  nombreDeLaPersona enamorado, criterioEnamorarse enamorado noEnamorado  , habilidadesDeLaPersona enamorado)

--Recibe una persona y la devuelve sin cambios
queTodoSigaIgual :: Persona -> Persona
queTodoSigaIgual persona = persona

--Lista auxiliar que se utilizan en la funcion comboPerfecto
ciudadesImportantes :: [String]
ciudadesImportantes = [
   "Berazategui",
    "Paris"
    ]

--Recibe una persona se le sumaran 100 felicidonios y 1 a su edad (tambien se le aplicaran las funciones
--recibirseDeUnaCarrera y viajarAUnaListaDeCiudades
comboPerfecto :: Persona -> Persona
comboPerfecto (edad,suenios,nombre,felicidonios,habilidades) = viajarAUnaListaDeCiudades ciudadesImportantes (recibirseDeUnaCarrera "Medicina" (edad,suenios,nombre,felicidonios+100,habilidades) ) 
