import 'dart:convert';

import 'package:kfood_app/datos/requests.dart';
import 'package:kfood_app/negocios/providers/ordenes.dart';

Future<List<String>> obtenerPedidosComidasGuisos(String idpedido) async{
  Map<String, String> body = {
    'id_pedido' : idpedido
  };
  return await executeHttpRequest(urlFile: '/obtenerPedComGui.php', requestBody: body).then((value){
    // if(value != "null"){
    //   print(value);
    //   MismoPedido.idpedido = value;
    // }
    final decodedData = json.decode(value);
    innerComidas.fromJsonList(decodedData['comida']);

    
  });
}