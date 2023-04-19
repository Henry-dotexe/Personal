#include <iostream>
#include <fstream>
#include <string>
#include <string.h>
using namespace std;

struct tproducto{
    int cod_prod;
    float precio_unitario;
};

struct Nodo
{
    tproducto info;
    Nodo* sig;
};

void meter(Nodo* &pila, tproducto dato){
    Nodo *ptrnue;
    ptrnue = new Nodo();
    ptrnue->info = dato;
    ptrnue->sig = pila;
    pila = ptrnue;
}

void sacar(Nodo* & pila, tproducto &r_producto){
    Nodo* ptr;
    ptr = pila;
    pila = pila -> sig;
    r_producto = ptr->info;
    delete ptr;
}


int main(){
    Nodo *pila;
    tproducto r_producto;
    pila = NULL;

    cout << "Ingresar codigo de producto" << endl;
    cin >> r_producto.cod_prod;
    while(r_producto.cod_prod != 0){
        cout << "Ingresar precio unitario" << endl;
        cin >> r_producto.precio_unitario;
        meter(pila, r_producto);
        cout << "Ingresar codigo de producto" << endl;
        cin >> r_producto.cod_prod;
    }
    while(pila != NULL){
        sacar(pila, r_producto);
        cout << r_producto.cod_prod << endl;
        cout << r_producto.precio_unitario << endl;
        cout << "---------------------------" << endl;
    }

    return 0;
}
