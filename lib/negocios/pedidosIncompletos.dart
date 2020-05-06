import 'package:kfood_app/datos/requests.dart';
import 'package:kfood_app/negocios/providers/ordenes.dart';

Future<String> obtenerPedidosIncompletos(String idusuario) async{
  Map<String, String> body = {
    'id_usuario' : idusuario,
  };
  return await executeHttpRequest(urlFile: '/obtenerPedidosIncompletos.php', requestBody: body).then((value){
    if(value != "null"){
      print(value);
      MismoPedido.idpedido = value;
    }
    
  });
}