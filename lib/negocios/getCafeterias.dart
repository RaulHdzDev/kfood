import 'dart:convert';
import 'package:kfood_app/negocios/providers/cafeterias.dart';
import 'package:kfood_app/presentacion/menuPage/foodPage/comida/foodPage.dart';


import 'package:kfood_app/datos/requests.dart';

Future<List<Tiendas>> getTiendasList(List<Tiendas> cafeterias) async {
  cafeterias?.clear();
  String response = await executeHttpRequest(urlFile: "/obtenerCafeterias.php", requestBody: null);
  final decodedData = json.decode(response);
  print(decodedData);
  final List<Tiendas> tripsList = [];
  for(var item in decodedData['cafeteria']){
    cafeterias.add(Tiendas(item['idCafe'],item['nombreCafe']));
    // print(item['nombreGuiso']);
  }
  return cafeterias;
}