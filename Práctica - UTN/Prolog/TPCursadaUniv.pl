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

%Predicados auxiliares del punto 3 
notaCursada(vero,Materia,Nota) :- materiaInicial(Materia),Nota is 8.
notaCursada(alan,sistemas_y_Organizaciones,6).
notaCursada(alan,analisis_Matematico_I,6).
notaCursada(alan,analisis_de_Sistemas,2).
notaCursada(alan,analisis_de_Sistemas,9).
notaCursada(alan,fisica_I,2).
notaFinal(vero,ingles_II,10).
notaFinal(alan,sistemas_y_Organizaciones,4).
notaFinal(alan,ingles_I,2).

%Predicados auxiliares punto 4
alumno(facu).
alumno(vero).
alumno(alan).
alumno(estudianteMuchasRecursadas).
alumno(estudiantePocasRecursadas).
alumno(estudianteATR).
alumno(veraniego).

%Punto 1, Materia pesada
materiaPesada(Materia) :- 
    materia(Materia,Horas),
    integradora(Materia),
    Horas=6.
materiaPesada(Materia) :- 
    materia(Materia,Horas),
    not(integradora(Materia)),
    Horas>=4.

%Punto 2, Correlativas
materiaInicial(Materia) :- 
    materia(Materia,_),
    not(correlativa(Materia,_)).

materiaNecesaria(Materia,MateriaNecesaria) :- 
    correlativa(Materia,MateriaNecesaria).
    
materiaNecesaria(Materia,MateriaNecesaria) :- 
    correlativa(Materia,CorrelativaInferior),
    materiaNecesaria(CorrelativaInferior,MateriaNecesaria).

materiaQueHabilita(Materia,MateriasHabilitadas) :- 
    materiaNecesaria(MateriasHabilitadas,Materia).

%Punto 3, los estudiantes, materias cursadas y aprobadas

materiaCursada(Alumno,Materia) :- 
    materiaAprobada(Alumno,Materia). %Una materia aprobada esta cursada pero si se aprobo por libre no esta cursada***

materiaCursada(Alumno,Materia) :- 
    notaCursada(Alumno,Materia,Nota),
    Nota>=6.

materiaAprobada(Alumno,Materia) :- 
    notaCursada(Alumno,Materia,Nota), 
    Nota>7. %Promocion

materiaAprobada(Alumno,Materia) :- 
    notaFinal(Alumno,Materia,Nota),
    Nota>=6. %Final aprobado

materiaAprobada(Alumno,Materia) :- 
    notaFinal(Alumno,Materia,Nota),
    libre(Materia),
    Nota>=6. %Aprobado por libre

%Punto 4

%Cursadas de estudiantes definidos anteriormente
cursada(vero,Materia,8,modalidad(anual,2017)):-materiaInicial(Materia).
cursada(alan,sistemas_y_Organizaciones,6,modalidad(anual,2016)).
cursada(alan,analisis_Matematico_I,6,modalidad(anual,2016)).
cursada(alan,analisis_de_Sistemas,2,modalidad(anual,2017)).
cursada(alan,analisis_de_Sistemas,9,modalidad(anual,2018)).
cursada(alan,fisica_I,2,modalidad(anual,2016)).

%Caso de prueba punto 4
cursada(facu,sistemas_y_Organizaciones,7,modalidad(anual,2015)).
cursada(facu,quimica,4,modalidad(cuatrimestral(1),2015)).
cursada(facu,quimica,6,modalidad(cuatrimestral(2),2015)).
cursada(facu,fisica_I,6,modalidad(verano,2016)).

%Caso de prueba punto 6-7
cursada(estudianteMuchasRecursadas,quimica,2,modalidad(anual,2016)).
cursada(estudianteMuchasRecursadas,quimica,3,modalidad(cuatrimestral(1),2017)).
cursada(estudianteMuchasRecursadas,quimica,4,modalidad(cuatrimestal(2),2017)).
cursada(estudianteMuchasRecursadas,quimica,5,modalidad(anual,2018)).
cursada(estudianteMuchasRecursadas,fisica_I,2,modalidad(verano,2018)).
cursada(estudianteMuchasRecursadas,fisica_I,2,modalidad(anual,2018)).

cursada(estudiantePocasRecursadas,quimica,2,modalidad(anual,2016)).
cursada(estudiantePocasRecursadas,quimica,3,modalidad(cuatrimestral(2),2017)).
cursada(estudiantePocasRecursadas,fisica_I,2,modalidad(anual,2017)).
cursada(estudiantePocasRecursadas,fisica_I,10,modalidad(cuatrimestral(1),2018)).

cursada(veraniego,quimica,6,modalidad(anual,2016)).
cursada(veraniego,fisica_I,6,modalidad(verano,2017)).
cursada(veraniego,matematica_Discreta,2,modalidad(anual,2017)).
cursada(veraniego,matematica_Discreta,8,modalidad(verano,2018)).

cursada(estudianteATR,quimica,10,modalidad(cuatrimestral(1),2016)).
cursada(estudianteATR,fisica_I,10,modalidad(cuatrimestal(2),2016)).

anioDeCursada(Alumno,Materia,Anio):-
    alumno(Alumno),
    cursada(Alumno,Materia,_,modalidad(Modo,Anio)),
    Modo\=verano.

anioDeCursada(Alumno,Materia,Anio):-
    alumno(Alumno),
    cursada(Alumno,Materia,_,modalidad(Modo,AnioVerano)),
    Modo = verano,
    Anio is AnioVerano-1.

%Punto 5. Recursada en años diferentes sin importar la modalidad
recursoMateria(Alumno,Materia):- 
    alumno(Alumno),
    anioDeCursada(Alumno,Materia,Anio1),
    anioDeCursada(Alumno,Materia,Anio2),
    Anio1<Anio2.

%Punto 5. Por si recurso en distintos cuatris del mismo año
recursoMateria(Alumno,Materia):- 
    alumno(Alumno),
    cursada(Alumno,Materia,_,modalidad(cuatrimestral(1),Anio)),
    cursada(Alumno,Materia,_,modalidad(cuatrimestral(2),Anio)).

%Punto 6. Perfiles de estudiante

%Aux. Recursada inmediata anual/verano/cuatrimestral de cursada en 2do cuatri
recursadaInmediata(Alumno,Materia):-
    alumno(Alumno),
    cursada(Alumno,Materia,_,modalidad(cuatrimestral(2),Anio1)),
    cursada(Alumno,Materia,_,modalidad(Modo,Anio2)),
    Anio2 is Anio1+1,
    Modo\=cuatrimetral(2).

%Aux Recursada inmediata anual/verano/cuatrimestral de cursada anual
recursadaInmediata(Alumno,Materia):-
    alumno(Alumno),
    cursada(Alumno,Materia,_,modalidad(anual,Anio1)),
    cursada(Alumno,Materia,_,modalidad(Modo,Anio2)),
    Modo\=cuatrimestral(2), %Corregir pq no funciona xd
    Anio2 is Anio1+1.

sinDescanso(Alumno):-
    alumno(Alumno),
    recursadaInmediata(Alumno,_).

invictus(Alumno):-
    alumno(Alumno),
    not(recursoMateria(Alumno,_)).

repechaje(Alumno):-
    alumno(Alumno),
    cursada(Alumno,Materia,Nota1,modalidad(anual,Anio1)),
    Nota1<6,
    cursada(Alumno,Materia,Nota2,modalidad(cuatrimestral(1),Anio2)),
    Nota2>7,
    Anio2 is Anio1+1.


