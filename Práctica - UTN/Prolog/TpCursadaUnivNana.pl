%Base de Conocimientos

%materia(nombre,horas)
materia(analisis_Matematico_I,5).
materia(algebra_y_Geometria_Analitica,5).
materia(matematica_Discreta,3).
materia(sistemas_y_Organizaciones,3).
materia(algoritmos_y_Estructuras_de_Datos,5).
materia(arquitectura_de_Computadoras,4).
materia(ingenieria_y_Sociedad,2).
materia(quimica,3).
materia(fisica_I,5).
materia(analisis_Matematico_II,5).
materia(probabilidad_y_Estadistica,3).
materia(analisis_de_Sistemas,6).
materia(sintaxis_y_Semantica_de_los_Lenguajes,4).
materia(paradigmas_de_Programacion,4).
materia(ingles_I,2).
materia(sistemas_de_Representacion,3).
materia(sistemas_Operativos,4).
materia(disenio_de_Sistemas,6).
materia(fisica_II,5).
materia(matematica_Superior,4).
materia(gestion_de_Datos,4).
materia(legislacion,2).
materia(economia,3).
materia(ingles_II,2).
materia(redes_de_Informacion,4).
materia(administracion_de_Recursos,6).
materia(investigacion_Operativa,5).
materia(simulacion,4).
materia(ingenieria_de_Software,3).
materia(teoria_de_Control,3).
materia(comunicaciones,4).
materia(proyecto_Final,6).
materia(inteligencia_Artificial,3).
materia(administracion_Gerencial,3).
materia(sistemas_de_Gestion,4).

%correlativa(correlativa superior,correlativa inferior)
correlativa(analisis_de_Sistemas,sistemas_y_Organizaciones).
correlativa(analisis_de_Sistemas,algoritmos_y_Estructuras_de_Datos).
correlativa(analisis_Matematico_II,analisis_Matematico_I).
correlativa(analisis_Matematico_II,algebra_y_Geometria_Analitica).
correlativa(sintaxis_y_Semantica_de_los_Lenguajes,algoritmos_y_Estructuras_de_Datos).
correlativa(sintaxis_y_Semantica_de_los_Lenguajes,matematica_Discreta).
correlativa(paradigmas_de_Programacion,matematica_Discreta).
correlativa(paradigmas_de_Programacion,algoritmos_y_Estructuras_de_Datos).
correlativa(probabilidad_y_Estadistica,analisis_Matematico_I).
correlativa(probabilidad_y_Estadistica,algebra_y_Geometria_Analitica).
correlativa(disenio_de_Sistemas,analisis_de_Sistemas).
correlativa(disenio_de_Sistemas,paradigmas_de_Programacion).
correlativa(sistemas_Operativos,matematica_Discreta).
correlativa(sistemas_Operativos,algoritmos_y_Estructuras_de_Datos).
correlativa(sistemas_Operativos,arquitectura_de_Computadoras).
correlativa(fisica_II,analisis_Matematico_I).
correlativa(fisica_II,fisica_I).
correlativa(economia,analisis_de_Sistemas).
correlativa(gestion_de_Datos,analisis_de_Sistemas).
correlativa(gestion_de_Datos,paradigmas_de_Programacion).
correlativa(gestion_de_Datos,sintaxis_y_Semantica_de_los_Lenguajes).
correlativa(ingles_II,ingles_I).
correlativa(matematica_Superior,analisis_Matematico_II).
correlativa(legislacion,analisis_de_Sistemas).
correlativa(legislacion,ingenieria_y_Sociedad).
correlativa(administracion_de_Recursos,disenio_de_Sistemas).
correlativa(administracion_de_Recursos,sistemas_Operativos).
correlativa(administracion_de_Recursos,economia).
correlativa(ingenieria_de_Software,probabilidad_y_Estadistica).
correlativa(ingenieria_de_Software,disenio_de_Sistemas).
correlativa(ingenieria_de_Software,gestion_de_Datos).
correlativa(teoria_de_Control,quimica).
correlativa(teoria_de_Control,matematica_Superior).
correlativa(comunicaciones,arquitectura_de_Computadoras).
correlativa(comunicaciones,analisis_Matematico_II).
correlativa(comunicaciones,fisica_II).
correlativa(redes_de_Informacion,sistemas_Operativos).
correlativa(redes_de_Informacion,comunicaciones).
correlativa(investigacion_Operativa,probabilidad_y_Estadistica).
correlativa(investigacion_Operativa,matematica_Superior).
correlativa(simulacion,probabilidad_y_Estadistica).
correlativa(simulacion,matematica_Superior).
correlativa(inteligencia_Artificial,investigacion_Operativa).
correlativa(inteligencia_Artificial,simulacion).
correlativa(administracion_Gerencial,administracion_de_Recursos).
correlativa(administracion_Gerencial,investigacion_Operativa).
correlativa(sistemas_de_Gestion,administracion_de_Recursos).
correlativa(sistemas_de_Gestion,investigacion_Operativa).
correlativa(sistemas_de_Gestion,simulacion).
correlativa(proyecto_Final,legislacion).
correlativa(proyecto_Final,administracion_de_Recursos).
correlativa(proyecto_Final,redes_de_Informacion).
correlativa(proyecto_Final,ingenieria_de_Software).

%libre(nombre)
libre(ingles_I).
libre(ingles_II).

%integradora(nombre)
integradora(sistemas_y_Organizaciones).
integradora(analisis_de_Sistemas).
integradora(disenio_de_Sistemas).
integradora(administracion_de_Recursos).
integradora(proyecto_Final).

%notaCursada
notaCursada(alan,sistemas_y_Organizaciones,6).
notaCursada(alan,analisis_Matematico_I,6).
notaCursada(alan,analisis_de_Sistemas,2).
notaCursada(alan,analisis_de_Sistemas,9).
notaCursada(alan,fisica_I,2).


notaFinal(vero,ingles_II,10).
notaFinal(alan,sistemas_y_Organizaciones,4).
notaFinal(alan,ingles_I,2).

%Punto 1
materiaPesada(Materia) :- materia(Materia,Horas),integradora(Materia),Horas is 6.
materiaPesada(Materia) :- materia(Materia,Horas),not(integradora(Materia)),Horas=<4.

%Punto 2
materiaInicial(Materia) :- materia(Materia,_), not(correlativa(Materia,_)).

materiaNecesaria(Materia,MateriaNecesaria) :- 
    correlativa(Materia,MateriaNecesaria).

materiaNecesaria(Materia,MateriaNecesaria) :- 
    correlativa(Materia,CorrelativaInferior),
    materiaNecesaria(CorrelativaInferior,MateriaNecesaria).