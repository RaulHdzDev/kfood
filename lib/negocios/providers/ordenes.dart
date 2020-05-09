import 'package:flutter/cupertino.dart';

class Ordenes with ChangeNotifier{
  List<EsqueletoOrdenes> _ordenes = new List<EsqueletoOrdenes>();
  
  bool showButton = false;
  
  agregar(EsqueletoOrdenes orden, String idpedcomgui){
    if(orden != null){
      orden.idpedcomgui = idpedcomgui;
      _ordenes.add(orden);
    }
    notifyListeners();
  }

//
  fromJsonList(List<dynamic> jsonList){
    if(jsonList == null )return;
    for(var item in jsonList){
      final pedComGui = new EsqueletoOrdenes.jsonMapPedComGui(item);
      _ordenes.add(pedComGui);
    }
  }

//
   vacio(){
     return _ordenes.isEmpty;
   }

   List<EsqueletoOrdenes> get ordenes{
     return _ordenes;
   }

  int obtenerTotal(){
    int total = 0;
    for (EsqueletoOrdenes orden in _ordenes) {
      total += orden.total;
    }
    return total;
  }

  limpiarLista(){
    _ordenes.clear();
    notifyListeners();
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
  String precioUnitario;
  String estadoComida;
  String estadoguiso;


  EsqueletoOrdenes({this.nombre, this.cantidad, this.guiso,this.total, this.idpedido, this.idcomidas, this.idguisos});

  EsqueletoOrdenes.jsonMapPedComGui(Map<dynamic, dynamic> json){
    int precio_unitario = 0;
    String cantidadCadena;
    idpedcomgui = json['id_pedidos_comidas_guisos'];
    cantidadCadena = json['cantidad'];
    idcomidas = json['id_comidas'];
    nombre = json['nombre_comida'];
    precioUnitario = json['precio_unitario'];
    estadoComida = json['estado'];
    idguisos = json['id_guisos'];
    guiso = json['nombre_guiso'];
    estadoguiso = json['estado'];

    cantidad = int.parse(cantidadCadena);
    precio_unitario = int.parse(precioUnitario);
    total = cantidad * precio_unitario;

  }

}

class MismoPedido{
  static String idusuario;
  static String idpedido;
  static String hora;
}
