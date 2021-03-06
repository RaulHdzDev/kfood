import 'package:flutter/material.dart';
import 'package:kfood_app/negocios/class/comida.dart';

class Comidas with ChangeNotifier{

  //separa las comidas del json y las almacena en una lista
  List<Comida> _comidas = new List<Comida>();  
  fromJsonList(List<dynamic> jsonList){
    if(jsonList == null )return;
    for(var item in jsonList){
      final comida = new Comida.fromJsonMap(item);
      _comidas.add(comida);
    }
    notifyListeners();
  } 
  
  void limpiarLista(){
    _comidas.clear();
    notifyListeners();
  }

  get comidas {
    return _comidas;
  }

  set comidas(List<Comida> comidas){
    this._comidas = comidas;
    notifyListeners();
  }

}