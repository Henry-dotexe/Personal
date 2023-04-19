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

void InsertaNodo(Nodo*& lista, tProd Rprod, Nodo* &ptrnue)  //en ptrnue devuelve puntero al nodo insertado
{
   ptrnue = new Nodo();
   ptrnue->INFO.codp = Rprod.codp;
   Nodo* aux1 = lista;
   Nodo* aux2 = NULL;

   while ((aux1 != NULL) && (aux1->INFO.codp < Rprod.codp)) // cuando queremos insertar elementos en el MEDIO O FIN DE LA LISTA
   {
      aux2 = aux1;                  // Si va en el MEDIO O FINAL pasa esto y esto (*)
      aux1 = aux1->sgte;

   }

   //para saber si el nodo va a l principio de la lista, al medio o al final
   if (lista == aux1) // Con esto ya sabemos que si se cumple, el elemento que debemos insertar es menor al elemento que ya tenemos,
   {                 //por lo cual se insertaria en el PRINCIPIO DE LA LISTA.
      lista = ptrnue;  //si va al principio pasa ESTO y esto (**)
   }
   else
   {
      aux2->sgte = ptrnue; //(*)
   }
   ptrnue->sgte = aux1; //(*) y ()
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
