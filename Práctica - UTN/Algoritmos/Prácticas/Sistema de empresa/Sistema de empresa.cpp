/*Sistema de stock básico de una empresa de productos para la casa
Costará de un menú con el que se pueden ingresar y ver productos para mantener un stock
Tendrá opcion de eliminar tambien dichos productos, o restarlos en caso de venta
Imprimirá recibos de venta cuando se pueda efectuar la misma*/
#include <iostream>
#include <stdlib.h>
#include <locale.h>
#include <fstream>
using namespace std;
typedef char cad30[31];
struct Prod {
	cad30 nombre;
	int codp;
	int stock;
	int precio;
};
struct Venta {
	int codp;
	int cantv;
};
void menu_principal();
void submenu_ingreso();
void generar_archivo();
void mostrar_stock();
void submenu_ventas();
void generar_archivo_ventas();
void mostrar_ventas();
void generar_archivo_ventas();
void venta();
void exportar_factura();
bool existe_producto(FILE* f,int cod);
bool restar_stock(int cant,int cod);
void agregar_producto();
void agregar_unidades();
void eliminar_producto();

int main() {
	setlocale(LC_ALL,"spanish");
	menu_principal();
	system("cls");
	cout << "Gracias por utilizar el programa!\n\a";
	return 0;
}
void menu_principal() {
	int opc = 0;
	do {
		cout << "\n\n\t\t\t\t\t\t~Menu Principal~\n\n"; 
		cout << "\t\t\t\t\t[1]Ingresar productos\n\t\t\t\t\t[2]Ver productos en stock\n\t\t\t\t\t[3]Menú de ventas\n\t\t\t\t\t[4]Eliminar producto del stock\n\t\t\t\t\t[0]Salir\n\n";
		cout << "\t\t\t\t\tIngrese una opcion [ ]\b\b"; cin >> opc;
		switch (opc) {
		case 1:
			system("cls");
			submenu_ingreso();
			break;
		case 2:
			system("cls");
			mostrar_stock();
			break;
		case 3:
			system("cls");
			submenu_ventas();
			break;
		case 4:
			system("cls");
			mostrar_stock();
			eliminar_producto();
			break;
		}
	} while (opc != 0);

}
void submenu_ingreso() {
	int opc = 0;
	do {
		cout << "\n\n\t\t\t\t~Menú de ingresos~\n";
		cout << "\t\t\t[1]Ingresar productos nuevos al stock\n\t\t\t[2]Agregar unidades a un producto existente\n\t\t\t[3]Sobreescribir archivo de stock\n\t\t\t[0]Salir\n";
		cout << "\t\t\tIngrese una opcion [ ]\b\b"; cin >> opc;
		switch (opc) {
		case 1:
			system("cls");
			agregar_producto();
			break;
		case 2:
			system("cls");
			mostrar_stock();
			agregar_unidades();
			break;
		case 3:
			system("cls");
			generar_archivo();
			break;
		}
	} while (opc!=0);
	system("cls");
}
void generar_archivo() {
	Prod reg; char c;
	FILE* Arcp = fopen("Stock.dat", "wb");
	cout << "Ingrese los datos de cada producto, cortar con \".\"\n";
	cout << "Nombre del producto: "; cin >> reg.nombre; c = reg.nombre[0];
	while (c!='.') {
		cout << "Codigo de producto: "; cin >> reg.codp;
		cout << "Cantidad: "; cin >> reg.stock;
		cout << "Precio unitario: "; cin >> reg.precio;
		fwrite(&reg, sizeof(reg), 1, Arcp);
		system("cls");
		cout << "Ingrese los datos de cada producto, cortar con \".\"\n";
		cout << "Nombre del producto: "; cin >> reg.nombre; c = reg.nombre[0];
	}
	system("cls");
	cout << "\t\tArchivo generado!\n";
	fclose(Arcp);
}
void agregar_producto() {
	Prod reg; char c;
	FILE* Arcp = fopen("Stock.dat", "rb+");
	cout << "Ingrese los datos de cada producto, cortar con \".\"\n";
	cout << "Nombre del producto: "; cin >> reg.nombre; c = reg.nombre[0];
	while (c != '.') {
		cout << "Codigo de producto: "; cin >> reg.codp;
		if (!existe_producto(Arcp, reg.codp)) {
			cout << "Cantidad: "; cin >> reg.stock;
			cout << "Precio unitario: "; cin >> reg.precio;
			fseek(Arcp, 0, SEEK_END);
			fwrite(&reg, sizeof(reg), 1, Arcp);
			system("cls");
			cout << "\tProducto agregado!\n\n";
		}
		else {
			system("cls");
			cout << "Ya existe un producto con ese código, ingresar uno nuevo\a\n\n";
		}
		cout << "Ingrese los datos de cada producto, cortar con \".\"\n";
		cout << "Nombre del producto: "; cin >> reg.nombre; c = reg.nombre[0];
	}
	system("cls");
	fclose(Arcp);
}
void agregar_unidades() {
	Prod reg; int codigo = 0,cant=0;
	FILE* Arcp = fopen("Stock.dat", "rb+");
	cout << "\nIngrese el codigo del producto que esta reabasteciendo\n"; cin >> codigo;
	if (existe_producto(Arcp, codigo)) {
		cout << "Ingrese la cantidad de unidades que esta agregando\n"; cin >> cant;
		fseek(Arcp, 0, SEEK_SET);
		fread(&reg, sizeof(reg), 1, Arcp);
		while (reg.codp != codigo) {
			fread(&reg, sizeof(reg), 1, Arcp);
		}
		int pos = ftell(Arcp) - sizeof(reg);
		fseek(Arcp, pos, SEEK_SET);
		reg.stock =+ cant;
		fwrite(&reg, sizeof(reg), 1, Arcp);
		system("cls");
		cout << "\tProducto reabastecido!\n\n";
	}
	else {
		system("cls");
		cout << "No existe producto con dicho codigo, debe agregarlo al archivo\n";
	}
	fclose(Arcp);
}
void mostrar_stock() {
	Prod reg;
	FILE* Arcp = fopen("Stock.dat", "rb");
	if (Arcp == NULL) {
		cout << "Archivo de stock inexistente";
		system("cls"); return;
	}
	fread(&reg, sizeof(reg), 1, Arcp);
	while (!feof(Arcp)) {
		if (reg.codp!=(-1)) {
			cout << "\tCod: " << reg.codp << "\t//\tNombre: " << reg.nombre << "\n\tPrecio: " << reg.precio << "$\t//\tCantidad restante: " << reg.stock << "\n\n";
		}
		fread(&reg, sizeof(reg), 1, Arcp);
	}
	cout << "\n\tFin de la lectura!\n";
	fclose(Arcp);
}
void eliminar_producto() {
	Prod reg; int codp = 0;
	FILE* Arcp = fopen("Stock.dat", "rb+");
	cout << "Ingrese el codigo del producto que desea eliminar\n"; cin >> codp;
	if (existe_producto(Arcp,codp)) {
		fseek(Arcp, 0, SEEK_SET);
		fread(&reg, sizeof(reg), 1, Arcp);
		while (codp != reg.codp) {
			fread(&reg, sizeof(reg), 1, Arcp);
		}
		int pos = ftell(Arcp) - sizeof(reg);
		fseek(Arcp, pos, SEEK_SET);
		reg.codp = (-1);
		fwrite(&reg, sizeof(reg), 1, Arcp);
		system("cls");
		cout << "\tProducto eliminado satisfactoriamente!\n\n";
	}
	else {
		cout << "\tNo existen productos con dicho codigo\n\n";
	}
	fclose(Arcp);
}
bool existe_producto(FILE* f,int cod) {
	Prod reg;
	fseek(f, 0, SEEK_SET);
	fread(&reg, sizeof(reg), 1, f);
	while (!feof(f)) {
		if (reg.codp==cod) {
			return true;
		}
		fread(&reg, sizeof(reg), 1, f);
	}
	return false;
}
void submenu_ventas() {
	int opc = 0;
	do {
		cout << "\n\n\t\t\t\t~Menú de ventas~\n";
		cout << "\t\t\t[1]Efectuar una venta\n\t\t\t[2]Ver archivo de ventas\n\t\t\t[3]Crear/Borrar archivo de ventas\n\t\t\t[4]Exportar factura de ventas\n\t\t\t[0]Salir\n";
		cout << "\t\t\tIngrese una opcion [ ]\b\b"; cin >> opc;
		system("cls");
		switch (opc) {
		case 1:
			venta();
			break;
		case 2:
			mostrar_ventas();
			break;
		case 3:
			generar_archivo_ventas();
			break;
		case 4:
			exportar_factura();
			break;
		}
	} while (opc != 0);
	system("cls");
}
void generar_archivo_ventas() {
	Venta reg;
	FILE* arcven = fopen("Ventas.dat", "wb+");
	cout << "Ingrese datos de la primera venta del día\n";
	cout << "Código: "; cin >> reg.codp;
	cout << "Cantidad vendida: "; cin >> reg.cantv;
	if (restar_stock(reg.cantv, reg.codp)) {
		fwrite(&reg, sizeof(reg), 1, arcven);
		system("cls"); cout << "Venta efectuada!\n\n";
	}
	else {
		cout << "Stock insuficiente del producto, venta rechazada\n\n";
	}
	fclose(arcven);
}
void mostrar_ventas() {
	Venta reg;
	FILE* arcven = fopen("Ventas.dat", "rb+");
	fread(&reg, sizeof(reg), 1, arcven);
	cout << "Codigo de producto\tCantidad vendida\n";
	while (!feof(arcven)) {
		cout << "     " << reg.codp << "\t\t\t  " << reg.cantv << "\n";
		fread(&reg, sizeof(reg), 1, arcven);
	}
	fclose(arcven);
}
bool restar_stock(int cant,int cod) {
	Prod reg;
	FILE* Arcp = fopen("Stock.dat", "rb+");
	fread(&reg, sizeof(reg), 1, Arcp);
	while (reg.codp != cod) {
		fread(&reg, sizeof(reg), 1, Arcp);
	}
	if (reg.stock >= cant) {
		reg.stock = reg.stock - cant;
		int pos = ftell(Arcp) - sizeof(reg);
		fseek(Arcp,pos, SEEK_SET);
		fwrite(&reg, sizeof(reg), 1, Arcp);
		fclose(Arcp);
		return true;
	}
	else {
	fclose(Arcp);
	return false;
	}
}
void venta(){
	Venta reg;
	FILE* arcven = fopen("Ventas.dat", "rb+");
	fseek(arcven, 0, SEEK_END);
	cout << "Ingrese datos de la venta\n";
	cout << "Código: "; cin >> reg.codp;
	while (reg.codp != 0) {
		cout << "Cantidad vendida: "; cin >> reg.cantv;
		if (restar_stock(reg.cantv, reg.codp)) {
			fwrite(&reg, sizeof(reg), 1, arcven);
			system("cls"); cout << "Venta efectuada!\n\n";
		}
		else {
			system("cls"); 
			cout << "Stock insuficiente del producto, venta rechazada\n\n";
		}
		cout << "Ingrese datos de la venta\n";
		cout << "Código: "; cin >> reg.codp;
	}
	system("cls"); cout << "Fin del ingreso de ventas\n\n";
	fclose(arcven);
}
void exportar_factura(){
	Venta reg; 
	FILE* arcven = fopen("Ventas.dat", "rb+");
	ofstream fout;
	fout.open("Factura_ventas.txt");
	fread(&reg, sizeof(reg), 1, arcven);
	fout << "Informe de las ventas del día\n\n";
	fout<< "Codigo de producto\tCantidad vendida\n";
	while (!feof(arcven)) {
		fout << "     " << reg.codp << "\t\t\t  " << reg.cantv << "\n";
		fread(&reg, sizeof(reg), 1, arcven);
	}
	fout.close();
	fclose(arcven);
}