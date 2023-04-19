#include <iostream>
#include <fstream>
using namespace std;
struct aux {
    char nombre[30];
    char domicilio[30];
    char comercio[30];
    int zona;
};
void crear() {
    aux auxiliar;
    FILE* f = fopen("parrilas.dat", "wb");
    cout << "Zona: "; cin >> auxiliar.zona;
    while (auxiliar.zona != 0) {
        cout << "Nombre: "; cin >> auxiliar.nombre;
        cout << "Domicilio: "; cin >> auxiliar.domicilio;
        cout << "Comercio: "; cin >> auxiliar.comercio;
        fwrite(&auxiliar, sizeof(auxiliar), 1, f);
        cout << "Zona: "; cin >> auxiliar.zona;
    }
    fclose(f);
}
void leer() {
    aux auxiliar;
    FILE* f = fopen("parrilas.dat", "rb");
    fread(&auxiliar, sizeof(auxiliar), 1, f);
    while (!feof(f)) {
        cout << "Zona: " << auxiliar.zona << "\tComercio: " << auxiliar.comercio << "\n\n";
        fread(&auxiliar, sizeof(auxiliar), 1, f);
    }
    fclose(f);
}
int main() {
    //crear();
    leer();
	return 0;
}