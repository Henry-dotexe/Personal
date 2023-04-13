--persona = (nombre,edad,cantsueños,felicidonios,habilidades)
type Persona = (String , Int , Int , Int  , String)
{-juan :: Persona
juan = ("juan", 25 , 2 , 101 ,"Cocina")
fupedrito: Persona
pedrito = pedritono", 26 , 2 , 100 ,"Bailar")
fulanito :: Persona
fulanito = ("fulanito" , 32 , 1 , 50 , "Cantar")
)-}
-- Funciones auxiliares
edad :: Persona -> Int
edad (_,e,_,_,_) = e 

nombre :: Persona -> String
nombre (n,_,_,_,_) = n

cantsueños :: Persona -> Int
cantsueños (_,_,c,_,_) = c

felicidonios :: Persona -> Int
felicidonios (_,_,_,f,_) = f

habilidad :: Persona -> String
habilidad (_,_,_,_,h) = h

--Punto 1 || Listo
juan :: Persona
juan = ("juan", 25 , 2 , 101 ,"Cocina")
pedrito :: Persona
pedrito = ("pedrito", 26 , 2 , 100 ,"Bailar")
fulanito :: Persona
fulanito = ("fulanito" , 32 , 1 , 50 , "Cantar")

coefDeSatisf :: Persona -> Int
coefDeSatisf (_,e,s,f,_)
 |f>100 = f*e
 |50<f && f<=100 = s*f
 |otherwise = div f 2

gradoDeAmbicion :: Persona -> Int
gradoDeAmbicion (_,e,s,f,_)
 |f>100 = f*s
 |50<f && f<=100 = e*s
 |otherwise = s*2

--Punto 2 || Listo

evangelina :: Persona
evangelina = ("evangelina",20,1,70,"Actuar") --nombre no largo
maximiliano :: Persona
maximiliano = ("maximiliano",25,2,30,"Volar") --nombre largo
ariel :: Persona
ariel = ("ariel",20,3,14,"Nadar") --nombre no lindo || persona no suertuda
melina :: Persona
melina = ("melina",18,1,12,"Programar") --nombre lindo || persona suertuda

nombreLargo :: Persona -> Bool
nombreLargo (n,_,_,_,_) = ((>10).length) n
personaSuertuda :: Persona -> Bool
personaSuertuda = even.(*3).coefDeSatisf

nombreLindo :: Persona -> Bool
nombreLindo (n,_,_,_,_) = ((=='a').last) n

--Punto 3 || Listo

abril :: Persona
abril = ("abril",21,2,75,"Correr") --Persona de prueba

listaCiudades :: [String]
listaCiudades = ["New york","Madrid","Tokio"] --Lista de ciudades de prueba

recibirseDeCarrera :: Persona -> String -> Persona
recibirseDeCarrera per carrera = (nombre per,edad per,cantsueños per,((felicidonios per) + ((1000*).length) carrera),((habilidad per) ++ " , " ++ carrera))

viajarACiudades :: Persona -> [String] -> Persona
viajarACiudades per ciudades = (nombre per, ((+1).edad) per, cantsueños per, (felicidonios per) + ((100*).length) ciudades, habilidad per)

enamorarseDeOtraPersona :: Persona -> Persona -> Persona
enamorarseDeOtraPersona per1 per2 = (nombre per1, edad per1, cantsueños per1, felicidonios per1 + felicidonios per2, habilidad per1)

queTodoSigaIgual :: Persona -> Persona
queTodoSigaIgual per = per 

comboPerfecto :: Persona -> Persona
comboPerfecto (nom,ed,sue,fel,hab) = viajarACiudades (recibirseDeCarrera (nom,ed,sue,fel+100,hab) "Medicina") ["Berazategui","Paris"]