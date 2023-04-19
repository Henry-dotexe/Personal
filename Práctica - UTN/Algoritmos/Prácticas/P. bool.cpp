#include <iostream>
#include <stdlib.h>
using namespace std;
void reg_evento() {
	bool a = false; int n = 0;
	for (int i = 0; i <= 10; i++) {
		cout << "Ingrese un numero\n\n";
		cin >> n;
		if (n < 0) {
			a = true;
		}
		system("cls");
	}
	if (a == true) {
		cout << "El usuario ingreso al menos un valor negativo\n";
	}
	else {
		cout << "El usuario no ingreso ningun numero negativo\n";
	}
}
void maxmin() {
	bool a = false; int n = 0, max = 0;
	for (int i = 0; i <= 10; i++) {
		cout << "Ingrese un numero\n\n";
		cin >> n;
		if ((n>max) || (a == false)) {
			max = n;
			a = true;
		}
		system("cls");
	}
	cout << "El mayor de los numeros ingresados es" << max << endl;
}
int main() {
	//Variables booleanas: Reciben valores de true o false unicamente, y se utilizan para condiciones y registrar eventos.
	//reg_evento();
	//maxmin();
	return 0;
}