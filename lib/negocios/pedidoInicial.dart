import 'dart:convert';
import 'package:kfood_app/datos/requests.dart';
import 'package:kfood_app/negocios/providers/ordenes.dart';

Future<void> registrarPedidoInicial(String idusuario) async{
  Map<String, String> inicial = {
    'id_usuarios' : idusuario
  };
  return await executeHttpRequest(urlFile: '/registrarPedidoInicial.php', requestBody: inicial).then((value){
    MismoPedido.idpedido = value;
  });
}


