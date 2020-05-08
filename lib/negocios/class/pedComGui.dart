class PedComGui{
  String idpedidoscomidasguisos;
  String cantidad;
  String idcomidas;
  String nombreComida;
  String precioUnitario;
  String estadoComida;
  String idguisos;
  String nombreguiso;
  String estadoguiso;

  PedComGui(this.idpedidoscomidasguisos, this.cantidad, this.idcomidas, this.nombreComida, this.precioUnitario, this.estadoComida, this.idguisos, this.nombreguiso, this.estadoguiso);

  PedComGui.jsonMapPedComGui(Map<dynamic, dynamic> json){
    idpedidoscomidasguisos = json['id_pedidos_comidas_guisos'];
    cantidad = json['cantidad'];
    idcomidas = json['id_comidas'];
    nombreComida = json['nombre_comida'];
    precioUnitario = json['precio_unitario'];
    estadoComida = json['estado'];
    idguisos = json['id_guisos'];
    nombreguiso = json['nombre_guiso'];
    estadoguiso = json['estado'];
  }
}