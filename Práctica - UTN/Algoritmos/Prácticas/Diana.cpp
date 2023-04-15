#include <iostream>
#include <stdlib.h>
using namespace std;

struct repartidor {
	string nom;
	string ape;
	string dni;
	int zona;
};

int main() {
	int n = 0,zona[7],z=0; repartidor reg;
	for (int i = 0; i <= 6; i++) {
		zona[i] = 0;
	}
	cout << "Ingrese la cantidad de repartidores\n\n";
	cin >> n;
	for (int i = 0; i <= n-1; i++) {
		cout << "Ingrese el nombre del repartidor\n";
		cin >> reg.nom;
		cout << "Ingrese el apellido del repartidor\n";
		cin >> reg.ape;
		cout << "Ingrese el documento de identidad\n";
		cin >> reg.dni;
		cout << "Ingrese la zona donde trabaja el repartidor\n";
		cin >> reg.zona;
		if (reg.zona < 7) {
			z = reg.zona;
		}
		else {
			z = 7;
		}
		zona[z - 1] = zona[z - 1] + 1;
	}
	for (int i = 0; i <= 6; i++) {
		if (i < 6) {
			cout << "En la zona " << i + 1 << " hay " << zona[i] << " repartidores\n";
		}
		else {
			cout << "Hay " << zona[i] << " repartidores cuya zona es invalida\n";
		}
	}
	return 0;
}