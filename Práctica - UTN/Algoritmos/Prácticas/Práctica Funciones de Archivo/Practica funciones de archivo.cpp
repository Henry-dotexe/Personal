#include <iostream>
#include <stdio.h>
#include <fstream>
#include <locale.h>
using namespace std;
struct Persona {
	char Nombre[30]="0";
	int edad=0;
};
void Menu_principal();
void Generar_archivo();
void Leer_archivo();
void Agregar_elemento();
void Eliminar_elemento();
void Buscar_edad();
bool Existe_elemento(FILE* f, int edad_buscada, string nom_buscado);
int main() {
	setlocale(LC_ALL, "spanish");
	Menu_principal();
	return 0;
}
void Menu_principal() {
	int opc = 0;
	do {
		cout << "~Menu principal~\n\n[1]Generar archivo\n[2]Leer archivo\n";
		cout << "[3]Agregar elemento\n[4]Eliminar elemento\n[5]Buscar por edad\n[0] Salir\n\n";
		cout << "Ingrese una opción: [ ]\b\b"; cin >> opc;
		switch (opc) {
		case 1:
			system("cls");
			Generar_archivo();
			break;
		case 2:
			system("cls");
			Leer_archivo();
			break;
		case 3:
			system("cls");
			Agregar_elemento();
			break;
		case 4:
			system("cls");
			Eliminar_elemento();
			break;
		case 5:
			system("cls");
			Buscar_edad();
			break;
		}
	} while (opc != 0);
	cout << "Gracias por utilizar el programa\n";
}
void Generar_archivo() {
	FILE* ArcPer = fopen("Personas.dat", "wb");
	Persona per; char c;
	cout << "Ingrese el nombre de una persona. Cortar con \".\"\nNombre: "; cin >> per.Nombre; c = per.Nombre[0];
	while (c!='.') { //while(per.Nombre[0]!='.')
		cout << "Edad: "; cin >> per.edad;
		fwrite(&per, sizeof(per), 1, ArcPer);
		system("cls");
		cout << "Ingrese el nombre de otra persona. Cortar con \".\"\nNombre: "; cin >> per.Nombre; c = per.Nombre[0];
	}
	fclose(ArcPer);
	system("cls");
	cout << "\nArchivo generado!\a\n";
}
void Leer_archivo() {
	FILE* ArcPer = fopen("Personas.dat", "rb");
	Persona per;
	if (ArcPer == NULL) {
		cout << "Archivo inexistente\n";
		return;
	}
	fseek(ArcPer, 0, SEEK_SET);
	fread(&per, sizeof(per), 1, ArcPer);
	while (!feof(ArcPer)) {
		if (per.edad!=-1) {
			cout << " " << per.Nombre << " - Edad: " << per.edad << "\n";
		}
		fread(&per, sizeof(per), 1, ArcPer);
	}
	fclose(ArcPer);
	cout << "\nFin de la lectura\n\n";
}
void Agregar_elemento() {
	FILE* ArcPer = fopen("Personas.dat", "rb+");
	Persona per; char c;
	fseek(ArcPer, 0, SEEK_END);
	cout << "Ingrese nuevos datos. Corte con \".\"\n";
	cout << "Nombre: "; cin >> per.Nombre; c = per.Nombre[0];
	while (c != '.') {
		cout << "Edad: "; cin >> per.edad;
		fwrite(&per, sizeof(per), 1, ArcPer);
		system("cls");
		cout << "Ingrese nuevos datos. Corte con \".\"\n";
		cout << "Nombre: "; cin >> per.Nombre; c = per.Nombre[0];
	}
	fclose(ArcPer);
	cout << "Fin de los nuevos ingresos\a\n";
}
void Eliminar_elemento() {
	char nom_busc[30]; Persona per; int ed_busc = 0; string r; //bool a;
	FILE* ArcPer = fopen("Personas.dat", "rb+");
	cout << "~Busqueda por nombre~\n\nIngresar el nombre que desee eliminar: "; cin >> nom_busc;
	r = nom_busc;
	//a = Existe_elemento(ArcPer, ed_busc, r);
	fseek(ArcPer, 0, SEEK_SET);
	if (Existe_elemento(ArcPer, ed_busc, r)) {
		fread(&per, sizeof(per), 1, ArcPer);
		while (per.Nombre != r) {
			fread(&per, sizeof(per), 1, ArcPer);
		}
		//aqui
		int pos = ftell(ArcPer) - sizeof(per);
		fseek(ArcPer, pos, SEEK_SET);//Reposiciono el puntero al registro que quiero borrar
		per.edad = (-1); //Asigno valor nulo en el campo edad del registro para que deje de mostrarse, pero sigue ocupando espacio en el archivo
		fwrite(&per, sizeof(per), 1, ArcPer);
		system("cls");
		cout << "La persona ha sido eliminada del archivo con éxito\n\n";
	}
	else {
		system("cls");
		cout << "\nNo existen personas con ese nombre en el archivo\n";
	}
	fclose(ArcPer);
}
void Buscar_edad() {
	FILE* ArcPer = fopen("Personas.dat", "rb+");
	Persona per; int edad_busc = 0; string nom_busc = ".";
	cout << "~Buscador por edades~\n\n";
	cout << "Ingrese la edad que desea buscar: "; cin >> edad_busc;
	if (Existe_elemento(ArcPer, edad_busc, nom_busc)) {
		fread(&per, sizeof(per), 1, ArcPer);
		system("cls");
		cout << "Se encontraron las siguientes personas\n";
		while (!feof(ArcPer)) {
			if (per.edad == edad_busc) {
				cout << " " << per.Nombre << " - Edad: " << per.edad << "\n";
			}
			fread(&per, sizeof(per), 1, ArcPer);
		}
	}
	else {
		system("cls");
		cout << "No existen personas con esa edad en el archivo\n";
	}
	fclose(ArcPer);
	cout << "\nFin de la busqueda\n\n";
}
bool Existe_elemento(FILE* f,int edad_buscada,string nom_buscado) {
	Persona reg;
	fseek(f, 0, SEEK_SET);
	fread(&reg, sizeof(reg), 1, f);
	if (edad_buscada != 0) {
		while (!feof(f)) {
			if (reg.edad == edad_buscada) { //Si hay al menos un elemento con la edad buscada retorna true
				cout << "\nEdad encontrada!\n";
				fseek(f, 0, SEEK_SET);
				return true;
			}
			fread(&reg, sizeof(reg), 1, f);
		}
		cout << "\nNo encontrado!\n";
		return false;
	}
	if (nom_buscado != ".") { //Si hay al menos un elemento con el nombre buscado retorna true
		while (!feof(f)) {
			if (nom_buscado==reg.Nombre) {
				cout << "\nNombre encontrado!\n";
				fseek(f, 0, SEEK_SET);
				return true;
			}
			fread(&reg, sizeof(reg), 1, f);
		}
		cout << "\nNo encontrado!\n";
		return false;
	}
}