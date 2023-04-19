#include <iostream>
#include <stdlib.h>
using namespace std;
void contador(int &n) {
	n++;
}
int Sumanovoid(int a, int b) {
	int sum=0;
	sum = (a + b);
	return sum;
}
void Ingreso() {
	int x = 0, y = 0;
	cout << "Este programa realiza la suma de dos números" << endl;
	cout << "Operando 1: "; cin >> x;
	cout << "Operando 2: "; cin >> y;
	system("cls");
	cout << "La suma de los dos valores es igual a " << Sumanovoid(x, y) << endl;
}
int main() {
	int opc = 0,c=0;
	do {
		cout << "Ingrese una opcion: \n[1]Sumar dos numeros\n[2]Ver contador de sumas\n[0]Salir del programa\n";
		cin >> opc;
		switch (opc) {
		case 1:
			system("cls");
			contador(c); 
			Ingreso();
			break;
		case 2:
			system("cls");
			cout << "El usuario ha hecho " << c << " sumas\n";
			break;
		case 0:
			system("cls");
			break;
		}
		//aqui
	} while (opc!=0);
	cout << "\nFin del programa\a";
	return 0;
}
