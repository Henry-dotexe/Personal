alumnoIng(henry).
alumnoIng(diana).
alumnoArte(fulanito).
materia(matematica).
materia(pintura).
cursaMateria(Alguien,matematica) :- alumnoIng(Alguien).
cursaMateria(Alguien,pintura) :- alumnoArte(Alguien).