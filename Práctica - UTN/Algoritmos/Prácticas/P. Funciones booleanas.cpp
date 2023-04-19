#include <iostream>
#include <stdlib.h>
using namespace std;
bool Existe_negativo(int ar[]);
bool Existe_positivo(int ar[]);
bool Existe_nulo(int ar[]);
bool Cumple_condicion(int ar[]);
int main() {
	//Testeo de funciones booleanas, sus prototipos y condiciones de if invocándolas
	int vec[5];
	for (int x = 0; x <= 4; x++) {
		vec[x] = 0;
	}//Inicializo el vector en 0
	cout << "Por favor ingresar un valor en cada casilla del vector\n\n============\n";
	for (int x = 0; x <= 4; x++) {
		cout << "|Casilla " << x + 1 << " | <== "; cin >> vec[x];
		cout << "============\n";
	}
	//Hago una serie de funciones booleanas para saber una serie de propiedades de los valores en las 5 casillas

	if (Existe_negativo(vec)) {
		cout << "\nEl vector tiene al menos un valor negativo\n";
	}
	if (!Existe_negativo(vec)) {
		cout << "\nEl vector no tiene ningun valor negativo\n";
	}

	if (Existe_positivo(vec)) {
		cout << "\nEl vector tiene al menos un valor positivo\n";
	}
	else {
		cout << "\nEl vector no tiene ningun valor positivo\n";
	}

	if (Existe_nulo(vec)) {
		cout << "\nEl vector tiene al menos un valor nulo\n";
	}
	else {
		cout << "\nEl vector no tiene ningun valor nulo\n";
	}

	if (Cumple_condicion(vec)) {
		cout << "\nEl vector cumple la condicion impuesta\n";
	}
	else {
		cout << "\nEl vector no cumple la condicion impuesta\n";
	}

	cout << "\nGracias por usar el programa!\a\n";
	return 0;
}
bool Existe_negativo(int ar[]) {
	//Chequeo si hay al menos un valor negativo en el arreglo
	for (int x = 0; x <= 4; x++) {
		if (ar[x]<0) {
			return true;
		}
	}
	return false;
}
bool Existe_positivo(int ar[]) {
	//Chequeo si existe al menos un valor positivo en el arreglo
	for (int x = 0; x <= 4; x++) {
		if (ar[x] > 0) {
			return true;
		}
	}
	return false;
}
bool Existe_nulo(int ar[]) {
	//Chequeo si existe al menos un número nulo
	for (int x = 0; x <= 4; x++) {
		if (ar[x] == 0) {
			return true;
		}
	}
	return false;
}
bool Cumple_condicion(int ar[]) {
	//Chequeo que los valores del arreglo cumplan una condición, que en este caso es, que la suma de todos los valores del vector sea mayor a 20
	int sum = 0;
	for (int x = 0; x <= 4; x++) {
		sum = sum + ar[x];
	}
	if (sum >= 20) {
		return true;
	}
	else {
		return false;
	}
}