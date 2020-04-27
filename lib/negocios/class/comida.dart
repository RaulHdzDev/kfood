class Comida{

  String idComida;
  String nombreComida;
  String precioUnitario;
  String estado;

  Comida(this.idComida, this.nombreComida, this.precioUnitario, estado);

  Comida.fromJsonMap(Map<dynamic, dynamic> json){
    idComida = json['idComida'];
    nombreComida = json['nombreComida'];
    precioUnitario = json['precioUnitario'];
    estado = json['estado'];
  }

}