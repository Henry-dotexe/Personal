#include <iostream>
#include <fstream>
#include <string>
using namespace std;
typedef char cad20[21];

int main(){
	char word[11], c; int opc = 0; string p, b = "Hola"; cad20 palabra;
	do {
		cout << "Ingrese una palabra (10 letras maximo): ";
		cin >> word; //tambien puede usarse palabra en lugar de word
		cout << "La palabra es: " << word;
		c = word[0];
		if (c == '.') {
			cout << "\nPIM\n";
		}
		p = word;
		if (p == ".") {
			cout << "PAM\n";
		}
		if (word==b) {
			cout << "\nPUM\n";
		}		
		cout << "\n\nDesea finalizar el programa? [0]\n";
		cin >> opc;
	} while (opc != 0);
	cout << "\nFin del programa\n";
	return 0;
}

