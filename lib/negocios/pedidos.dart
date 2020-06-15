import 'package:kfood_app/datos/requests.dart';
import 'package:kfood_app/negocios/providers/ordenes.dart';

Future<String> registrarPedido(String idpedido, String idcomida, String idguiso, String cantidad, bool esPlatillo) async{
  Map<String, String> body = {
    'id_pedidos' : idpedido,
    'id_comidas' : idcomida,
    'id_guisos' : idguiso,
    'cantidad' : cantidad,
    'esPlatillo': '$esPlatillo'
  };
  return await executeHttpRequest(urlFile: '/registrarPedido.php', requestBody: body).then((value){
    return value;
  });
}