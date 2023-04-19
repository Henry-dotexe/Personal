#include <iostream>
using namespace std;

struct TProd {
   int codP;
   float PU;
};

struct Nodo {
   TProd Info;
   Nodo* sig;
};

void insertarNodo(Nodo* &lista, TProd RInfo){
    Nodo* pNue = new Nodo();
   pNue -> Info = RInfo;
   if((lista==NULL) || (pNue -> Info.codP < lista -> Info.codP)){
      pNue -> sig = lista;
      lista = pNue;
   } else {
      Nodo *ptr = lista;
      Nodo *antP;
      while((ptr != NULL) && (pNue -> Info.codP > ptr -> Info.codP)){
         antP = ptr;
         ptr = ptr -> sig;
      }
      antP -> sig = pNue;
      pNue -> sig = ptr;
   }
}

void ElminaPrimero(Nodo* &lista, TProd &RInfo){
   Nodo *ptr = lista;
   RInfo = ptr -> Info;
   lista = lista -> sig;
   delete ptr;
}

int main() {
   TProd RProd;
   Nodo *lista = NULL;

   cout << "Ingrese un Codigo de producto" << endl;
   cin >> RProd.codP;
   while(RProd.codP != 0){
      cout << "Ingrese un precio unitario" << endl;
      cin >> RProd.PU;
      insertarNodo(lista, RProd);
      cout << "Ingrese un Codigo de producto" << endl;
      cin >> RProd.codP;
   }

   cout << "CodP  PU"<< endl;
   while (lista!=NULL) {
      ElminaPrimero(lista, RProd);
      cout << " " << rProd.CodP << " - " << rProd.PU << endl;
   }
   return 0;
}
