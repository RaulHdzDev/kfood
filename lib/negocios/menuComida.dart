import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';

import 'package:kfood_app/datos/requests.dart';
import 'package:kfood_app/negocios/providers/comidas.dart';

Future<String> solicitarComida() async{
  return await executeHttpRequest(urlFile: '/obtenerComidas.php', requestBody: null);
}

Future<void> traerComida(Comidas innerComidas) async{
  
  return solicitarComida().then((value){
    final decodedData = json.decode(value);
    innerComidas.fromJsonList(decodedData['comida']);
    
  });
  
}