#include <iostream>
#include <stdlib.h>
using namespace std;

void Menu();
void Ingreso(int vot[], string nom[]) {
	int pos = 0;
	cout << "Ingrese los nombres de los 5 candidatos\n";
	for (int i = 0; i <= 4; i++) {
		cout << "Nombre del candidato " << i + 1 << ": "; cin >> nom[i];
	}
	system("cls");
	cout << "Nombres guardados!\n";
	cout << "\nIngrese un candidato para votar. Corte con 0:\n";
	cout << "[1]" << nom[0] << "\n[2]" << nom[1] << "\n[3]" << nom[2] << "\n[4]" << nom[3] << "\n[5]" << nom[4] << endl;
	cin >> pos;
	while (pos != 0) {
		vot[pos - 1] = vot[pos - 1] + 1;
		system("cls");
		cout << "\nIngrese un candidato para votar. Corte con 0:\n";
		cout << "[1]" << nom[0] << "\n[2]" << nom[1] << "\n[3]" << nom[2] << "\n[4]" << nom[3] << "\n[5]" << nom[4] << endl;
		cin >> pos;
	}
	system("cls");
}
void Informe_de_votos(int vot[],string nom[]) {
	cout << "Candidatos  |  Votos\n";
	for (int i = 0; i <= 4; i++) {
		cout << "    " << nom[i] << "           " << vot[i] << endl;
	}
}
void Ganador(int vot[], string nom[]) {
	int maxvotos = 0,pos=0;
	for (int i = 0; i <= 4; i++) {
		if ((i==0)||(vot[i]>maxvotos)) {
			pos = i;
			maxvotos = vot[i];
		}
	}
	cout << "El candidato ganador es " << nom[pos] << " con " << maxvotos << " votos!" << endl;
}
int main() {
	//Práctica de operaciones con arreglos (arreglo de contadores, arreglos como parametros de funcion) 
	/*Finalizada una votación se desean contar los votos que tuvo cada uno de los 5 candidatos
	Por cada uno de los sobres o votos se conoce únicamente el candidato elegido
	Informar al final el candidato ganador y la cantidad de votos que tuvo cada uno
	*/
	Menu();
	cout << "\nFin del programa\n\a";
	return 0;
}
void Menu() {
	int opc = 0, votos[5],ganador=0; string nombre[5];
	for (int i = 0; i <= 4; i++) {
		votos[i] = 0;
	}
	do {
		cout << "Ingrese una opcion:\n[1]Ingresar votos\n[2]Informar ganador de la elección\n[3]Informar votos de cada candidato\n[0]Salir del programa\n";
		cin >> opc;
		switch (opc) {
		case 1:
			system("cls");
			Ingreso(votos, nombre);
			break;
		case 2:
			system("cls");
			Ganador(votos, nombre);
			break;
		case 3:
			system("cls");
			Informe_de_votos(votos, nombre);
			break;
		}
	} while (opc != 0);
}
