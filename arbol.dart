import 'dart:math';

import 'nodo.dart';

class Arbol {
  late int MaxNiveles;
  late int MaxHijos;
  late int MaxValores;
  Arbol(this.MaxNiveles, this.MaxHijos, this.MaxValores) {}

  nodo generarArbol() {
    nodo raiz = new nodo();
    raiz.nivel = 1;
    raiz.valor = generarValorNodo();
    raiz.cantHijos = generarCantHijos();
    raiz.padre = 0;
    nodo puntero = raiz;
    raiz = generarRamaz(puntero, raiz.padre);
    return raiz;
  }

  nodo generarRamaz(nodo puntero, int iDePadre) {
    if (puntero.nivel < MaxNiveles) {
      if (puntero.cantHijos > puntero.hijos.length) {
        puntero.hijos = generarHijos(puntero, iDePadre);
      }
      if (puntero.cantHijos == puntero.hijos.length) {
        for (int i = 0; i < puntero.cantHijos; i++) {
          generarRamaz(puntero.hijos[i], i);
        }
      }
    }
    return puntero;
  }

  void imprimir(nodo p) {
    print('nivel: ${p.nivel}, padre: ${p.padre} valor: ${p.valor}');
    if (p.hijos.length > 0) {
      for (int i = 0; i < p.hijos.length; i++) {
        imprimir(p.hijos[i]);
      }
    }
  }

  List<nodo> generarHijos(nodo padre, int iDePadre) {
    List<nodo> hijos = [];
    for (int i = 0; i < padre.cantHijos; i++) {
      nodo hijo = new nodo();
      hijo.nivel = padre.nivel + 1;
      hijo.valor = generarValorNodo();
      hijo.cantHijos = generarCantHijos();
      hijo.padre = iDePadre;
      hijos.add(hijo);
    }
    return hijos;
  }

  int generarCantHijos() => Random().nextInt(MaxHijos);
  int generarValorNodo() => Random().nextInt(MaxValores);
}
