coeficienteDeSatisfaccion :: (Int, Int, String, Int, [String]) -> Int
coeficienteDeSatisfaccion (edad, cantidadSueños, _, felicidonios, _) 
 | felicidonios > 100 = felicidonios * edad
 | felicidonios <= 100 && felicidonios > 50 = cantidadSueños * felicidonios 
 | otherwise = div felicidonios 2

--caso1A1 = (25, 2, "Hector", 101, ["alfareria", "costureria"])
--caso1A2 = (25, 2, "Hector", 100, ["alfareria", "costureria"])
--caso1A3 = (25, 2, "Hector", 50, ["alfareria", "costureria"])

gradoDeAmbicion :: (Int, Int, String, Int, [String]) -> Int
gradoDeAmbicion (edad, cantidadSueños, _, felicidonios, _) 
 | felicidonios > 100 = felicidonios * cantidadSueños
 | felicidonios <= 100 && felicidonios > 50 = edad * cantidadSueños
 | otherwise = cantidadSueños * 2 

--caso1B1 = (25, 2, "Hector", 101, ["alfareria", "costureria"])
--caso1B2 = (26, 2, "Hector", 100, ["alfareria", "costureria"])
--caso1B3 = (25, 1, "Hector", 50, ["alfareria", "costureria"])

tieneNombreLargo :: (Int, Int, String, Int, [String]) -> Bool
tieneNombreLargo (_, _, nombre, _, _) = 
    ((>10).length) nombre 

--caso2A1 = (25, 2, "Evangelina", 101, ["alfareria", "costureria"])
--caso2A2 = (25, 2, "Maximiliano", 101, ["alfareria", "costureria"])

esPersonaSuertuda :: (Int, Int, String, Int, [String]) -> Bool
esPersonaSuertuda = even.(*3).coeficienteDeSatisfaccion

--caso2B1 = (25, 1, "Hector", 14, ["alfareria", "costureria"])
--caso2B2 = (25, 1, "Hector", 12, ["alfareria", "costureria"])

tieneNombreLindo :: (Int, Int, String, Int, [String]) -> Bool
tieneNombreLindo (_, _, nombre, _, _) = 
    ((== 'a').last) nombre

-- caso2C1 = (25, 1, "Ariel", 14, ["alfareria", "costureria"])
-- caso2C2 = (25, 1, "Melina", 14, ["alfareria", "costureria"])

recibirseDeUnaCarrera :: (Int, Int, String, Int, [String]) -> String -> (Int, Int, String, Int, [String])
recibirseDeUnaCarrera (edad, cantidadSueños, nombre, felicidonios, habilidades) carrera =
    (edad, cantidadSueños - 1, nombre, felicidonios + ((*1000).length) carrera, habilidades ++ [carrera])

-- caso3A = (25, 2, "Hector", 12, ["alfareria", "costureria"]) "abogacia"    (8012 felicidonios (+8000) y 1 sueño (-1))

viajarAUnaListaDeCiudades :: (Int, Int, String, Int, [String]) -> [String] -> (Int, Int, String, Int, [String])
viajarAUnaListaDeCiudades (edad, cantidadSueños, nombre, felicidonios, habilidades) listaDeCiudades = 
    (edad + 1, cantidadSueños - 1, nombre, felicidonios + ((*100).length) listaDeCiudades, habilidades)

-- caso3B = (25, 1, "Hector", 12, ["alfareria", "costureria"]) ["Springfield", "Shiganshina", "Konoha", "Pueblo Paleta"]    (412 felicidonios (+400) y 0 sueños (-1))

enamorarseDeOtraPersona :: (Int, Int, String, Int, [String]) -> (Int, Int, String, Int, [String]) -> (Int, Int, String, Int, [String])
enamorarseDeOtraPersona (edadAmante, cantidadSueñosAmante, nombreAmante, felicidoniosAmante, habilidadesAmante) (_, _, _, felicidoniosAmado, _) =
    (edadAmante, cantidadSueñosAmante - 1, nombreAmante, felicidoniosAmante + felicidoniosAmado, habilidadesAmante)

-- caso3C = (25, 1, "Hector", 12, ["alfareria", "costureria"]) (25, 1, "Ariel", 14, ["alfareria", "costureria", "medicina"])    (Hector debería tener 26 felicidonios (+14) y 0 sueños (-1))

queTodoSigaIgual :: (Int, Int, String, Int, [String]) -> (Int, Int, String, Int, [String])
queTodoSigaIgual persona = persona

-- caso3D = (25, 1, "Ariel", 14, ["alfareria", "costureria", "medicina"])     (exactamente lo mismo que antes)


comboPerfecto :: (Int, Int, String, Int, [String]) -> (Int, Int, String, Int, [String])

comboPerfecto (edad, cantidadSueños, nombre, felicidonios, habilidades) = 
    (viajarAUnaListaDeCiudades (recibirseDeUnaCarrera (edad, cantidadSueños, nombre, felicidonios + 100, habilidades) "Medicina") ["Berazategui", "Paris"])

--Esta función debería sumar 8300 felicidonios (8000 medicina, 200 por visitar 2 ciudades y 100 como bonus), sumarle un año a la edad, restar 2 sueños y agregar medicina a las habilidades de la persona.

--caso3E = (25, 4, "Hector", 12, ["alfareria", "costureria"])   -> Hector debería tener 26 años, 2 sueños, 8312 felicidonios y tener como habilidades ["alfareria","costureria","Medicina"]
