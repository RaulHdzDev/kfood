import 'package:kfood_app/datos/requests.dart';
import 'package:kfood_app/negocios/providers/ordenes.dart';

Future<String> obtenerPedidosComidasGuisos(String idpedido) async{
  Map<String, String> body = {
    'id_pedido' : idpedido
  };
  return await executeHttpRequest(urlFile: '/obtenerPedidosIncompletos.php', requestBody: body).then((value){
    if(value != "null"){
      print(value);
      MismoPedido.idpedido = value;
    }
    
  });
}