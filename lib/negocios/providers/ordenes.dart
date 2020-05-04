import 'package:flutter/cupertino.dart';

class Ordenes with ChangeNotifier{
  List<EsqueletoOrdenes> _ordenes = new List<EsqueletoOrdenes>();
  
  
  agregar(EsqueletoOrdenes orden){
    if(orden != null){
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

  int idUsuario;
  String estado;
  DateTime fecha;
  DateTime hora;

  EsqueletoOrdenes({this.nombre, this.cantidad, this.guiso,this.total, this.idUsuario, this.estado, this.fecha, this.hora});
}