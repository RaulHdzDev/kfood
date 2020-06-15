import 'package:fluttertoast/fluttertoast.dart';
import 'package:kfood_app/datos/requests.dart';

import 'providers/ordenes.dart';

Future<void> confirmarPedido(String idpedido, String hora, int total, Ordenes ordenes) async{
  Map<String, String> inicial = {
    'id_pedido' : idpedido,
    'hora' : hora,
    'total' : total.toString()
  };
  print("el id del pedido es: $idpedido, $hora, $total");
  return await executeHttpRequest(urlFile: '/completarPedido.php', requestBody: inicial).then((value){
    print(value);
    if(value == 'exito'){
      ordenes.limpiarLista();
      Fluttertoast.showToast(
          msg: "Pedido realizado con éxito",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1);                          
      }
  });
}