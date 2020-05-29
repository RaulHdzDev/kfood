import 'package:kfood_app/datos/requests.dart';
import 'package:kfood_app/negocios/obtenerPedidosComidasGuisos.dart';
import 'package:kfood_app/negocios/providers/ordenes.dart';

Future<void> obtenerPedidosIncompletos(String idusuario, Ordenes carrito) async{
  Map<String, String> body = {
    'id_usuario' : idusuario,
  };
  return await executeHttpRequest(urlFile: '/obtenerPedidosIncompletos.php', requestBody: body).then((value){
    if(value != "null"){
      MismoPedido.idpedido = value;
      traerPedComGui(MismoPedido.idpedido, carrito);
    }
  });
}