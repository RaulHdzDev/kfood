import 'package:flutter/cupertino.dart';

class Ordenes with ChangeNotifier{
  List<EsqueletoOrdenes> _ordenes = new List<EsqueletoOrdenes>();
  
  
  agregar(EsqueletoOrdenes orden, String idpedcomgui){
    if(orden != null){
      orden.idpedcomgui = idpedcomgui;
      _ordenes.add(orden);
    }
    notifyListeners();
  }

   vacio(){
     return _ordenes.isEmpty;
   }

   List<EsqueletoOrdenes> get ordenes{
     return _ordenes;
   }

  obtenerTotal(){
    int total = 0;
    for (EsqueletoOrdenes orden in _ordenes) {
      total += orden.total;
    }
    return total;
  }

}


class EsqueletoOrdenes{
  String nombre;
  int cantidad;
  String guiso;
  int total;
  String idpedido;
  String idcomidas;
  String idguisos;
  String idpedcomgui;

  EsqueletoOrdenes({this.nombre, this.cantidad, this.guiso,this.total, this.idpedido, this.idcomidas, this.idguisos});
}

class MismoPedido{
  static String idusuario;
  static String idpedido;
  static String hora;
}
