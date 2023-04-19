#include <iostream>
#include <stdlib.h>
#include <locale.h>
using namespace std;

struct Prod {
	string codp;
	float pu;
	float totf;
	int tuv;
};
struct Venta {
	string codp;
	int cantv;
};
struct Nodo {
	Prod info;
	Nodo* sgte;
};
void inserta_ordenado(Nodo*& lista, Prod reg);
void inserta_final(Nodo*& lista, Prod reg);
void eliminar_primero(Nodo*& lista, Prod& reg);
void acumular_fact_prod(Nodo*& lista, string codp, int cantv);
void mostrar_lista(Nodo* lista);
void ordenar_listado(Nodo*& lista);
int main() {
	//acumular_fact_prod recibe un codp para buscar un producto en la lista y agregarle darle de una venta
	setlocale(LC_ALL, "spanish"); //Pongo la consola en español
	int opc = 0; Nodo* listaprod = NULL; int venta = 0; string codigo; Prod reg;
	do {
		cout << "~Menú principal~\n\n[1]Ingresar datos de una venta\n[2]Ingresar datos de producto\n[3]Reordenar e imprimir listado de productos\n[0]Salir\n\nIngrese una opción [ ]\b\b";
		cin >> opc;
		system("cls");
		switch(opc) {
		case 1:
			cout << "Ingrese los datos de la venta\n";
			cout << "Codigo de producto: "; cin >> codigo;
			cout << "Cantidad vendida: "; cin >> venta;
			acumular_fact_prod(listaprod, codigo, venta);
			break;
		case 2:
			cout << "Ingrese los datos del producto para insertarlo en la lista\n";
			cout << "Codigo de producto: "; cin >> reg.codp;
			cout << "Precio unitario: "; cin >> reg.pu;
			reg.tuv = 0; reg.totf = 0;
			inserta_final(listaprod, reg);
			break;
		case 3:
			ordenar_listado(listaprod);
			mostrar_lista(listaprod);
			break;
		}
	} while (opc != 0);
	cout << "Gracias por utilizar el programa!\n";
	return 0;
}
void inserta_ordenado(Nodo*& lista, Prod reg) {
	Nodo* ind=lista,*ant=NULL,*nuevo = new Nodo(); //Indice hace de puntero lista, ant hace de puntero al nodo anterior a indice, y nuevo es un puntero al nuevo nodo a insertar
	nuevo->info = reg;
	if ((lista == NULL)||(reg.tuv<ind->info.tuv)) {
		nuevo->sgte = lista;
		lista = nuevo;
	}
	else {
		while ((ind!=NULL)&&(ind->info.tuv<reg.tuv)) {
			ant = ind;
			ind = ind->sgte;
		}
		nuevo->sgte = ind;
		ant->sgte = nuevo;
	}
}
void eliminar_primero(Nodo*& lista, Prod& reg) {
	Nodo* aux = lista;
	lista = lista->sgte; //avanzamos el puntero lista
	reg = aux->info; //Copiamos los datos del primer nodo a reg para tenerlos por referencia
	delete(aux); //liberamos el nodo
}
void acumular_fact_prod(Nodo*& lista, string codp, int cantv) {
	Nodo* aux = lista,*antaux=NULL; //Aux hace de puntero lista y antaux de puntero al nodo anterior
	while ((aux!=NULL)&&(aux->info.codp!=codp)) { //Buscamos secuencialmente hasta acabar la lista (primera condicion) o hasta que haya coincidencia de codp (segunda condicion)
		antaux = aux;
		aux = aux->sgte;
	}
	if (aux == NULL) { //Si llego al final de la lista o si no hay elementos en la lista, el producto no existe
		cout << "El producto vendido no existe en el listado, por favor ingrese los datos solicitados a continuación\n";
		Prod reg;
		reg.codp = codp; reg.tuv = cantv;
		cout << "Precio unitario: "; cin >> reg.pu;
		reg.totf = reg.pu * reg.tuv; //Llenamos reg con los datos del producto
		aux = new Nodo();
		aux->info = reg; //Hacemos un nodo nuevo y le metemos los datos que tenemos
		aux->sgte = NULL;
		if (antaux != NULL) { //Si el anterior a aux es distinto de nulo entonces estamos al final de la lista
			antaux->sgte = aux;
		}
		else { //Si antaux es nulo entonces no hay elementos en la lista aún
			lista = aux; 
		}
	}
	else { //En caso de que el while se detuviera por coincidencia de codp tendríamos que actualizar los datos del producto nada más
		aux->info.tuv = +cantv;
		aux->info.totf = aux->info.pu * aux->info.tuv;
	}
}
void mostrar_lista(Nodo* lista) {
	Nodo* aux = lista;
	cout << "La lista contiene los siguientes productos, ordenados de manera creciente por las unidades vendidas\n\n";
	while (aux != NULL) {
		cout << "Código de producto: " << aux->info.codp << "\tCantidad de unidades vendidas: " << aux->info.tuv << "\n";
		aux = aux->sgte;
	}
}
void ordenar_listado(Nodo*& lista) {
	Nodo* lista2 = NULL; Prod reg;
	while (lista != NULL) {
		eliminar_primero(lista, reg);
		inserta_ordenado(lista2, reg);
	}
	lista = lista2;
}
void inserta_final(Nodo*& lista, Prod reg) {
	Nodo* aux = lista, * nuevo = new Nodo();
	nuevo->info = reg;
	nuevo->sgte = NULL;
	if (aux == NULL) {
		lista = nuevo;
	}
	else {
		while (aux->sgte != NULL) {
			aux = aux->sgte;
		}
		aux->sgte = nuevo;
	}
}