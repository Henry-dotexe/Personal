// Ejemplo archivo binario profe.cpp : Este archivo contiene la función "main". La ejecución del programa comienza y termina ahí.
//

#include <iostream>
#include <stdio.h>
using namespace std;

struct tVta {
    int codP;
    int cantV;
};

void GenerarArchivo() {
    tVta RVta;
    FILE* av;
    av= fopen("Ventas.dat", "wb");

    cout << "Ingrese codigo de producto (0 para cortar)" << endl;
    cin >> RVta.codP;
    while (RVta.codP != 0) {
        cout << "Ingrese cantidad vendida" << endl;
        cin >> RVta.cantV;
        fwrite(&RVta, sizeof(RVta), 1, av);
        cout << "Ingrese codigo de producto (0 para cortar)" << endl;
        cin >> RVta.codP;
    };
    fclose(av);
};


void LeerArchivo() {
    FILE* av = fopen("Ventas.dat", "r+b");
    tVta RVta;
    if (av == NULL) {
        cout << "ERROR! No existe el archivo" << endl;
        return;
    }
    fread(&RVta, sizeof(RVta), 1, av);
    while (!feof(av)) {   // feof se da cuenta que llegó al final del archivo sólo cuando intenta leer y la operacion falla
        cout << "Codigo de producto: " << RVta.codP << endl;
        cout << "Cantidad Vendida: " << RVta.cantV << endl;
        fread(&RVta, sizeof(RVta), 1, av);
    };
    fclose(av);
};

int main() {
    int opc = -1;
    do {
        cout << "Ingrese la opción deseada" << endl;
        cout << "1) Generar archivo" << endl;
        cout << "2) Leer archivo" << endl;
        cout << "0) Salir" << endl;
        cin >> opc;

        switch (opc) {
        case 0:
            cout << "Muchas gracias por utilizar el programa" << endl;
            break;
        case 1:
            GenerarArchivo();
            break;
        case 2:
            LeerArchivo();
            break;
        default:
            cout << "ERROR! La opcion seleccionada es invalida" << endl;
            break;
        }
    } while (opc != 0);
    return 0;
}
