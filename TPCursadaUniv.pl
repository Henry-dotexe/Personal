%Materia(Nombre,Horas,[Correlativas]),Integradora(Materia)
%1.MateriaPesada si es integradora de 6 horas por semana 
%o si no es integradora y tiene al menos 4 horas semanales
%2a.MateriaInicial si no tiene correlativa inferior
%2b.MateriasParaCursar, Muestra todas las materias que se deben
%cursar para poder cursar una materia específica
%2c.MateriasQueHabilita, muestra las correlativas de una materia

materia(analisis_Matematico_I,5,[]).
materia(algebra_y_Geometria_Analitica,5,[]).
materia(matematica_Discreta,3,[]).
materia(sistemas_y_Organizaciones,3,[]).
materia(algoritmos_y_Estructuras_de_Datos,5,[]).
materia(arquitectura_de_Computadoras,4,[]).
materia(ingenieria_y_Sociedad,2,[]).
materia(quimica,3,[]).
materia(fisica_I,5,[]).
materia(analisis_Matematico_II,5,[analisis_Matematico_I,algebra_y_Geometria_Analitica]).
materia(probabilidad_y_Estadistica,3,[analisis_Matematico_I,algebra_y_Geometria_Analitica]).
materia(analisis_de_Sistemas,6,[sistemas_y_Organizaciones,algoritmos_y_Estructuras_de_Datos]).
materia(sintaxis_y_Semantica_de_los_Lenguajes,4,[algoritmos_y_Estructuras_de_Datos,matematica_Discreta]).
materia(paradigmas_de_Programacion,4,[algoritmos_y_Estructuras_de_Datos,matematica_Discreta]).
materia(ingles_I,2,[]).
materia(sistemas_de_Representacion,3,[]).
materia(sistemas_Operativos,4,[matematica_Discreta,algoritmos_y_Estructuras_de_Datos,arquitectura_de_Computadoras]).
materia(disenio_de_Sistemas,6,[analisis_de_Sistemas,paradigmas_de_Programacion]).
materia(fisica_II,5,[analisis_Matematico_I,fisica_I]).
materia(matematica_Superior,4,[analisis_Matematico_II]).
materia(gestion_de_Datos,4,[analisis_de_Sistemas,paradigmas_de_Programacion,sintaxis_y_Semantica_de_los_Lenguajes]).
materia(legislacion,2,[analisis_de_Sistemas,ingenieria_y_Sociedad]).
materia(economia,3,[analisis_de_Sistemas]).
materia(ingles_II,2,[ingles_I]).
materia(redes_de_Informacion,4,[sistemas_Operativos,comunicaciones]).
materia(administracion_de_Recursos,6,[disenio_de_Sistemas,sistemas_Operativos,economia]).
materia(investigacion_Operativa,5,[probabilidad_y_Estadistica,matematica_Superior]).
materia(simulacion,4,[probabilidad_y_Estadistica,matematica_Superior]).
materia(ingenieria_de_Software,3,[probabilidad_y_Estadistica,disenio_de_Sistemas,gestion_de_Datos]).
materia(teoria_de_Control,3,[quimica,matematica_Superior]).
materia(comunicaciones,4,[arquitectura_de_Computadoras,analisis_Matematico_II,fisica_II]).
materia(proyecto_Final,6,[legislacion,administracion_de_Recursos,redes_de_Informacion,ingenieria_de_Software]).
materia(inteligencia_Artificial,3,[investigacion_Operativa,simulacion]).
materia(administracion_Gerencial,3,[administracion_de_Recursos,investigacion_Operativa]).
materia(sistemas_de_Gestion,4,[administracion_de_Recursos,investigacion_Operativa,simulacion]).
libre(ingles_I).
libre(ingles_II).