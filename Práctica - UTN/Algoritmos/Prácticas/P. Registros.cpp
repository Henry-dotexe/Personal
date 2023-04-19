#include <iostream>
#include <stdlib.h>
using namespace std;

struct alumno { //Defino una estructura de datos (Registro) con estos tres campos dentro
	string nom;
	int dni;
	int nota;
};
void ingreso(alumno reg);
int main() {
	//Este programa guarda datos en un registro y luego los muestra por pantalla, pisandose cada vez que se agregan datos nuevos
	alumno alum;//Si definí un registro o struct antes, ahora puedo definir una variable de tipo ESE registro 
	//(Es decir, en lugar de ser una variable normal, es una variable que tiene esa estructura que definimos arriba adentro, con sus tres campos)
	int opc = 0;
	cout << "Desea ingresar datos? Si[1], No[0]\n";
	cin >> opc;
	while (opc!=0) {
		ingreso(alum);//Llamo a la funcion ingreso para darle valores a los campos del registro
		cout << "Desea ingresar mas datos? Si[1], No[0]\n";
		cin >> opc;
	}
	cout << "Gracias por utilizar el programa\n\a";
	return 0;
}
void ingreso(alumno reg) {
	cout << "Ingrese datos del alumno\n\n";
	cout << "Nombre: "; cin >> reg.nom;//Guardo el nombre en el campo nom del registro
	cout << "DNI: "; cin >> reg.dni;//Igual que arriba, guardo el documento en el campo dni del registro
	cout << "Nota: "; cin >> reg.nota;//Lo mismo con el campo nota
	//Ahora puedo operar con los datos del mismo registro "accediendo" a sus campos individualmente, por ejemplo, para mostrarlos en pantalla

	cout << "El alumno se llama " << reg.nom << ". DNI nro: " << reg.dni << "\nLa nota del alumno es " << reg.nota << endl;
	if (reg.nota >= 6) {
		cout << "El alumno aprobo la materia" << endl;
	}
	else {
		cout << "El alumno no aprobo la materia" << endl << endl;
	}
}