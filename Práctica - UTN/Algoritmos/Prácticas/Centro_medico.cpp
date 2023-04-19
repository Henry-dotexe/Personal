#include <iostream>
#include <stdlib.h>
#include <locale.h>
using namespace std;
struct paciente {
	int leg;
	string AN;
	int NR;
};
struct nodo {
	nodo* ant;
	paciente info;
	nodo* sgte;
};
void pre_ingresar(nodo*& lista);
void pre_ingresar_del(nodo*& lista);
void ingresar_delante(nodo*& lista, paciente reg);
void ingresarpaciente(nodo* &lista,paciente reg);
void pre_ubicar(nodo* &lista);
nodo* ubicarpaciente(nodo* lista,int leg_busc);
int main() {
	setlocale(LC_ALL, "spanish");
	int opc = 0; nodo* listapac=NULL;
	do {
		cout << "\tMenú Principal\n\n[1]Ingresar nuevo paciente\n[2]Ingresar paciente delante\n[3]Ubicar paciente\n[4]Salir\nIngrese una opción [ ]\b\b";
		cin >> opc;
		system("cls");
		switch (opc) {
		case 1:
			pre_ingresar(listapac);
			break;
		case 2:
			//Esta opcion existe aunque no esté en la consigna porque se supone que se busca el paciente recibiendo un puntero que no tiene que estar al comienzo de la lista
			//Por lo que esta opcion permite ingresar nodos delante del primero sin mover el puntero lista, solo para probar que la busqueda funcione en ambos sentidos
			pre_ingresar_del(listapac); 
			break;
		case 3:
			pre_ubicar(listapac);
			break;
		}
	} while (opc != 4);
	cout << "Fin del programa!\n";
	return 0;
}
void pre_ingresar(nodo*& lista) {
	paciente pac;
	cout << "Ingrese los datos del paciente que desea ingresar:\n\n";
	cout << "Nombre y apellido: "; cin >> pac.AN;
	cout << "Número de registro: "; cin >> pac.NR;
	cout << "Número de legajo: "; cin >> pac.leg;
	ingresarpaciente(lista, pac);
}
void ingresarpaciente(nodo* &lista,paciente reg) {
	nodo* ind = lista,*aux = new nodo();
	aux->info = reg;
	if (ind==NULL) {
		aux->ant = NULL;
		aux->sgte = NULL;
		lista = aux;
		cout << "Paciente agregado a la lista!\n\n";
		return;
	}
	else {
		while (ind->sgte!=NULL) {
			ind = ind->sgte;
		}
		ind->sgte = aux;
		aux->ant = ind;
		aux->sgte = NULL;
	}
	cout << "Paciente agregado a la lista!\n\n";
}
void pre_ingresar_del(nodo*& lista) {
	paciente pac;
	cout << "Ingrese los datos del paciente que desea ingresar:\n\n";
	cout << "Nombre y apellido: "; cin >> pac.AN;
	cout << "Número de registro: "; cin >> pac.NR;
	cout << "Número de legajo: "; cin >> pac.leg;
	ingresar_delante(lista, pac);
}
void ingresar_delante(nodo*& lista, paciente reg) {
	nodo* aux = new nodo();
	aux->info = reg;
	aux->ant = NULL;
	aux->sgte = lista;
	lista->ant=aux;
	cout << "Paciente ingresado delante!\n\n";
}
void pre_ubicar(nodo* &lista) {
	int l = 0; 
	cout << "Ingrese el legajo del paciente que desea ubicar en la lista\n";
	cin >> l;
	nodo *pac = ubicarpaciente(lista, l);
	if (pac == NULL) {
		paciente nuevo;
		cout << "No se ha encontrado el paciente en el listado. Por favor ingrese sus datos:\n\n";
		cout << "Nombre y apellido: "; cin >> nuevo.AN;
		cout << "Número de registro: "; cin >> nuevo.NR;
		ingresarpaciente(lista,nuevo);
	}
	else {
		system("cls");
		cout << "~Datos del paciente~\n\nNombre y apellido: "<<pac->info.AN<<"\nNúmero de registro en base de datos: "<<pac->info.NR<<"\n\n";
	}
}
nodo* ubicarpaciente(nodo* lista, int leg_busc) { //Esta funcion retorna la dirección al nodo del paciente si lo encuentra, y si no retorna NULL
	nodo* aux = lista;
	if (aux->info.leg != leg_busc) {//Si el legajo del nodo al que apunta aux es distinto del legajo buscado
		while (aux!=NULL) {
			if (aux->info.leg == leg_busc) { //Si hay coincidencia retorna el nodo completo
				return aux;
			}
			else {
				aux = aux->sgte; //Avanzamos hacia adelante con aux
				if (aux == NULL) { //Cuando aux llegue a NULL por no encontrar el paciente, entrará a este if antes de salir del while grande
					aux = lista; //Reestablecemos el auxiliar al nodo en el que inició la busqueda
					while (aux != NULL) {
						if (aux->info.leg == leg_busc) {
							return aux;
						}
						else {
							aux = aux->ant; //"Avanzamos" hacia el nodo anterior en busca del paciente
						}
					}
				}
			}
		}
		return aux;
	}
	else {
		return aux;
	}
}