#include <iostream>
#include <stdlib.h>
#include <string>
using namespace std;
void Arreglo1D();
void Arreglo2D();
void contador(int& c);
int main() {
	//Este programa muestra como usar arreglos de 1 y 2 dimensiones, con un ejemplo de 5 alumnos de los cuales sabremos la nota y si aprobaron o desaprobaron
	int opc = 0;
	do {
		cout << "Ingrese una opcion:\n[1]Arreglos de una dimension\n[2]Arreglos de 2 dimensiones\n[0]Salir del programa\n";
		cin >> opc;
		switch (opc) {
		case 1:
			system("cls");
			Arreglo1D();
			break;
		case 2:
			system("cls");
			Arreglo2D();
			break;
		}
	} while (opc!=0);

	cout << "\nFin del programa\n\a";
	return 0;
}
void contador(int& c) {
	c++;
}
void Arreglo1D() {
	int notas[10]; string nombre[10];//Defino dos arreglos paralelos para almacenar los dos datos de cada alumno
	for (int i = 0; i <= 9; i++) { //Para inicializar todo el arreglo a 0
		notas[i] = 0;
	}
	cout << "Ingrese los nombres y notas de los 10 alumnos\n";
	for (int i = 0; i <= 9; i++) { //con la variable i voy cambiando la posicion donde guardo los datos
		cout << "Nombre del alumno " << i + 1 << ": "; cin >> nombre[i];
		cout << "Nota: "; cin >> notas[i];
	}
	system("cls");//Limpio la consola
	cout << "\nLos alumnos con notas mayores a 6 son:\n";
	for (int i = 0; i <= 9; i++) {
		if (notas[i] >= 6) { //Si el contenido de la posición i en cualquiera de los ciclos cumple la condicion entonces...
			cout << "Nombre: " << nombre[i] << endl;
			cout << "Nota: " << notas[i] << endl << endl;
		}
	}
}
void Arreglo2D() {
	//Esto es un poco más complicado. Defino un arreglo de dos dimensiones, que asemeja a una tabla de 5x2 (5 alumnos y 2 aulas)
	int notas[5][2],desap1=0,desap2=0;
	for (int i = 0; i <= 4; i++) { //doble for para inicializar todo el arreglo a 0 (Un for para columnas y otro para filas)
		for (int j = 0; j <= 1; j++) {
			notas[i][j] = 0;
		}
	}
	
	for (int i = 0; i <= 1; i++) { //1er for para cambiar el aula (columna)
		cout << "Ingrese las notas de los alumnos del aula "<<i+1<<":\n";
		for (int j = 0; j <= 4; j++) {//2do for para cambiar el alumno (fila)
			cin >> notas[j][i];
		}
	}
	for (int i = 0; i <= 1; i++) {  //1er for para cambiar el aula
		for (int j = 0; j <= 4; j++) { //2do for para cambiar el alumno

			if ( (i==0) && (notas[j][0] < 6) ) { //Si i=0 (aula 1) y la nota del alumno es <6 entonces...
				contador(desap1); //Cuento un desaprobado en el aula 1
			}

			if ( (i==1) && (notas[j][1]<6) ) { //Si i=1 (aula 2) y la nota del alumno es <6 entonces...
				contador(desap2);//Cuento un desaprobado en el aula 2
			}
		}
	}
	system("cls");
	cout << "\nEn el aula 1 hubo " << desap1 << " alumnos desaprobados\n";
	cout << "En el aula 2 hubo " << desap2 << " alumnos desaprobados\n";
}