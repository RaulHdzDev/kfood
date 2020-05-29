

import 'package:flutter/cupertino.dart';

class Cafeterias with ChangeNotifier{
  String _idcafeterias = '1';
  List<Tiendas> _datosCafeterias = [];


  get datosCafeterias{
    return _datosCafeterias;
  }

  set datosCafeterias(List<Tiendas> datosCafeterias){
    this._datosCafeterias = datosCafeterias;
    notifyListeners();
  }


  get cafeterias {
    return _idcafeterias;
  }

  set cafeterias(String cafeterias){
    this._idcafeterias = cafeterias;
    notifyListeners();
  }
}


class Tiendas {
  String id;
  String tienda;

  Tiendas(this.id, this.tienda);
  static List<Tiendas> getTiendas() {
    return <Tiendas>[];
  }
}