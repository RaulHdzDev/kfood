import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';

import 'package:kfood_app/datos/requests.dart';
import 'package:kfood_app/negocios/providers/cafeterias.dart';
import 'package:kfood_app/negocios/providers/comidas.dart';

Future<String> solicitarComida(String cafe) async{
  Map<String, String> body ={
    'cafe' : cafe
  };
  return await executeHttpRequest(urlFile: '/obtenerComidas.php', requestBody: body);
}

Future<void> traerComida(Comidas innerComidas, String cafeterias) async{
  return solicitarComida(cafeterias).then((value){
    print("VALUE: $value");
    if (value != "[]"){
      final decodedData = json.decode(value);
      print("menuComida: $decodedData");
      innerComidas.fromJsonList(decodedData['comida']);
    }
    
  });
  
}