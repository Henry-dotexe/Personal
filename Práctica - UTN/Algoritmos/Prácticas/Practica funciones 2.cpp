#include <iostream>
#include <stdlib.h>
#include <locale.h>
using namespace std;
void contador(int &n);
void acumulador(int n, int &sum);
void Promedio(int sum1,int cant,float &prom);
void Porcentaje(int ctotal,int cgastada,float &porc);
int main() {
    int c = 0, a = 0, total = 0, dinero=500; float promedio = 0,por=0;
    cout << "Cuenta con 500$\n\nIngrese lo que gasto en la primera compra. Corte con 0\n";
    cin >> a;
    while (a != 0) {
        acumulador(a, total);
        contador(c);
        cout << "Ingrese lo que gasto en la siguiente compra. Corte con 0\n";
        cin >> a;
    }
    Porcentaje(dinero, total, por);
    Promedio(total,c,promedio);
    /*Ejemplo de ejercicio con notas
    el usuario ingresa las notas de sus alumnos
    Necesitas:
    - Cantidad (Se la pides al usuario o haces un ingreso con ciclo while y usas un contador)
    - Sumatoria de notas (En una variable suma_notas y usando un acumulador)
    Vas a mostrar por pantalla:
    - Promedio de notas  (con una función promedio)
    - Cantidad de alumnos aprobados (con un contador)
    - Porcentaje de alumnos aprobados (nota>6)
    */
    cout << "\nA lo largo del dia se gastaron " << total << "$\nLa persona hizo "<< c <<" compras\n";
    cout << "El promedio de gasto por compra es " << promedio << "$\n";
    cout << "Se gasto "<<por<<"% del dinero\n";
    cout << "\n\nFin del programa\n\a";
}
void contador(int &n) {
    n = n + 1;
}
void acumulador(int m, int& sum) {
    sum = sum + m;
}
void Promedio(int sum1, int cant, float& prom) {
    if (cant != 0) {
        prom = sum1 / cant;
    }
}
void Porcentaje(int ctotal, int cgastada, float &porc) {
    porc = (cgastada * 100) / ctotal;
}