import 'package:flutter/material.dart';
import 'package:kfood_app/negocios/class/pedComGui.dart';
import 'package:flutter/cupertino.dart';

import 'ordenes.dart';

class CarritoIncompleto with ChangeNotifier{

  List<PedComGui> _pedComGui = new List<PedComGui>();  
  //agrega ordenes a la lista

  vacio(){
     return _pedComGui.isEmpty;
   }

  List<PedComGui> get carritoIncompleto {
    return _pedComGui;
  }

  set carritoIncompleto(List<PedComGui> carritoIncompleto){
    this._pedComGui = carritoIncompleto;
    notifyListeners();
  }
}