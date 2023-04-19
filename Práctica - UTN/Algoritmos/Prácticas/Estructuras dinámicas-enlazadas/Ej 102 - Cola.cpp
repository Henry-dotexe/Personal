#include <iostream>
#include <string>

using namespace std;

struct tProd {
   int CodP;
   int PU;
};

struct Nodo {
   tProd Info;
   Nodo* sig;
};

void Agregar(Nodo* &fte, Nodo* &fin, tProd RInfo) {
   Nodo* pnue;
   pnue = new Nodo();
   pnue->Info = RInfo;
   pnue->sig = NULL;
   if (fte == NULL) {
      fte = pnue;
   }
   else {
      fin->sig = pnue;
   }
   fin = pnue;
}

void Suprimir(Nodo* & fte, Nodo* & fin, tProd & rInfo) {
   Nodo* ptr = fte;
   rInfo = ptr->Info;
   fte = fte->sig;
   delete ptr;
   if (fte == NULL) {
      fin = NULL;
   }
}

int main() {
   tProd rProd;
   Nodo* fte = NULL;
   Nodo* fin = NULL;

   cout << "Ingrese el codigo de producto" << endl;
   cin >> rProd.CodP;
   while (rProd.CodP != 0) {
      cout << "Ingrese el precio unitario" << endl;
      cin >> rProd.PU;
      Agregar(fte, fin, rProd);
      cout << "Ingrese el codigo de producto" << endl;
      cin >> rProd.CodP;
   }

   cout << "CodP  PU"<< endl;
   while (fte != NULL) {
      Suprimir(fte, fin, rProd);
      cout << " " << rProd.CodP << " - " << rProd.PU << endl;
   }

   return 0;
}
