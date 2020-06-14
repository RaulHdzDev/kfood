class Comida{

  String idComida;
  String nombreComida;
  String precioUnitario;
  String estado;
  bool isPlatillo;
  String idCafeteria;

  Comida(this.idComida, this.nombreComida, this.precioUnitario, this.estado, this.isPlatillo, this.idCafeteria);

  Comida.fromJsonMap(Map<dynamic, dynamic> json){
    idComida = json['idComida'];
    nombreComida = json['nombreComida'];
    precioUnitario = json['precioUnitario'];
    estado = json['estado'];
    isPlatillo = json['isPlatillo']=="1";
    idCafeteria = json['isCafeteria'];
  }

}