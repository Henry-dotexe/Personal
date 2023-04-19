#include <iostream>
#include <stdlib.h>
using namespace std;

struct Alum {
	string nom;
	string mat;
	int nota;
};

int main() {
	Alum est[5];Alum estmax; int notamax = 0, pos = 0; bool a = false; string nomax;
	cout << "Ingrese los datos de los alumnos\n\n";
	//Ingreso de datos
	for (int i = 0; i <= 4; i++) {
		cout << "Nombre: "; cin >> est[i].nom;
		cout << "Cod. de materia: "; cin >> est[i].mat;
		cout << "Nota: "; cin >> est[i].nota;
		//proceso
		system("cls");
	}
	//Procesos
	for (int i = 0; i <= 4; i++) {
		if ((a==false) || (est[i].nota>notamax)) {
			notamax = est[i].nota;
			nomax = est[i].nom;
			//1.estmax=est[i];
			//2.pos = i;
			a = true;
		}
	}
	//Informe
	cout << "El alumno con la nota máxima fue " << nomax << " con una nota de " << notamax << endl;
	//1.cout << "El alumno con la nota máxima fue " << estmax.nom << " con una nota de " << estmax.nota << endl;
	//2.cout << "El alumno con la nota máxima fue " << est[pos].nom << " con una nota de " << est[pos].nota << endl;

	return 0;
}