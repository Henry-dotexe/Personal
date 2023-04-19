#include <iostream>
using namespace std;
void Maxmin();
void Maxmin_arreglos();
int main(){
    //Maximos y minimos
    int opc = 0;
    do {
        cout << "Ingrese una opción:\n[1]Maximos y mínimos con arreglos\n[2]Maximos y minimos sin arreglos\n[3]Maximos y minimos con funciones\n[0]Salir\n\n";
        cin >> opc;
        switch (opc) {
        case 1:
            Maxmin_arreglos();
            break;
        case 2:
            Maxmin();
            break;
        case 3:
            //Maxmin_func();
            break;
        }
    } while (opc!=0);
    cout << endl << "Gracias por utilizar el programa!" << endl;
    return 0;
}
void Maxmin() {
    int n = 0, max = 0, min=0 , i=0;
    cout << "Ingrese numeros para determinar el mayor y el menor de ellos. Cortar con 0\n\n";
    cin >> n;
    while (n != 0) {
        if ((i==0)||(n>max)) {
            max = n;
        }
        if ((i==0)||(n<min)) {
            min = n;
        }
        i++;
        cout << "Ingrese un nuevo numero\n";
        cin >> n;
    }
    cout << "El mayor de todos lo numero ingresados es " << max << endl;
    cout << "El menor de todos los numeros ingresados es " << min << endl;
}
void Maxmin_arreglos() {
    int num[10], max = 0, min = 0;
    //Ingresamos 10 números y escogemos el mayor y el menor de todos, conservandolos en un arreglo sin perderlos.
    cout << "Ingrese 10 numeros para informar el mayor y el menor de ellos" << endl;
    for (int i = 0; i <= 9; i++) {
        cin >> num[i];
    }
    //Escogemos como maximo y minimo el primer número, y con ese comparamos los siguientes
    for (int i = 0; i <= 9; i++) {
        if (i == 0) { //primera vuelta, guardamos el primer min/max
            max = num[i];
            min = num[i];
        }
        //En el resto de vueltas hacemos las comparaciones
        if (num[i] > max) { //Si el num el mayor que el max, nuevo max
            max = num[i];
        }
        if (num[i] < min) { //Si el num es menor que el min, nuevo min
            min = num[i];
        }
    }
    cout << endl << "El mayor de los numeros es " << max << endl;
    cout << "El menor de los numeros es " << min << endl << endl;
    cout << "Los numeros son:" << endl;
    for (int i = 0; i <= 9; i++) {
        cout << num[i] << endl;
    }
}
