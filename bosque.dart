import 'arbol.dart';
import 'nodo.dart';

main() {
  int nivelesMax = 3;
  int hijosXNivelMax = 4;
  int valorXRamaMax = 100;
  Arbol arbol = Arbol(nivelesMax, hijosXNivelMax, valorXRamaMax);
  nodo raiz = arbol.generarArbol();
  arbol.imprimir(raiz);
}
