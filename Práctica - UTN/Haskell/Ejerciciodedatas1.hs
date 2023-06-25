
import Text.Show.Functions

data Alumno = Alumno {
    nombre :: String,
    fechaDeNacimiento :: (Int,Int,Int),
    legajo :: Int,
    materiasQueCursa :: [String],
    criterioParaEstudiar :: CriterioEstudio
} deriving (Show)

data Parcial = Parcial {
    materia :: String,
    cantidadDePreguntas :: Int
} deriving (Show)



--Modelar un Parcial


--Modelar tipo de criterio de estudio

type CriterioEstudio = Parcial -> Bool

--Modelar un alumno genérico
diana :: Alumno
diana = Alumno {
    nombre = "Diana",
    fechaDeNacimiento = (05,08,2001),
    legajo = 1777828,
    materiasQueCursa = ["Sintaxis","Paradigmas","Analisis Matematico"],
    criterioParaEstudiar = cabuleros
}

--Representar los criterios de estudio enunciados

--a) El estududioso que siempre estudia (no importa el parcial)

estudiosos :: CriterioEstudio
estudiosos _ = True --preguntar por el _

--b) El hijo del rigor, al que le podemos configurar la cantidad de preguntas por sobre las cuales comienza a estudiar

hijosDelRigor :: Int -> CriterioEstudio
hijosDelRigor n parcial= cantidadDePreguntas parcial > n

--c) El cabulero que depende de que la materia tenga una cantidad impar de letras 

cabuleros :: CriterioEstudio
cabuleros  = odd.length.materia 

--Modelar a Nico, un alumno estudioso

nico :: Alumno
nico = Alumno {
    nombre = "Nico",
    fechaDeNacimiento = (06,07,1998),
    legajo = 5778763,
    materiasQueCursa = ["Sintaxis","Paradigmas"],
    criterioParaEstudiar = hijosDelRigor 5
}

--Nico pasa de estudioso a hijo del rigor
cambiarCriterioEstudio :: CriterioEstudio -> Alumno -> Alumno
cambiarCriterioEstudio nuevoCriterio alumno = alumno{criterioParaEstudiar=nuevoCriterio} 
 
 --Determinar si Nico va a estudiar para el parcial de Paradigmas
estudiaParaParcial :: Alumno -> Parcial -> Bool
estudiaParaParcial alumno  = (criterioParaEstudiar alumno)

paradigmas :: Parcial
paradigmas = Parcial {
    materia = "paradigmas",
    cantidadDePreguntas = 5
} 