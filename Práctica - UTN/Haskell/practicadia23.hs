type Materias = [(String,Float)]
type Alumno = (String, Int, Materias)
diana :: Alumno
diana = ("diana",21,[("AM1",6),("ADS",8),("Fisica 1",7)])

henry :: Alumno
henry =("henry",21,[])

nombre :: Alumno -> String
nombre (nombre,_,_)= nombre 

edad :: Alumno -> Int
edad (_,edad,_) = edad

materias :: Alumno -> Materias
materias (_,_,materias) = materias

sumanotas :: Alumno -> Float
sumanotas (_,_,materias) = (sum.map snd) materias 

--promedionotas :: Alumno -> Float
--promedionotas alumno = sumanotas alumno / fromIntegral (examenes alumno)

--notaMasAlta :: Alumno -> Float
--notaMasAlta (_,_,notas)= maximum notas

--notaMasBaja :: Alumno -> Float
--notaMasBaja (_,_,notas) = minimum notas 

--primeranota :: [Float] -> Float
--primeranota (x:xs) = x

--primeraNotaAlumno :: Alumno -> Float
--primeraNotaAlumno = primeranota.notas 