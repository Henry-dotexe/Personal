#include <iostream>
#include <stdlib.h>
using namespace std;
void ingreso_datos(int vec[],int &top);
void mostrar_vector(int vec[], int top);
void menu_ordenar(int vec[], int& top);
void ordenar_mayor_a_menor(int vec[], int& top);
void ordenar_menor_a_mayor(int vec[], int& top);
int main(){
  //El objetivo de este proyecto es lograr ordenamientos en un vector con diferentes metodos.
	int num[100],tope=0; char p,p1;
	ingreso_datos(num,tope);
	system("cls");
	mostrar_vector(num, tope);
	do {
		cout << "Desea ordenar los valores del vector? [S/N]\n";
		cin >> p;
		if (p == 'S') {
			system("cls");
			menu_ordenar(num,tope);
			mostrar_vector(num,tope);
		}
		else {
			cout << "\nDesea ingresar nuevos valores al vector? [S/N]\n";
			cin >> p1;
			if (p1 == 'S') {
				system("cls");
				ingreso_datos(num,tope);
				p = 'S';
			}
		}
	} while (p!='N');

	cout << "\nGracias por utilizar el programa!\n\a";
	return 0;
}

void ingreso_datos(int vec[],int &top) {
	for (int i = 0; i <= 99; i++) {
		vec[i] = 0;
	}
	int x = 0;
	cout << "Ingrese los datos de cada casilla del vector. Corte con 0\n"; cout << "Casilla " << x+1 << ": "; cin >> vec[x];
	while (vec[x]!=0) {
		x++;
		cout << "Casilla " << x + 1 << ": "; cin >> vec[x];
	}
	top = x-1;
}
void menu_ordenar(int vec[],int& top) {
	int opc = 0;
	do {
		cout << "Como desea ordenar los valores del vector?\n\n";
		cout << "[1]Ordenar de mayor a menor\n[2]Ordenar de menor a mayor\n[0]Salir del menu\n\nIngrese una opcion [ ]\b\b";
		cin >> opc;
		switch (opc) {
		case 1:
			system("cls");
			ordenar_mayor_a_menor(vec, top);
			break;
		case 2:
			system("cls");
			ordenar_menor_a_mayor(vec,top);
			break;
		}
	} while (opc != 0);
	system("cls");
}
void ordenar_mayor_a_menor(int vec[],int& top) {
	int aux=0,pos=0;
	for (int i = 0; i <= top; i++) {
		for (int j = 0; j <= top; j++) {
			if (vec[j]<vec[j+1]) {
				aux = vec[j];
				vec[j] = vec[j + 1];
				vec[j + 1] = aux;
			}
		}
	}
	cout << "Los datos del arreglo fueron ordenar satisfactoriamente!\n\n";
}
void ordenar_menor_a_mayor(int vec[],int& top) {
	int aux = 0;
	for (int i = 0; i <= top; i++) {
		for (int j = 0; j <= top-1; j++) {
			if (vec[j] > vec[j + 1]) {
				aux = vec[j];
				vec[j] = vec[j + 1];
				vec[j + 1] = aux;
			}
		}
	}
	cout << "Los datos del arreglo fueron ordenar satisfactoriamente!\n\n";
}
void mostrar_vector(int vec[], int top) {
	cout << "\n===========\n";
	cout << "|Pos| Num |\n";
	cout << "===========\n";
	for (int i = 0; i <= top; i++) {
		cout << "| " << i + 1 << " |  " << vec[i] << "  |\n";
	}
	cout << "===========\n\n";
}