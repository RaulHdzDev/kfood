import 'dart:convert';
import 'package:kfood_app/datos/requests.dart';
import 'package:kfood_app/negocios/providers/ordenes.dart';

Future<void> registrarPedidoInicial(String idusuario, String idCafe) async{
  Map<String, String> inicial = {
    'id_usuarios' : idusuario,
    'cafe':'$idCafe'
  };
  return await executeHttpRequest(urlFile: '/registrarPedidoInicial.php', requestBody: inicial).then((value){
    print("Se pudo registrar? id=$idCafe --> $value");
    MismoPedido.idpedido = value;
  });
}


