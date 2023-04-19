//============================================================================
// Name        : EjArqueros.cpp
// Author      : 
// Version     :
// Copyright   : Your copyright notice
// Description : Hello World in C++, Ansi-style
//============================================================================

#include <iostream>
using namespace std;
void Ganador(int n2,int ptje,int part,int &pmax,int &ptjemax){
   if (n2==0){
      pmax=part;
      ptjemax=ptje;
   }else{
      if (ptje>ptjemax){
         pmax=part;
         ptjemax=ptje;
      }
   }
}
void Contador(int &cont){
   cont=(cont+1);
}
void Acumulador(int n1,int &sum){
   sum=(sum+n1);
}
void Puntaje(int c1,int &pts1){
   if (c1==0){
      pts1=100;
   }else{
      if ((c1>0)&&(c1<3)){
         pts1=50;
      }else{
         pts1=30;
      }
   }
}
void FCuadrante(float a,float b,int &c){
   if ((a>0)&&(b>0)){
      c=1;
   }else{
      if ((a<0)&&(b>0)){
         c=2;
      }else{
         if ((a<0)&&(b<0)){
            c=3;
         }else{
            if ((a>0)&&(b<0)){
               c=4;
            }else{
               if ((a==0)&&(b==0)){
                  c=0;
               }
            }
         }
      }
   }
}
int main() {
   //Este programa calcula los puntajes de algunos participantes de una competencia de arquería
   //Por cada integrante se ingresa su número de competidor y los datos de 5 disparos con coordenadas X e Y
   //Según el cuadrante (plano cartesiano) cada disparo equivale a cierto puntaje
   //Cortar con número de integrante 0, y representar los resultados en una tabla
   int n,cuad,d,dc,p,pts,partypunt[9999][2],puntaje,partmax,puntajemax; //Arreglo:Participantes y puntajes (1 para n° de part y 2 para su puntaje9
   float x,y;
   n=0;
   dc=0;
   //
   cout << "Por favor ingrese el n° de competidor:"<< endl;
   cin >> partypunt[n][0];
   while (partypunt[n][0]!=0){
   puntaje=0;
      for (d=0;d<=4;d++){
         cout << "Ingrese las coordenadas del disparo n°" << d+1<< " separadas por enter:" << endl;
         cin >> x;
         cin >> y;
         FCuadrante(x,y,cuad); //Defino el cuadrante del disparo
         cout<< cuad;
         Puntaje(cuad,pts);  //Asigno puntos segun el cuadrante
         Acumulador(pts,puntaje); //Acumulo esos puntos en una sumatoria
         if (cuad==0){
             Contador(dc);
             cout<< "Cuadrante cero"<<endl;
         }
      }

   Ganador(n,puntaje,partypunt[4][0],partmax,puntajemax);
   partypunt[n][1]=(puntaje); //Asigno la sumatoria de los puntos a su espacio junto al n° de participante en la tabla
   cout<<"El participante n° "<<n+1<<" obtuvo "<<puntaje<<" puntos durante su turno"<<endl;
   Contador(n);
   cout << "Fin ingreso de participante"<< endl;
   cout << "Por favor ingrese el n° del siguiente competidor"<< endl; //Ingreso del siguiente participante
    cin >> partypunt[n][0];
   }
   //Resultados de la competencia
      cout<<"A continuación se muestran los resultados del torneo de arquería"<<endl;
      cout<< "======================"<<endl;
      cout<< "| Participante | Pts |"<<endl;
      cout<< "======================"<<endl;
   for (p=0;p<=(n-1);p++){
      cout<< "|      "<<partypunt[p][0]<<"       | "<<partypunt[p][1]<<" |"<<endl;
   }
      cout<< "======================"<<endl;
      cout<< "El ganador del torneo es el participante n°"<<partmax<<" con un puntaje de "<<puntajemax<<" puntos."<<endl;
      cout<< "En toda la competencia se dieron "<< dc <<" disparos en el centro de la diana."<<endl;
	return 0;
}
